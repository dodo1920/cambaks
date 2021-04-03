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
	
	private static String namespace="com.cambak21.mappers.cambakBoard.BoardProdReviewMapper";
	


	@Override
	public List<ProdReviewVO> listProdBoard(int product_id) throws Exception {
		return ses.selectList(namespace + ".listProdBoard", product_id);
	}



	@Override
	public int insert(ProdReviewVO vo) throws Exception {
		return ses.insert(namespace + ".insertProdBoard", vo);
	}


	
	@Override
	public List<ProdReviewVO> listProdBoardCriteria(PagingCriteria cri, int product_id, String orderList) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		params.put("product_id", product_id);
		System.out.println(orderList);
		if(orderList.equals("latest")) {
			return ses.selectList(namespace + ".listProdBoardCriteria", params);
		} else if(orderList.equals("grades")) {
			return ses.selectList(namespace + ".listProdBoardCriteriaByGrades", params);
		} else {
			return ses.selectList(namespace + ".listProdBoardCriteriaByLikes", params);
		}
	}

	
	
	@Override
	public List<ProdReviewVO> listProdBoardPaging(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int getTotalBoardCnt(int product_id) throws Exception {
		return ses.selectOne(namespace + ".getTotalBoardCnt", product_id);
	}



	@Override
	public ProdReviewVO readProdBoard(int no) throws Exception {
		return ses.selectOne(namespace + ".getProdReview", no);
	}


	// 게시글 수정
	@Override
	public int updateProdBoard(ProdReviewVO vo)  throws Exception{
		return ses.update(namespace + ".updateProdReview", vo);
	}


	// 게시글 삭제
	@Override
	public int deleteProdBoard(int prodReview_no)  throws Exception{
		return ses.delete(namespace + ".deleteProdReview", prodReview_no);
	}


	// 게시글 좋아요
	@Override
	public void insertLikeProdReviews(String member_id, int prodReview_no)  throws Exception{
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("prodReview_no", prodReview_no);
		ses.insert(namespace + ".insertLikeProdReviews", params);
	}


	// 게시글 좋아요 후, 게시글 좋아요 카운트 1증가
	@Override
	public void updateLikeProdReviews(int prodReview_no) throws Exception {
		ses.update(namespace + ".updateLikeProdReviews", prodReview_no);
		
	}


	// 게시글 좋아요 가져오기
	@Override
	public int getProdReviewsLike(String member_id, int prodReview_no) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		int result = 0;
		params.put("member_id", member_id);
		params.put("prodReview_no", prodReview_no);
		result = ses.selectOne(namespace + ".getProdReviewsLike", params);
		
		return result;
	}



	@Override
	public void deleteLikeProdReviews(String member_id, int prodReview_no) throws Exception {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("prodReview_no", prodReview_no);
		ses.insert(namespace + ".deleteLikeProdReviews", params);
	}


	// 좋아요 -1 처리
	@Override
	public void updateDisLikeProdReviews(int prodReview_no) throws Exception {
		ses.update(namespace + ".updateDisLikeProdReviews", prodReview_no);
		
	}


	// 게시글 좋아요 수 가져오기
	@Override
	public int getProdReviewsLikeCnt(int prodReview_no) throws Exception {
		return ses.selectOne(namespace + ".getProdReviewsLikeCnt", prodReview_no);
	}



}
