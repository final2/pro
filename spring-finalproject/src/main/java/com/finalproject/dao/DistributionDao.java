package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;
import com.finalproject.model.HqOrder;
import com.finalproject.model.HqOrderDetail;
import com.finalproject.model.PageVo;

public interface DistributionDao {

/* 거래처 ========================================================================================================= */
	// 거래처 리스트 / 발주 신청시 거래처명
	List<Client> getClients();
	
	// 번호로 거래처 조회
	Client getClientsByNo(int no);
	// 발수 신청시 사용(품번,품명,가격)
	List<ClientDetail> getClientDetailsByNo(int no);

	// 리스트 총 수량
	int getTotalClient();
	
	// 페이지 번호에 해당하는 리스트 조회
	List<Client> getBeginEndClients(PageVo pageVo);

	// 거래처 등록
	void insertClient(Client client);
	
	// 중복 체크
	Client getNameCheck(String name);
	
	// 거래처 수정
	void updateClient(Client client);

/* 발주 ========================================================================================================== */
	// 발주 조회
	List<HqOrder> getHqOrders();
	// 발주 신청
	int getOrderNo(); // 발주 신청시 주문번호 생성
	void addNewOrder(HqOrder hqOrder);
	void addNewProductOrder(HqOrderDetail hqOrderDetail);
	
	// 번호로 발주 정보 조회
	HqOrder getOrderByNo(int no);
	List<HqOrderDetail> getOrderDetailByNo(int no);
	
	// 발주 정보 수정
	void updateOrder(HqOrderDetail hqOrderDetail);
	
	// 입고 여부 변경
	void updateCon(HqOrder hqOrder);
}
