package com.cambak21.service.boardProdReview;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProdReviewVO;
import com.cambak21.persistence.boardProdReview.BoardProdReviewDAO;

@Service
public class ProdReviewServiceImpl implements ProdReviewService {

	@Inject
	private BoardProdReviewDAO dao;
	


	@Override
	public List<ProdReviewVO> listProdBoard() throws Exception {
		return dao.listProdBoard();
	}


}
