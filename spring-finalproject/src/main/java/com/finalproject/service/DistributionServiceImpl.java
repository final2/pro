package com.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.dao.DistributionDao;
import com.finalproject.model.Client;
import com.finalproject.model.ClientDetail;
import com.finalproject.model.PageNo;

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
	public PageNo getTotalClient() {
		return distributionDao.getTotalClient();
	}
	
	// 페이징 처리
	@Override
	public Map<String, Object> getBeginEndClients(int no) {
		
		Map<String, Object> map = new HashMap<>();
		//게시글, 페이지 기본 설정 수
		int rowPerPage = 10;
		int blockPerPage =  5;
		
		//게시글 총 수 조회
		PageNo pageNo = distributionDao.getTotalClient();
		
		// 페이지 총 수 계산
		int totalPageNo = (int)Math.ceil(pageNo.getBoardTotalNo()/(double)rowPerPage);
		// 페이지 총 블록 수 계산
		int pageTotalBlock = (int)Math.ceil(totalPageNo/(double)blockPerPage);
		// 현재 블록 계산
		int nowBlock = (int)Math.ceil(no/(double)blockPerPage);
		// 페이지 시작 번호
		int beginPageNo = (nowBlock-1) * blockPerPage+1;
		
		// 페이지 끝 번호
		int endPageNo = 0;
		if(pageTotalBlock == nowBlock) {
			endPageNo = totalPageNo;
		} else {
			endPageNo = beginPageNo + 9;
		}
		//페이지당 게시글 시작 번호
		int beginBoardNo = (no-1) * rowPerPage + 1 ;
		//페이지당 게시글 끝 번호
		int endBoardNo = no * rowPerPage;
		
		pageNo.setPageTotalNo(totalPageNo);
		pageNo.setPageTotalBlockNo(pageTotalBlock);
		pageNo.setNowBlockNo(nowBlock);
		pageNo.setBeginPageNo(beginPageNo);
		pageNo.setEndPageNo(endPageNo);
		pageNo.setBeginBoardNo(beginBoardNo);
		pageNo.setEndBoardNo(endBoardNo);
		
		map.put("PageNo", pageNo);
		map.put("BeginEndClientList", distributionDao.getBeginEndClients(pageNo));
		
		return map;
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
