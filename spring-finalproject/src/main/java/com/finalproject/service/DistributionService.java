package com.finalproject.service;

import java.util.List;

import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;
import com.finalproject.model.ClientDetailPageVo;
import com.finalproject.model.HqInventory;
import com.finalproject.model.HqOrder;
import com.finalproject.model.HqOrderDetail;
import com.finalproject.model.PageVo;
import com.finalproject.model.Product;

public interface DistributionService {

/* 본사 =========================================================================================================== */	
	// 재고 리스트
	List<HqInventory> getInvenLists();
	
	// 입고확인
	void addInventory(int orderNo);
	
	// 제품 리스트 총 수량
	int getTotalInven(int pn);
	
	// 페이지 번호로 해당 하는 제품 리스트 조회
	List<HqInventory> getBeginEndInvens(PageVo pageVo);
	
/* 거래처 ========================================================================================================= */
	// 거래처 리스트 / 발주 신청시 거래처명
	List<Client> getClientList();
	
	// 번호로 거래처 조회
	Client getClientsByNo(int no);
	// 발수 신청시 사용(품번,품명,가격)
	List<ClientDetail> getClientDetailsByNo(int no);
	
	// 리스트 총 수량
	int getTotalClient(int pn);
	
	// 페이지 번호에 해당하는 리스트 조회
	List<Client> getBeginEndClients(PageVo pageVo);

	// 거래처 등록
	void addNewClient(Client client);
	
	// 중복 체크
	Client getNameCheck(String name);
	
	// 거래처 수정
	void updateClient(Client client);
	
	// 제품명으로 조회
	List<ClientDetail> getProductByName(String name);
	
	//제조사 별 상품 리스트 총 수
	int ClientSearchTotalNo(ClientDetailPageVo cdpv);
	//제조사 별 상품 페이지 리스트
	List<Product> ClientSearchPageList(ClientDetailPageVo cdpv);

/* 발주 ========================================================================================================== */
	// 발주 조회
	List<HqOrder> getHqOrderLists();
	
	// 발주 신청
	int orderNo(); // 발주 신청시 주문번호 생성
	void NewOrder(HqOrder hqOrder);
	void NewProductOrder(HqOrderDetail hqOrderDetail);
	
	// 번호로 발주 정보 조회
	HqOrder getOrderByNo(int no);
	List<HqOrderDetail> getOrderDetailByNo(int no);
	
	// 발주 정보 수정
	void updateOrder(HqOrderDetail hqOrderDetail);
	
	// 입고 여부 변경
	void updateCon(HqOrder hqOrder);
	
	// 번호로 제품정보 조회
	List<HqInventory> getInvenByNo(int no);
		
}
