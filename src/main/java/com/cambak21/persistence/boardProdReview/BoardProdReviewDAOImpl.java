package com.cambak21.persistence.boardProdReview;

import java.util.List;

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
	public List<ProdReviewVO> listProdBoard() throws Exception {
		return ses.selectList(namespace + ".listProdBoard");
	}



	@Override
	public int insert(ProdReviewVO vo) throws Exception {
		return ses.insert(namespace + ".insertProdBoard", vo);
	}



	@Override
	public List<ProdReviewVO> listProdBoardPaging(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<ProdReviewVO> listBoardCriteria(PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int getTotalBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}



}
