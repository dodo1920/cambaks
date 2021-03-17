package com.cambak21.service.boardCampingReview;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.BoardVO;
import com.cambak21.persistence.campingReview.CampingReviewDAO;
import com.cambak21.util.PagingCriteria;

@Service
public class CampingReviewServiceImpl {

	@Inject
	private CampingReviewDAO dao;
	
	
	public boolean insertCampingReview(BoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.insertCampingReview(vo);
		if(i == 1) {
			result = true;
		}
		return result;
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	public BoardVO readCampingReview(int no) throws Exception {
		dao.updateViewCnt(no);
		
		return dao.readCampingReview(no);
	}

	
	public boolean modifyCampingReview(BoardVO vo) throws Exception {
		boolean result = false;
		
		int i = dao.updateCampingReview(vo);
		if(i == 1) {
			result = true;
		}
		return result;
	}

	
	public boolean removeCampingReview(int no) throws Exception {
		boolean result = false;
		
		int i = dao.deleteCampingReview(no);
		if(i == 1) {
			result = true;
		}
		return result;
	}

	
	public List<BoardVO> listCampingReviewCriteria(PagingCriteria cri) throws Exception {
		
		return dao.listCampingReviewCriteria(cri);
	}

	
	public int getTotalCampingReviewCnt() throws Exception {
		
		return dao.getTotalCampingReviewCnt();
	}
	
}
