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
	
	@RequestMapping(value="/pno/{pno}", method=RequestMethod.GET)
	public List<Product> getProduct(@PathVariable("pno") int pno) {
		List<Product> list = new ArrayList<>();
		list.add(brService.getProductByNo(pno));
		return list;
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
	
	// 검색 키워드 받아서 본사 물품 조회하기
	@RequestMapping(value="/pt/key/{key}/q/{q}", method=RequestMethod.GET)
	public List<Product> getProductsByKeyword(@PathVariable("key") String key, 
									@PathVariable("q") String q) {
		
		Map<String, Object> map = new HashMap<>();

		map.put("keyword", q);
		map.put("type", key);
		
		return brService.getProductsByKeyword(map);
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
	
	// 판매 결제시 판매등록하기
	@RequestMapping(value="/sales/add/{empno}/pay/{pay}/gen/{gen}/age/{age}", method=RequestMethod.POST)
	public List<BranchSalesDetail> addBranchSales(@RequestBody List<BranchSalesDetail> detailList, 
								@PathVariable("empno") int empno,
								@PathVariable("pay") String payment,
								@PathVariable("gen") String gender,
								@PathVariable("age") String ages) {
		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empno);
		map.put("issaled", 'N');
		
		BranchEmp emp = brService.getBrEmpByNo(empno);
		Branch branch = brService.getBranchByNo(emp.getBranch().getNo());

		BranchSales sale = new BranchSales();
		sale.setAges(Integer.parseInt(ages));
		sale.setBrEmp(emp);
		sale.setGender(gender);
		sale.setPayment(payment);
		sale.setBranch(branch);
		brService.addBranchSales(sale);
		
		sale = brService.getBranchSalesByNotIsSaled(map);
		sale.setIssaled("Y");
		brService.updateBranchSales(sale);
		List<BranchSalesDetail> list = detailList;
		for (BranchSalesDetail d : list) {
			BranchSalesDetail detail = new BranchSalesDetail();
			detail.setBranchSales(sale);
			
			Product product = brService.getProductByNo(d.getProduct().getNo());
			detail.setProduct(product);
			detail.setQty(d.getQty());
			brService.addBranchSalesDetail(detail);
			
			int productNo = d.getProduct().getNo();
			BranchInventory inven = brService.getInventoryByProductNo(productNo);

			if(inven != null && inven.getProduct().getNo() == d.getProduct().getNo()) {
				inven.setQty(inven.getQty() - d.getQty());
				brService.updateInventory(inven);
			}
		}
		return brService.getBranchSalesDetailBySalesNo(sale.getNo());
	}
	
	// 이벤트 코드로 물품 조회하기
	@RequestMapping(value="/event/{eventcode}", method=RequestMethod.GET)
	public List<Product> getProductsByEventCode(@PathVariable("eventcode") int eventcode) {
		return brService.getProductsByEventCode(eventcode);
	}
	
	// 모든 이벤트 상품 조회하기
	@RequestMapping(value="/event/", method=RequestMethod.GET)
	public List<Product> getAllEventProducts() {
		return brService.getAllEventProducts();
	}
	
	// 날짜별로 판매목록 조회하기
	@RequestMapping(value="/acct/{brno}/date/{date}", method=RequestMethod.GET)
	public List<BranchSales> getBranchSalesByDate(@PathVariable("brno") int brno,
													@PathVariable("date") String date) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("branchNo", brno);
		map.put("date", date);
	
		return brService.getBranchSalesByDate(map);
	}
	
	// 반품 업데이트
	@RequestMapping(value="/sales/update/{salesno}", method=RequestMethod.POST)
	public BranchSales updateBranchSales(@PathVariable("salesno") int salesno) {
		BranchSales sales = brService.getBranchSalesBySalesNo(salesno);
		
		if (sales == null) {
			return null;
		} else {
			sales.setIsreturned("Y");
			brService.updateBranchSales(sales);
			
			List<BranchSalesDetail> list = brService.getBranchSalesDetailBySalesNo(salesno);
			for (BranchSalesDetail d : list) {
				int productNo = d.getProduct().getNo();
				BranchInventory inven = brService.getInventoryByProductNo(productNo);

				if(inven != null && inven.getProduct().getNo() == d.getProduct().getNo()) {
					inven.setQty(inven.getQty() + d.getQty());
					brService.updateInventory(inven);
				}
			}
			return sales;
		}
	}
	
	@RequestMapping(value="/sales/return/{brno}", method=RequestMethod.GET)
	public List<BranchSales> getBranchSalesIsReturnedByBranchNo(@PathVariable("brno") int brno) {
		return brService.getBranchSalesIsReturnedByBranchNo(brno);
	}
	
	//
	@RequestMapping(value="/sales/return/d/{salesno}", method=RequestMethod.GET)
	public List<BranchSalesDetail> getBranchSalesDetailBySalesNo(@PathVariable("salesno") int salesno) {
		return brService.getBranchSalesDetailBySalesNo(salesno);
	}
	
}
