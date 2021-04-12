package com.cambak21.persistence.cambakMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.MyPointVO;
import com.cambak21.domain.MyQAVO;
import com.cambak21.domain.PointVO;
import com.cambak21.domain.ProdQAVO;
import com.cambak21.domain.RefundVO;
import com.cambak21.util.PagingCriteria;

@Repository
public class MyMallDAOImpl implements MyMallDAO {
	
	@Inject
	private SqlSession ses;
	
	private static String ns = "com.mappers.cambakMain.MyMallMapper";
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 대기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@Override
	public int getTotalRefund(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(ns + ".getTotalRefund", member_id);
	}
	
	

	@Override
	public List<RefundVO> getRefundList(String member_id, PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("pageStart", cri.getListCount(1));
		params.put("perPageNum", cri.getPerPageNum());
		System.out.println(params);
		return ses.selectList(ns + ".getRefundList", params);
	}

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 정민 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 마이페이지-나의 적립금 포인트 적립 내역 가져오기
	@Override
	public List<MyPointVO> getPointList(String member_id, PagingCriteria cri) throws Exception {

	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("member_id", member_id);
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".getPointList", params);
	}
	
	// 마이페이지-나의 적립금 총 게시물 개수 가져오기
	@Override
	public int getPointListCnt(String member_id) throws Exception {
		return ses.selectOne(ns + ".getPointListCnt", member_id);
	}
	// 마이페이지-나의 적립금 총 보유 포인트 가져오기
	@Override
	public int getTotMyPoint(String member_id) throws Exception {
		return ses.selectOne(ns + ".getTotMyPoint", member_id);
	}
	// 마이페이지-나의 적립금 총 적립예정 포인트 가져오기
	@Override
	public int getTotMyFuturePoint(String member_id) throws Exception {
		return ses.selectOne(ns + ".getTotMyFuturePoint", member_id);
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/**
	  * @Method Name : getMyQAList
	  * @작성일 : 2021. 4. 6.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 상품문의 가져오기
	  * @return List<MyQAVO> : 내가 작성 상품문의 리스트
	  * @throws Exception
	  */
	@Override
	public List<MyQAVO> getMyQAList(String member_id) throws Exception {
		return ses.selectList(ns + ".getListProdQa", member_id);
	}
	

	/**
	  * @Method Name : getQaCnt
	  * @작성일 : 2021. 4. 6.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getQaCnt(String member_id) throws Exception {
		return ses.selectOne(ns + ".prodQaCnt", member_id);
	}
	
	/**
	  * @Method Name : getProdQAVO
	  * @작성일 : 2021. 4. 6.
	  * @작성자 : 답변 가져오기
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param member_id
	  * @param prodQA_no
	  * @return
	  * @throws Exception
	  */
	@Override
	public ProdQAVO getProdQAVO(int prodQA_no) throws Exception {
		return ses.selectOne(ns + ".getAnswer", prodQA_no);
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@






	


	

	
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 태훈 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
