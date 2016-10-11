package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.dao.DistributionDao;
import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;
import com.finalproject.model.HqInventory;
import com.finalproject.model.HqOrder;
import com.finalproject.model.HqOrderDetail;
import com.finalproject.model.PageVo;

@Service
@Transactional
public class DistributionServiceImpl implements DistributionService{

	@Autowired
	private DistributionDao distributionDao;

/* 본사 =========================================================================================================== */	
	// 재고 리스트
	@Override
	public List<HqInventory> getInvenLists() {
		return distributionDao.getInvenLists();
	}
	
	// 입고확인
	@Override
	public void addInventory(int orderNo) {
		// 주문번호에 해당하는 모든 상품정보 조회(상품번호, 회사번호, 수량)
		// 이벤토리에 정보가 있으면 개수증가 없으면 생성
		// 클라이언트 재고 감소
		List<HqInventory> inventories = distributionDao.getOrderDetailByOrderNo(orderNo);
		
		for (HqInventory inventory : inventories) {
			int productNo = inventory.getProduct().getNo();
			int count = distributionDao.getCount(productNo);
			if( count == 0) {
				distributionDao.addInven(inventory);
			} else {
				distributionDao.updateInven(inventory);
			}
			ClientDetail clientDetail = new ClientDetail();
			clientDetail.setQty(inventory.getQty());
			clientDetail.setProduct(inventory.getProduct());
			
			distributionDao.updateQty(clientDetail);
		}
			HqOrder hqOrder = new HqOrder();
			hqOrder.setNo(orderNo);
			
			distributionDao.updateCon(hqOrder);
		
	}
	
	// 제품 리스트 총 수량
	@Override
	public int getTotalInven(int pn) {
		return distributionDao.getTotalInven();
	}
	
	// 페이지 번호로 해당 하는 제품 리스트 조회
	@Override
	public List<HqInventory> getBeginEndInvens(PageVo pageVo) {
		return distributionDao.getBeginEndInvens(pageVo);
	}
	
/* 거래처 ========================================================================================================= */
	// 거래처 리스트 / 발주 신청시 거래처명
	@Override
	public List<Client> getClientList() {
		return distributionDao.getClients();
	}
	
	// 번호로 거래처 조회
	@Override
	public Client getClientsByNo(int no) {
		return distributionDao.getClientsByNo(no);
	}
	
	// 발수 신청시 사용(품번,품명,가격)
	@Override
	public List<ClientDetail> getClientDetailsByNo(int no) {
		return distributionDao.getClientDetailsByNo(no);
	}
	
	// 거래처 총 갯수
	@Override
	public int getTotalClient(int pn) {
		return distributionDao.getTotalClient();
	}
	
	// 페이징 처리
	@Override
	public List<Client> getBeginEndClients(PageVo pageVo) {
		return distributionDao.getBeginEndClients(pageVo);
	}
	
	// 거래처 등록
	@Override
	public void addNewClient(Client client) {
		distributionDao.insertClient(client);
	}
	
	// 중복 체크
	@Override
	public Client getNameCheck(String name) {
		return distributionDao.getNameCheck(name);
	}
	
	// 거래처 수정
	@Override
	public void updateClient(Client client) {
		distributionDao.updateClient(client);
	}
	
/* 발주 ========================================================================================================== */
	// 발주 리스트 조회
	@Override
	public List<HqOrder> getHqOrderLists() {
		return distributionDao.getHqOrders();
	}
	
	// 발주 신청(발주 번호 생성)
	@Override
	public int orderNo() {
		return distributionDao.getOrderNo();
	}
	
	// 발주 신청(발주번호, 신청일, 거래처명 저장)
	@Override
	public void NewOrder(HqOrder hqOrder) {
		distributionDao.addNewOrder(hqOrder);
	}
	
	// 발주 신청(신청한 상품목록 저장)
	@Override
	public void NewProductOrder(HqOrderDetail hqOrderDetail) {
		distributionDao.addNewProductOrder(hqOrderDetail);
	}
	
	// 번호로 발주 정보 조회
	@Override
	public HqOrder getOrderByNo(int no) {
		return distributionDao.getOrderByNo(no);
	}
	
	// 발주번호로 신청한 상품 조회 
	@Override
	public List<HqOrderDetail> getOrderDetailByNo(int no) {
		return distributionDao.getOrderDetailByNo(no);
	}
	
	// 발주 정보 수정
	@Override
	public void updateOrder(HqOrderDetail hqOrderDetail) {
		distributionDao.updateOrder(hqOrderDetail);		
	}
	
	// 입고 확인
	@Override
	public void updateCon(HqOrder hqOrder) {
		distributionDao.updateCon(hqOrder);
	}
	
	// 번호로 제품정보 조회
	@Override
	public List<HqInventory> getInvenByNo(int no) {
		return distributionDao.getInvenByNo(no);
	}
}
