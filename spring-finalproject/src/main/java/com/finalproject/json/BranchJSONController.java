package com.finalproject.json;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.finalproject.model.Branch;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.BranchInventory;
import com.finalproject.model.BranchOrder;
import com.finalproject.model.BranchOrderDetail;
import com.finalproject.model.BranchSales;
import com.finalproject.model.BranchSalesDetail;
import com.finalproject.model.LargeCategory;
import com.finalproject.model.Product;
import com.finalproject.model.SmallCategory;
import com.finalproject.service.BranchService;

@RestController
public class BranchJSONController {
	
	@Autowired BranchService brService;
	
	// 전체 대분류 조회
	@RequestMapping(value="/lcat/", method=RequestMethod.GET)
	public List<LargeCategory> getAllLargeCatsByBranch() {
		return brService.getAllLargeCats();
	}
	
	// 대분류 번호로 소분류 조회
	@RequestMapping(value="/scat/{no}", method=RequestMethod.GET)
	public List<SmallCategory> getSmallCatsByLargeNo(@PathVariable("no") int no) {
		return brService.getSmallCatsByLargeNo(no);
	}
	
	// 소분류 번호로 물품 조회
	@RequestMapping(value="/pt/{no}", method=RequestMethod.GET)
	public List<Product> getProductsBySmallNo(@PathVariable("no") int no) {
		return brService.getProductsBySmallNo(no);
	}
	
	// 모든 물품 조회
	@RequestMapping(value="/pt/", method=RequestMethod.GET)
	public List<Product> getAllProductsFromCompany() {
		return brService.getAllProductsFromCompany();
	}
	
	// 물품 번호로 재고 조회하기
	@RequestMapping(value="/inv/{brno}/pno/{pno}", method=RequestMethod.GET)
	public List<BranchInventory> getBranchInvenByProductNo(@PathVariable("brno") int brno, @PathVariable("pno") int pno) {
		Map<String, Object> map = new HashMap<>();
		map.put("branchNo", brno);
		map.put("productNo", pno);
		
		return brService.getBranchInvenByProductNo(map);
	}
	
	// 발주대기 주문 조회
	@RequestMapping(value="/wor/{brno}", method=RequestMethod.GET)
	public List<BranchOrderDetail> getWaitingOrder(@PathVariable("brno") int no) {
		return brService.getWaitingOrderDetail(no);
	}
	
	// 재고에서 발주대기로 발주추가
	@RequestMapping(value="/wor/{brno}", method=RequestMethod.POST)
	public List<BranchOrderDetail> addWaitingOrderDetail(@RequestBody List<BranchOrderDetail> detailList, @PathVariable("brno") int brno) {
		List<BranchOrderDetail> list = brService.getWaitingOrderDetail(brno);
		BranchOrder waitingOrder = brService.getBranchOrderByIsCartNo(brno);
		
		if (waitingOrder != null && list.isEmpty()) {			
			System.out.println("웨이팅오더리스트 없음");
			for (BranchOrderDetail d : detailList) {
				if (d.getQty() != 0) {
					BranchOrderDetail detail = new BranchOrderDetail();
					detail.setOrder(waitingOrder);
					
					Product product = brService.getProductByNo(d.getProduct().getNo());
					detail.setProduct(product);
					detail.setQty(d.getQty());
					
					brService.addOrderDetail(detail);
				}
			}
				
		}
		
		if (waitingOrder != null && !list.isEmpty()) {			
			System.out.println("웨이팅오더리스트 있음");
			List<Map<String, Object>> maps = new ArrayList<>();
			for (BranchOrderDetail d : detailList) {	
				if (d.getQty() != 0) {
					Map<String, Object> map = new HashMap<>();
					map.put("branchNo", brno);
					map.put("productNo", d.getProduct().getNo());
					map.put("qty", d.getQty());
					
					maps.add(map);
				}
			}
			System.out.println(maps);
			
			for (Map<String, Object> map : maps) {
				int pno = (Integer)map.get("productNo");
				for (BranchOrderDetail dd : list) {
					if (pno == dd.getProduct().getNo()) {
						System.out.println("번호 같음");
						
						BranchOrderDetail detail = brService.getOrderDetailByProNo(map);
						detail.setQty(detail.getQty() + (Integer)map.get("qty"));
						
						brService.updateBranchOrderDetail(detail);
						break;
						
					} else {
						System.out.println("번호 다름");
						
						BranchOrderDetail detail = new BranchOrderDetail();
						detail.setOrder(waitingOrder);
						Product product = brService.getProductByNo((Integer)map.get("productNo"));
						detail.setProduct(product);
						detail.setQty((Integer)map.get("qty"));
						
						brService.addOrderDetail(detail);
						break;
					}
				}
			}
		}
		if (waitingOrder == null) {
			System.out.println("웨이팅오더 없음");
			BranchOrder order = new BranchOrder();
			order.setBranchNo(brno);
			brService.addOrder(order);
			
			for (BranchOrderDetail d : detailList) {	
				if (d.getQty() != 0) {
					BranchOrder newOrder = brService.getBranchOrderByIsCartNo(brno);
					
					BranchOrderDetail detail = new BranchOrderDetail();
					detail.setOrder(newOrder);
					
					Product product = brService.getProductByNo(d.getProduct().getNo());
					detail.setProduct(product);
					detail.setQty(d.getQty());
					
					brService.addOrderDetail(detail);
				}
			}
			
		}
		return brService.getWaitingOrderDetail(brno);
	}

