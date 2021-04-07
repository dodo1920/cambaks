package com.cambak21.service.cambakMall;

import java.util.List;

import com.cambak21.domain.BuyProductVO;
import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface prodOrderService {
	
	
	// 김대기 DAO -->
	public List<DestinationVO> selectDestNickName(String member_id) throws Exception;
	
	public DestinationVO selectDestOne(int destination_no) throws Exception;
	
	public DestinationVO defaultDest(String member_id) throws Exception;

	// 장원영 DAO
	
  	
//  	<!-- 김도연 DAO -->
  	
  	
//  	<!-- 김정민 DAO -->
  	
  	
//  	<!-- 김태훈 DAO -->
  	public List<ProductsVO> prodBoardReadAll(PagingCriteria cri) throws Exception;
  	public int prodBoardReadAllCnt()throws Exception;
  	public List<ProductsVO> prodBoardRead(PagingCriteria cri,SearchCriteria scri) throws Exception;
  	public int prodBoardReadCnt(SearchCriteria scri)throws Exception;
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
