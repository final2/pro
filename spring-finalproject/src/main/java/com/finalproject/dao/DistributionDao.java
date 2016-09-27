package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;
import com.finalproject.model.PageNo;

public interface DistributionDao {

	// 거래처 리스트
	List<Client> getClients();
	
	// 거래처 등록
	void insertClient(Client client);
	
	// 거래처 수정
	void updateClient(Client client);
	
	// 번호로 거래처 조회
	Client getClientsByNo(int no);
	List<ClientDetail> getClientDetailsByNo(int no);
	
	// 리스트 총 수량
	PageNo getListTotal();
	
	// 페이지 번호에 해당하는 리스트 조회
	List<Client> getListClients(PageNo pageNo);
}
