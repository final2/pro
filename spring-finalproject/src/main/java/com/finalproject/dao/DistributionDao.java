package com.finalproject.dao;

import java.util.List;

import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;

public interface DistributionDao {

	// 거래처 리스트
	List<Client> getClients();
	
	// 거래처 등록
	void insertClient(Client client);
	
	// 거래처 수정
	void updateClient(Client client);
	
	// 번호로 거래처 조회
	List<ClientDetail> getClientByNo(int no);
}
