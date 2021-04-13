package com.cambak21.service.cambakMain;

import java.util.List;

import com.cambak21.domain.MemberLittleOrderVO;
import com.cambak21.domain.MemberOrderVO;
import com.cambak21.domain.MyPointVO;
import com.cambak21.domain.MyQAVO;
import com.cambak21.domain.PointVO;
import com.cambak21.domain.ProdQAVO;
import com.cambak21.domain.RefundVO;
import com.cambak21.util.PagingCriteria;

public interface MyMallService {

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 대기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	public int getTotalRefund(String member_id) throws Exception;	
	
	public List<RefundVO> getRefundList(String member_id, PagingCriteria cri) throws Exception;	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 정민 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 마이페이지-나의 적립금에서 나의 포인트 내역 리스트 가져오기
	public List<MyPointVO> getPointList(String member_id, PagingCriteria cri) throws Exception;	

	// 마이페이지-나의 적립금에서 ajax 스크롤 페이징을 위한 카운트 가져오기
	public int getPointListCnt(String member_id) throws Exception;
	
	// 마이페이지-나의 적립금 총 보유 포인트 가져오기
	public int getTotMyPoint(String member_id) throws Exception;
	// 마이페이지-나의 적립금 총 적립예정 포인트 가져오기
	public int getTotMyFuturePoint(String member_id) throws Exception;
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	public List<MyQAVO> getMyQAList(String member_id) throws Exception;	
	
	public int getQaCnt(String member_id) throws Exception;
	
	// 답변 가져오기
	public ProdQAVO getProdQAVO(int prodQA_no) throws Exception;
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@







	

		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 태훈 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	public List<MemberLittleOrderVO> MemberLittleOrder(PagingCriteria cri,String userName);	
	public MemberOrderVO MemberDetailOrder(int serialNo,String userName)throws Exception;
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
