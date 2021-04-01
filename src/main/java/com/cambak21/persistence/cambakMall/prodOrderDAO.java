package com.cambak21.persistence.cambakMall;

import java.util.List;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;

public interface prodOrderDAO {
	// 김대기 DAO -->
		public List<DestinationVO> selectDestNickName(String member_id) throws Exception;
		
		public DestinationVO selectOneDest(int destination_no) throws Exception;
//	  	<!-- 장원영 DAO -->
	  	
	  	
//	  	<!-- 김도연 DAO -->
	  	
	  	
//	  	<!-- 김정민 DAO -->
	  	
	  	
//	  	<!-- 김태훈 DAO -->
	  	
	  	
//	  	<!-- 백승권 DAO -->
	  	
	  	
//	  	<!-- 서효원 DAO -->
	  	
	  	
//	  	<!-- 박종진 DAO -->
	  	public List<DestinationVO> destinationsListAjax(String member_id) throws Exception;
	  	
	  	public int defaultModyAjax(String member_id, int destination_no) throws Exception;
	  	
//	  	<!-- 이영광 DAO -->
}
