package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.DistributionDao;
import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;

@Service
public class DistributionServiceImpl implements DistributionService{

	@Autowired
	private DistributionDao distributionDao;
	
	// 거래처 리스트
	@Override
	public List<Client> getClientList() {
		return distributionDao.getClients();
	}
	
	// 거래처 등록
	@Override
	public void addNewClient(Client client) {
		distributionDao.insertClient(client);
	}
	
	// 거래처 수정
	@Override
	public void updateClient(Client client) {
		distributionDao.updateClient(client);
	}
	
	// 번호로 거래처 조회
	@Override
	public List<ClientDetail> getClientByNo(int no) {
		return distributionDao.getClientByNo(no);
	}
}
