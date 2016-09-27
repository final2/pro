package com.finalproject.service;

import java.util.List;
import java.util.Map;

import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;
import com.finalproject.model.PageNo;

public interface DistributionService {

	// 거래처 리스트
	List<Client> getClientList();
	
	// 거래처 등록
	void addNewClient(Client client);
	
	// 거래처 수정
	void updateClient(Client client);
	
	// 번호로 거래처 조회
	Client getClientsByNo(int no);
	List<ClientDetail> getClientDetailsByNo(int no);
	
	// 리스트 총 수량
	PageNo getTotalClient();
	
	// 페이지 번호에 해당하는 리스트 조회
	Map<String, Object> getBeginEndClients(int no);
}
