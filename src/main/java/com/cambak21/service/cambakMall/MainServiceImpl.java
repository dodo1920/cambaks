package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.BuyProductVO;
import com.cambak21.domain.ProdReviewVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.mallMainTopCountDTO;
import com.cambak21.dto.mallMainTotalDTO;
import com.cambak21.persistence.cambakMall.MainDAO;



@Service
public class MainServiceImpl implements MainService {

	@Inject
	private MainDAO dao;
	
	
	@Override
	public List<ProductsVO> getNewProduct4(int i) throws Exception {
		
		return dao.getNewProduct4(i);
	}


	@Override
	public List<mallMainTotalDTO> getTotalCount() throws Exception {
		
		return dao.getTotalCount();
	}


	@Override
	public List<mallMainTopCountDTO> getTopReview() throws Exception {
		
		return dao.getTopReview();
	}


	@Override
	public List<mallMainTopCountDTO> getTopSelling() throws Exception {
		return dao.getTopSelling();
	}


	@Override
	public List<mallMainTopCountDTO> countReviews() throws Exception {
		return dao.countReviews();
	}

}
