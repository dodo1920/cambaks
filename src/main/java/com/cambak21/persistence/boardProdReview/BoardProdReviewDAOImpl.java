package com.cambak21.persistence.boardProdReview;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ProdReviewVO;
import com.cambak21.util.PagingCriteria;

@Repository
public class BoardProdReviewDAOImpl implements BoardProdReviewDAO {

	@Inject
	private SqlSession ses;
	
	private static String namespace="com.cambak21.mapper.BoardProdReviewMapper";
	


	@Override
	public List<ProdReviewVO> listProdBoard(int product_id) throws Exception {
		return ses.selectList(namespace + ".listProdBoard", product_id);
	}



	@Override
	public int insert(ProdReviewVO vo) throws Exception {
		return ses.insert(namespace + ".insertProdBoard", vo);
	}


	
	@Override
	public List<ProdReviewVO> listProdBoardCriteria(PagingCriteria cri, int product_id) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		params.put("product_id", product_id);
		return ses.selectList(namespace + ".listProdBoardCriteria", params);
	}

	
	
	@Override
	public List<ProdReviewVO> listProdBoardPaging(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int getTotalBoardCnt() throws Exception {
		return ses.selectOne(namespace + ".getTotalBoardCnt");
	}



}
