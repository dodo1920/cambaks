package com.cambak21.persistence.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.util.PagingCriteria;

@Repository
public class prodOrderDAOImpl implements prodOrderDAO {
	
	@Inject
	private SqlSession ses;
	private static String namespace="com.cambak21.mappers.cambakMallMapper";

	
	// 김대기 DAO -->
	@Override
	public List<DestinationVO> selectDestNickName(String member_id) throws Exception {
		System.out.println("dao단 멤버 아이디 = " + member_id);
		return ses.selectList(namespace + ".destinationSelect", member_id);
	}


	@Override
	public DestinationVO selectOneDest(int destination_no) throws Exception {
		
		return ses.selectOne(namespace + ".selectDestOne", destination_no);
	}


	
//  	<!-- 장원영 DAO -->
  	
  	
//  	<!-- 김도연 DAO -->
  	
  	
//  	<!-- 김정민 DAO -->
  	
  	
//  	<!-- 김태훈 DAO -->
  	
		@Override
		public List<ProductsVO> prodBoardReadAll(PagingCriteria cri) throws Exception {
			// TODO Auto-generated method stub
			Map<String, Object> param = new HashMap<String, Object>();
			System.out.println((cri.getPage()-1)*cri.getPerPageNum());
			param.put("pageStart",(cri.getPage()-1)*cri.getPerPageNum());
			param.put("perPageNum", cri.getPerPageNum());
			
			return ses.selectList(namespace+".prodBoardReadAll",param);
		}
	
	
		@Override
		public int prodBoardReadAllCnt() throws Exception {
			// TODO Auto-generated method stub
			return ses.selectOne(namespace+".prodBoardReadAllCnt");
		}
		
//  	<!-- 백승권 DAO -->
  	
  	
//  	<!-- 서효원 DAO -->
  	
  	
//  	<!-- 박종진 DAO -->
  	
  	
//  	<!-- 이영광 DAO -->
}
