package com.cambak21.persistence.boardProdReview;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ProdReviewVO;

@Repository
public class BoardProdReviewDAOImpl implements BoardProdReviewDAO {

	@Inject
	private SqlSession ses;
	
	private static String namespace="com.cambak21.mapper.BoardProdReviewMapper";
	


	@Override
	public List<ProdReviewVO> listProdBoard() throws Exception {
		return ses.selectList(namespace + ".listProdBoard");
	}



}
