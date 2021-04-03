package com.cambak21.service.boardProdReview;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProdReviewVO;
import com.cambak21.persistence.boardProdReview.BoardProdReviewDAO;
import com.cambak21.util.PagingCriteria;

@Service
public class ProdReviewServiceImpl implements ProdReviewService {

	@Inject
	private BoardProdReviewDAO dao;
	


	@Override
	public List<ProdReviewVO> listProdBoard(int product_id) throws Exception {
		return dao.listProdBoard(product_id);
	}



	@Override
	public int insert(ProdReviewVO vo) throws Exception {
		
		return dao.insert(vo);
	}

	
	@Override
	public List<ProdReviewVO> listProdBoardCriteria(PagingCriteria cri, int product_id, String orderList) throws Exception {
		return dao.listProdBoardCriteria(cri, product_id, orderList);
	}
	

	@Override
	public List<ProdReviewVO> listProdBoardPaging(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int getTotalBoardCnt(int product_id) throws Exception {
		return dao.getTotalBoardCnt(product_id);
	}



	@Override
	public ProdReviewVO readProdBoard(int no) throws Exception {
		return dao.readProdBoard(no);
	}


	// 게시판 수정
	@Override
	public int updateProdBoard(ProdReviewVO vo) throws Exception {
		return dao.updateProdBoard(vo);
	}


	// 게시글 삭제
	@Override
	public int deleteProdBoard(int prodReview_no) throws Exception {
		return dao.deleteProdBoard(prodReview_no);
		
	}


	// 게시글 좋아요 인서트 및 게시글 좋아요 +1 업데이트
	@Override
	public void insertLikeProdReviews(String member_id, int prodReview_no) throws Exception {
		dao.insertLikeProdReviews(member_id, prodReview_no);
		dao.updateLikeProdReviews(prodReview_no);
		
	}


}
