package com.cambak21.persistence.cambakAdmin;

import java.util.List;

import com.cambak21.domain.AdminOrderListVO;
import com.cambak21.domain.MainCategoryVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.BoardVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MiddleCategoryVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.dto.UpdateAdminMemberDTO;
import com.cambak21.dto.AdminProductListDTO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.PagingCriteria;

public interface AdminDAO {

	

	
	// ======================================== 도연 ============================================================================
	
	public List<MemberVO> getMember(PagingCriteria cri) throws Exception;
	
	public int getTotMemberCnt() throws Exception;
	
	public int deleteMember(String member_id) throws Exception;
	
	public int updateMember(UpdateAdminMemberDTO dto) throws Exception;
	
	public int getTodayTotCnt() throws Exception;

	public int getTodayreplyTotCnt() throws Exception;
	
	
	
	
	
	
	
	
//	---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 대기 ==============================================================================
	
	public RevenueVO getDayRevenue() throws Exception;

	public List<RevenueVO> getPerDayRevenue(int dateVal) throws Exception;

	public List<RevenueVO> selectDate(String startDate, String endDate)throws Exception;

	public List<RevenueMonthVO> selectMothly(int revenueMonthly) throws Exception;

	public List<RevenueWeeklyVO> selectWeekly(int revenueWeekly) throws Exception;

	public RevRefundVO thisMonthRevenue() throws Exception;

	public RevRefundVO prevMonthRevenue()throws Exception;

	public RevRefundVO thisMonthRefund() throws Exception;

	public RevRefundVO prevMonthRefund()throws Exception;

	public RevRefundVO thisWeekRevenue() throws Exception;

	public RevRefundVO prevWeekRevenue() throws Exception;

	public RevRefundVO thisWeekRefund() throws Exception;

	public RevRefundVO prevWeekRefund()throws Exception;

	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 승권 ==============================================================================
	// 상품 등록
	int insertProduct(ProductsVO vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 원영 ==============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 정민 ==============================================================================
	
	// 페이징 처리한 productList 출력
	public List<ProductsVO> prodList(PagingCriteria cri) throws Exception;
	
	// 게시물 총 개수 가져오기
	public int getTotalProdListCnt() throws Exception;
	
	// 검색된 게시글 총 개수 가져오기
	public int getTotalSearchProdListCnt(SearchCriteria scri, AdminProductListDTO dto) throws Exception;
	
	// 검색된 게시글 리스트 가져오기
	public List<ProductsVO> goSearchProdList(SearchCriteria scri, PagingCriteria cri, AdminProductListDTO dto) throws Exception;
	
	// ajax를 이용한 메인 카테고리 리스트 출력
	public List<MainCategoryVO> getMainCategories() throws Exception;

	// ajax 방식으로 메인카테고리 하위의 미들카테고리 목록 가져오기
	public List<MiddleCategoryVO> getMiddleCategories(int mainCategory_id) throws Exception;

	// deleteProdList
	public String deleteProdList(List<String> prodList) throws Exception;
	
	
	
	
	
//	---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 종진 ==============================================================================
	
	public List<BoardVO> goGetBoard_admin(String goStartDate, String goEndDate, String board_category, PagingCriteria pc) throws Exception;

	public List<ReplyBoardVO> goGetreply_admin(String goStartDate, String goEndDate, String board_category, PagingCriteria pc) throws Exception;
	
	
	public List<BoardVO> searchGetBoard_admin(String goStartDate, String goEndDate, String board_category, String searchboardType, String searchTxtValue, PagingCriteria pc) throws Exception;
	
	public List<ReplyBoardVO> searchGetreply_admin(String goStartDate, String goEndDate, String board_category, String searchboardType, String searchTxtValue, PagingCriteria pc) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
	
//	============================================== 효원 ==============================================================================
	
	public List<AdminOrderListVO> readOrderList(PagingCriteria cri) throws Exception;
	
	
	public int readOrderListNum() throws Exception;
	
	
	public int orderProductNum(int payment_no) throws Exception;

	public int orderTotalPrice(int payment_no) throws Exception;














	
	
	
	
	
	
	
	
	
	
	
	
	
//	---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