	// 발주대기 목록에서 삭제
	@RequestMapping(value="/wor/{brno}/del/{no}", method=RequestMethod.DELETE)
	public List<BranchOrderDetail> deleteOrderDetailByNo(@PathVariable("no") int no, @PathVariable("brno") int brno ) {
		brService.deleteWaitingByOrderDetailNo(no);
		return brService.getWaitingOrderDetail(brno);
	}
	
	// 지점번호로 재고 조회하기
	@RequestMapping(value="/inv/{brno}", method=RequestMethod.GET)
	public List<BranchInventory> getAllInvenByBranchNo(@PathVariable("brno") int brno) {
		return brService.getAllInvenByBranchNo(brno);
	}
	
	// 재고 검색 키워드 보내기
	@RequestMapping(value="/inv/{brno}/key/{key}/q/{q}", method=RequestMethod.POST)
	public List<BranchInventory> searchInvenByKeyword(@PathVariable("key") String key, 
									@PathVariable("q") String q,
									@PathVariable("brno") int brno) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("branchNo", brno);
		map.put("keyword", q);
		map.put("type", key);
		
		return brService.getInvenByKeyword(map);
	}
	
	// 재고 검색 키워드 받아서 조회하기
	@RequestMapping(value="/inv/{brno}/key/{key}/q/{q}", method=RequestMethod.GET)
	public List<BranchInventory> getInvenByKeyword(@PathVariable("key") String key, 
									@PathVariable("q") String q,
									@PathVariable("brno") int brno) {
		
		Map<String, Object> map = new HashMap<>();

		map.put("branchNo", brno);
		map.put("keyword", q);
		map.put("type", key);
		
		return brService.getInvenByKeyword(map);
	}
	
	// 발주 내역 조회하기
	@RequestMapping(value="/or/{brno}", method=RequestMethod.GET)
	public List<BranchOrder> getOrdersByBranchNo(@PathVariable("brno") int brno) {
		return brService.getOrdersByBranchNo(brno);
	}
	
	// 발주 상세내역 조회하기
	@RequestMapping(value="/or/d/{no}", method=RequestMethod.GET)
	public List<BranchOrderDetail> getOrderDetailsByOrderNo(@PathVariable("no") int no) {
		return brService.getOrderDetailsByOrderNo(no);
	}
	
	// 발주내역 날짜별 검색 리스트 조회하기
	@RequestMapping(value="/or/{brno}/d1/{date1}/d2/{date2}", method=RequestMethod.GET)
	public List<BranchOrder> getOrdersByRegDate(@PathVariable("brno") int brno,
												@PathVariable("date1") String date1,
												@PathVariable("date2") String date2) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("branchNo", brno);
		map.put("date1", date1);
		map.put("date2", date2);
		
		return brService.getOrdersByRegDate(map);
	}
	
	// 발주내역 날짜별 검색키워드 보내기
	@RequestMapping(value="/or/{brno}/d1/{date1}/d2/{date2}", method=RequestMethod.POST)
	public List<BranchOrder> searchOrderByRegDate(@PathVariable("brno") int brno,
												@PathVariable("date1") String date1,
												@PathVariable("date2") String date2) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("branchNo", brno);
		map.put("date1", date1);
		map.put("date2", date2);
		
		return brService.getOrdersByRegDate(map);
	}
	
	@RequestMapping(value="/sales/add/{empno}/pno/{pno}", method=RequestMethod.GET)
	public List<BranchSalesDetail> getBranchSalesDetailBySalesNo(@PathVariable("empno") int empno, @PathVariable("pno") int pno) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empno);
		map.put("issaled", 'N');
		
		BranchSales sale = brService.getBranchSalesByNotIsSaled(map);
		if (sale == null) {
			System.out.println("null");
			return null;
		} else {
			System.out.println("null아님");
			System.out.println(sale.getNo());
			List<BranchSalesDetail> list = brService.getBranchSalesDetailBySalesNo(sale.getNo());
			for (BranchSalesDetail d : list) {
				System.out.println("product" + d.getProduct().getNo());
				System.out.println("sales" + d.getBranchSales().getNo());
			}
			return brService.getBranchSalesDetailBySalesNo(sale.getNo());
			//xml바꿨으니 나오는지 확인 하자
		}
	}
	
	@RequestMapping(value="/sales/add/{empno}/pno/{pno}", method=RequestMethod.POST)
	public List<BranchSalesDetail> addBranchSales(@PathVariable("empno") int empno, @PathVariable("pno") int pno) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empno);
		map.put("issaled", 'N');
		
		BranchSales sale = brService.getBranchSalesByNotIsSaled(map);
						
		BranchEmp emp = brService.getBrEmpByNo(empno);
		Branch branch = brService.getBranchByNo(emp.getBranch().getNo());

		if (sale == null) {
			BranchSales newSale = new BranchSales();
			newSale.setBranch(branch);
			newSale.setBrEmp(emp);
			brService.addBranchSales(newSale);
			
			newSale = brService.getBranchSalesByNotIsSaled(map);
			BranchSalesDetail detail = new BranchSalesDetail();
			detail.setBranchSales(newSale);
			Product product = brService.getProductByNo(pno);
			detail.setProduct(product);
			brService.addBranchSalesDetail(detail);

			return brService.getBranchSalesDetailBySalesNo(newSale.getNo());
			
		} else {
			List<BranchSalesDetail> list = brService.getBranchSalesDetailBySalesNo(sale.getNo());
			
			for (BranchSalesDetail d : list) {
				if (list!= null && d.getProduct().getNo() == pno) {
					d.setQty(d.getQty() + 1);
					brService.updateBranchSalesDetail(d);
				} else {
					BranchSalesDetail detail = new BranchSalesDetail();
					detail.setBranchSales(sale);
					Product product = brService.getProductByNo(pno);
					detail.setProduct(product);
					brService.addBranchSalesDetail(detail);
				}
			}
			return brService.getBranchSalesDetailBySalesNo(sale.getNo());
		}
		
	}
	
	@RequestMapping(value="/sales/add//{empno}", method=RequestMethod.POST)
	public List<BranchSalesDetail> addBranchSalesDetail(@RequestBody List<BranchSalesDetail> detailList, @PathVariable("empno") int empno) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empno);
		map.put("issaled", 'N');
		
		BranchSales sale = brService.getBranchSalesByNotIsSaled(map);
						
		BranchEmp emp = brService.getBrEmpByNo(empno);
		Branch branch = brService.getBranchByNo(emp.getBranch().getNo());
		
		if (sale == null) {
			BranchSales newSale = new BranchSales();
			newSale.setBranch(branch);
			newSale.setBrEmp(emp);
			brService.addBranchSales(newSale);
			
			newSale = brService.getBranchSalesByNotIsSaled(map);
			
			for (BranchSalesDetail d : detailList) {
				BranchSalesDetail saleDetail = new BranchSalesDetail();
				saleDetail.setBranchSales(newSale);
				
				Product product = d.getProduct();
				saleDetail.setProduct(product);
				saleDetail.setQty(d.getQty());
			}
		} else {
			for (BranchSalesDetail d : detailList) {
				BranchSalesDetail saleDetail = new BranchSalesDetail();
				saleDetail.setBranchSales(sale);
				
				Product product = d.getProduct();
				saleDetail.setProduct(product);
				saleDetail.setQty(d.getQty());
			}
		}
		
		return brService.getBranchSalesDetailBySalesNo(sale.getNo());
	}
	
	
}
