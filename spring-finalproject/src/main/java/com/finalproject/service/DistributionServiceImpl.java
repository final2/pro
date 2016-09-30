package com.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.DistributionDao;
import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;
import com.finalproject.model.PageVo;

@Service
public class DistributionServiceImpl implements DistributionService{

	@Autowired
	private DistributionDao distributionDao;

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
	
	// 거래처 수정
	@Override
	public void updateClient(Client client) {
		distributionDao.updateClient(client);
	}
/* 발주 ========================================================================================================== */
	
	// 발주 신청
}
