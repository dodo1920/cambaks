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
	public List<ProdReviewVO> listProdBoardCriteria(PagingCriteria cri, int product_id) throws Exception {
		return dao.listProdBoardCriteria(cri, product_id);
	}
	

	@Override
	public List<ProdReviewVO> listProdBoardPaging(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int getTotalBoardCnt() throws Exception {
		return dao.getTotalBoardCnt();
	}


}
