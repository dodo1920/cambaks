package com.cambak21.service.cambakAdmin;

import java.util.List;
import java.util.Map;

import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.PagingCriteria;

public interface adminService {

	
	// ======================================== 도연 ============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//		---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 대기 ==============================================================================
		
	public RevenueVO getDayRevenue() throws Exception;

	public List<RevenueVO> getPerDayRevenue(int dateVal)throws Exception;

	public List<RevenueVO> selectDate(String startDate, String endDate) throws Exception;
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 승권 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 원영 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 정민 ==============================================================================
		// 페이징 처리한 productList 출력
		public List<ProductsVO> prodList(PagingCriteria cri) throws Exception;
		
		// 게시물 총 개수
		public int getTotalProdListCnt() throws Exception;
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 종진 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 효원 ==============================================================================
		
		
		public Map<String, Object> readOrderList(PagingCriteria cri) throws Exception;



		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
