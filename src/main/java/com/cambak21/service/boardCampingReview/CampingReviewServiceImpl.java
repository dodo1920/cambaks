package com.cambak21.service.boardCampingReview;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.BoardVO;
import com.cambak21.persistence.boardCampingReview.CampingReviewDAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Service
public class CampingReviewServiceImpl implements CampingReviewService{

	@Inject
	private CampingReviewDAO dao;
	
	
	
	
	@Override
	public boolean insertCampingReview(BoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.insertCampingReview(vo);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public BoardVO readCampingReview(int no) throws Exception {
		// 이후에 조회수 증가 하는 것을 AOP의 트랜잭션 처리로 마감
		
		BoardVO vo = dao.readCampingReview(no);
		return vo;
		
	}

	@Override
	public boolean modifyCampingReview(BoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.modifyCampingReview(vo);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean removeCampingReview(int no) throws Exception {
		boolean result = false;
		int i = dao.removeCampingReview(no);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public List<BoardVO> campingReviewAll() throws Exception {
		return dao.campingReviewAll();
	}

	@Override
	public List<BoardVO> listCampingReviewCriteria(PagingCriteria cri) throws Exception {
		return dao.listCampingReviewCriteria(cri);
	}

	@Override
	public int getTotalCampingReviewCnt() throws Exception {
		return dao.getTotalCampingReviewCnt();
	}

	@Override
	public List<BoardVO> goSearchCampingReview(SearchCriteria scri, PagingCriteria cri) throws Exception{
		return dao.goSearchCampingReview(scri, cri);
		
	}


	@Override
	public int searchCampingReviewCnt(SearchCriteria scri) throws Exception {
		
		return dao.searchCampingReviewCnt(scri);
	}






	
	
}
