package com.cambak21.persistence.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;

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
  	
  	
//  	<!-- 백승권 DAO -->
  	
  	
//  	<!-- 서효원 DAO -->
  	
  	
//  	<!-- 박종진 DAO -->
  	
	@Override
	public List<DestinationVO> destinationsListAjax(String member_id) throws Exception {
		return ses.selectList(namespace + ".destinationsListAjax", member_id);
	}
//  	<!-- 이영광 DAO -->


	@Override
	public int defaultModyAjax(String member_id, int destination_no) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("member_id", member_id);
		paraMap.put("destination_no", destination_no);
	
			return ses.update(namespace + ".defaultModyAjax", paraMap);
		
	}
}
