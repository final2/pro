package com.finalproject.service;

import java.util.List;
import java.util.Map;

import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;
import com.finalproject.model.PageNo;

public interface DistributionService {

/* 거래처 ========================================================================================================= */
	// 거래처 리스트 / 발주 신청시 거래처명
	List<Client> getClientList();
	
	// 번호로 거래처 조회
	Client getClientsByNo(int no);
	// 발수 신청시 사용(품번,품명,가격)
	List<ClientDetail> getClientDetailsByNo(int no);
	
	// 리스트 총 수량
	PageNo getTotalClient();
	
	// 페이지 번호에 해당하는 리스트 조회
	Map<String, Object> getBeginEndClients(int no);

	// 거래처 등록
	void addNewClient(Client client);
	
	// 거래처 수정
	void updateClient(Client client);

/* 발주 ========================================================================================================== */
	// 발주 신청
}
