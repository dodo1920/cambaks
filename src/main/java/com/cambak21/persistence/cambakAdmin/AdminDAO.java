package com.cambak21.persistence.cambakAdmin;

import java.util.List;

import com.cambak21.domain.AdminOrderListVO;
import com.cambak21.domain.MainCategoryVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface AdminDAO {

	

	
	// ======================================== 도연 ============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 대기 ==============================================================================
	
	public RevenueVO getDayRevenue() throws Exception;

	public List<RevenueVO> getPerDayRevenue(int dateVal) throws Exception;

	public List<RevenueVO> selectDate(String startDate, String endDate)throws Exception;

	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 승권 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 원영 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 정민 ==============================================================================
	
	// 페이징 처리한 productList 출력
	public List<ProductsVO> prodList(PagingCriteria cri) throws Exception;
	
	// 게시물 총 개수 가져오기
	public int getTotalProdListCnt() throws Exception;
	
	// 검색된 게시글 총 개수 가져오기
	public int getTotalSearchProdListCnt(SearchCriteria scri) throws Exception;
	
	// 검색된 게시글 리스트 가져오기
	public List<ProductsVO> goSearchProdList(SearchCriteria scri, PagingCriteria cri) throws Exception;
	
	// ajax를 이용한 메인 카테고리 리스트 출력
	public List<MainCategoryVO> getMainCategories() throws Exception;
	
	
	
	
//	---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 종진 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 효원 ==============================================================================
	
	public List<AdminOrderListVO> readOrderList(PagingCriteria cri) throws Exception;
	
	
	public int readOrderListNum() throws Exception;
	
	
	public int orderProductNum(int payment_no) throws Exception;






	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
