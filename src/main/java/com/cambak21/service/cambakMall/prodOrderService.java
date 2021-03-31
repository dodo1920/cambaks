package com.cambak21.service.cambakMall;

import java.util.List;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.util.PagingCriteria;

public interface prodOrderService {
	
	
	// 김대기 DAO -->
	public List<DestinationVO> selectDestNickName(String member_id) throws Exception;
	
	public DestinationVO selectDestOne(int destination_no) throws Exception;
//  	<!-- 장원영 DAO -->
  	
  	
//  	<!-- 김도연 DAO -->
  	
  	
//  	<!-- 김정민 DAO -->
  	
  	
//  	<!-- 김태훈 DAO -->
  	public List<ProductsVO> prodBoardReadAll(PagingCriteria cri) throws Exception;
  	public int prodBoardReadAllCnt()throws Exception;
  	
//  	<!-- 백승권 DAO -->
  	
  	
//  	<!-- 서효원 DAO -->
  	
  	
//  	<!-- 박종진 DAO -->
  	
  	
//  	<!-- 이영광 DAO -->
}
