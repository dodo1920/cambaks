package com.cambak21.service.cambakMall;

import java.util.List;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;

public interface prodOrderService {
	
	
	// 김대기 DAO -->
	public List<DestinationVO> selectDestNickName(String member_id) throws Exception;
	
	public DestinationVO selectDestOne(int destination_no) throws Exception;
//  	<!-- 장원영 DAO -->
  	
  	
//  	<!-- 김도연 DAO -->
  	
  	
//  	<!-- 김정민 DAO -->
  	
  	
//  	<!-- 김태훈 DAO -->
  	
  	
//  	<!-- 백승권 DAO -->
  	
  	
//  	<!-- 서효원 DAO -->
  	
  	
//  	<!-- 박종진 DAO -->
  	public List<DestinationVO> destinationsListAjax(String member_id) throws Exception;
  	
  	public boolean defaultModyAjax(String member_id, int dstno) throws Exception;

  	public boolean deleteDestiny(String member_id, int dstno) throws Exception;

  	public boolean destiModyAjax(DestinationVO vo) throws Exception;

  	public boolean insertDestiny(DestinationVO vo) throws Exception;
  	
//  	<!-- 이영광 DAO -->
}
