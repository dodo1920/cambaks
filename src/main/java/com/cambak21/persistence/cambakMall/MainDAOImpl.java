package com.cambak21.persistence.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BuyProductVO;
import com.cambak21.domain.ProdReviewVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.mallMainTopCountDTO;
import com.cambak21.dto.mallMainTotalDTO;

@Repository
public class MainDAOImpl implements MainDAO {

	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mappers.mallMainMapper";
	
	@Override
	public List<ProductsVO> getNewProduct4(int no) throws Exception {
		
		return ses.selectList(namespace + ".getNewProduct4", no);
	}
	
	public List<mallMainTotalDTO> getTotalCount() throws Exception {
		return ses.selectList(namespace + ".getTotalCount");
	}

	@Override
	public List<mallMainTopCountDTO> getTopReview() throws Exception {
	
		return ses.selectList(namespace + ".getTopReview");
	}

	@Override
	public List<mallMainTopCountDTO> getTopSelling() throws Exception {
		return ses.selectList(namespace + ".getTopSelling");
	}

	@Override
	public List<mallMainTopCountDTO> countReviews() throws Exception {
		return ses.selectList(namespace + ".countReviews");
	}

}
