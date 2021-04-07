package com.cambak21.service.cambakMain;

import java.util.List;

import com.cambak21.domain.MyQAVO;
import com.cambak21.domain.ProdQAVO;

public interface MyMallService {

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 대기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	public int getTotalRefund(String member_id) throws Exception;	
	
	public Object getRefundList(String member_id) throws Exception;	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 정민 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	public List<MyQAVO> getMyQAList(String member_id) throws Exception;	
	
	public int getQaCnt(String member_id) throws Exception;
	
	// 답변 가져오기
	public ProdQAVO getProdQAVO(String member_id, int prodQA_no) throws Exception;
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	

		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 태훈 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
