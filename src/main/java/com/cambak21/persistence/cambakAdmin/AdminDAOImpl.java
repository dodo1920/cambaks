package com.cambak21.persistence.cambakAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.AdminOrderListVO;
import com.cambak21.domain.MainCategoryVO;
import com.cambak21.domain.BoardVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MiddleCategoryVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.dto.UpdateAdminMemberDTO;
import com.cambak21.dto.AdminProductListDTO;
import com.cambak21.util.PagingCriteria;


@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession ses;
	
	private static String ns = "com.cambak21.mappers.cambakAdmin.adminMapper";
	
	// ======================================== 도연 ============================================================================
	
	@Override
	public List<MemberVO> getMember(PagingCriteria cri) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".getMember", params);
	}
	
	@Override
	public int getTotMemberCnt() throws Exception {
		return ses.selectOne(ns + ".getTotMemberCnt");
	}
	
	@Override
	public int deleteMember(String member_id) throws Exception {
		return ses.update(ns + ".deleteMember", member_id);
	}
	
	@Override
	public int updateMember(UpdateAdminMemberDTO dto) throws Exception {
		return ses.update(ns + ".updateMember", dto);
	}
	
	
	
	
	
	
	
	
	
	
//		---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 대기 ==============================================================================
		
	   
	   @Override
	   public RevenueVO getDayRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".getDayRevenue");
	   }

	   @Override
	   public List<RevenueVO> getPerDayRevenue(int dateVal) throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectList(ns + ".getPerDayRevenue", dateVal);
	   }

	   @Override
	   public List<RevenueVO> selectDate(String startDate, String endDate) throws Exception {
	      
	      Map<String, Object> params = new HashMap<String, Object>();
	      params.put("startDate", startDate);
	      params.put("endDate", endDate);
	      
	      return ses.selectList(ns + ".betweenDayRevenue", params);
	   }

	   @Override
	   public List<RevenueMonthVO> selectMothly(int revenueMonthly) throws Exception {
	      System.out.println("다오 : " + revenueMonthly);
	      return ses.selectList(ns +".selectMonthly" , revenueMonthly);
	      
	   }

	   @Override
	   public List<RevenueWeeklyVO> selectWeekly(int revenueWeekly) throws Exception {
	      
	      return ses.selectList(ns + ".selectWeekly", revenueWeekly);
	   }

	   @Override
	   public RevRefundVO thisMonthRevenue() throws Exception {
	      
	      return ses.selectOne(ns + ".thisMonthRevenue");
	      
	   }

	   @Override
	   public RevRefundVO prevMonthRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".prevMonthRevenue");
	   }

	   @Override
	   public RevRefundVO thisMonthRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".thisMonthRefund");
	   }

	   @Override
	   public RevRefundVO prevMonthRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".prevMonthRefund");
	   }

	   @Override
	   public RevRefundVO thisWeekRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".thisWeekRevenue");
	   }

	   @Override
	   public RevRefundVO prevWeekRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".prevWeekRevenue");
	   }

	   @Override
	   public RevRefundVO thisWeekRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".thisWeekRefund");
	   }

	   @Override
	   public RevRefundVO prevWeekRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".prevWeekRefund");
	   }
	      
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 승권 ==============================================================================
	   /**
		  * @Method Name : insertProduct
		  * @작성일 : 2021. 4. 28.
		  * @작성자 : goott6
		  * @변경이력 : 
		  * @Method 설명 :
		  * @param vo
		  * @return
		  * @throws Exception
		  */
		@Override
		public int insertProduct(ProductsVO vo) throws Exception {
			return ses.insert(ns + ".insertProduct", vo);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 원영 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 정민 ==============================================================================
		
	// 페이징 처리한 productList 출력
		@Override
		public List<ProductsVO> prodList(PagingCriteria cri) throws Exception {
			return ses.selectList(ns + ".prodList", cri);
		}
		
		
		// 게시물 총 개수 가져오기
		@Override
		public int getTotalProdListCnt() throws Exception {
			return ses.selectOne(ns + ".getTotalProdListCnt");
		}
		
		// 검색된 게시글 총 개수 가져오기
		@Override
		public int getTotalSearchProdListCnt(SearchCriteria scri, AdminProductListDTO dto) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("searchType", scri.getSearchType());
			param.put("searchWord", scri.getSearchWord());
			System.out.println("dao scri.searchWord:" + scri.getSearchWord());
			
			param.put("product_show", dto.getProduct_show());
			param.put("mainCategory_id", dto.getMainCategory_id());
			param.put("middleCategory_id", dto.getMiddleCategory_id());
			System.out.println("dao의 param:" + param.toString());
			return ses.selectOne(ns + ".getTotalSearchProdListCnt", param);
		}

		// 검색된 결과 리스트 가져오기
		@Override
		public List<ProductsVO> goSearchProdList(SearchCriteria scri, PagingCriteria cri, AdminProductListDTO dto) throws Exception {
			// 여러 개의 객체를 한번에 보낼 때, Map을 사용
			System.out.println("dao의 dto: " + dto.toString());
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("searchType", scri.getSearchType());
			param.put("searchWord", scri.getSearchWord());
			param.put("pageStart", cri.getPageStart());
			param.put("perPageNum", cri.getPerPageNum());
			param.put("product_show", dto.getProduct_show());
			param.put("mainCategory_id", dto.getMainCategory_id());
			param.put("middleCategory_id", dto.getMiddleCategory_id());
			
			return ses.selectList(ns + ".goSearchProdList", param);
		}

		// ajax 이용 메인 카테고리 리스트 출력
		@Override
		public List<MainCategoryVO> getMainCategories() throws Exception {
			return ses.selectList(ns + ".getMainCategories");
		}
		
		// ajax 방식으로 메인카테고리 하위의 미들카테고리 목록 가져오기
		@Override
		public List<MiddleCategoryVO> getMiddleCategories(int mainCategory_id) throws Exception {
			return ses.selectList(ns + ".getMiddleCategories", mainCategory_id);
		}
			
		
		
		
		
		
//		---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 종진 ==============================================================================
		
		
		@Override
		public List<BoardVO> goGetBoard_admin(String goStartDate, String goEndDate, String board_category, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", goStartDate);
			param.put("goEndDate", goEndDate);
			param.put("board_category", board_category);
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".goGetBoard_admin", param);
		}
		
		@Override
		public List<ReplyBoardVO> goGetreply_admin(String goStartDate, String goEndDate, String board_category, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", goStartDate);
			param.put("goEndDate", goEndDate);
			param.put("board_category", board_category);
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".goGetreply_admin", param);
		}
		
		@Override
		public List<BoardVO> searchGetBoard_admin(String goStartDate, String goEndDate, String board_category, String searchboardType, String searchTxtValue, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", goStartDate);
			param.put("goEndDate", goEndDate);
			param.put("board_category", board_category);
			param.put("searchboardType", searchboardType);
			param.put("searchTxtValue", searchTxtValue);
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".searchGetBoard_admin", param);
		}
		
		@Override
		public List<ReplyBoardVO> searchGetreply_admin(String goStartDate, String goEndDate, String board_category, String searchboardType, String searchTxtValue, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", goStartDate);
			param.put("goEndDate", goEndDate);
			param.put("board_category", board_category);
			param.put("searchboardType", searchboardType);
			param.put("searchTxtValue", searchTxtValue);
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".searchGetreply_admin", param);
		}

		public int getTodayTotCnt() throws Exception{
			return ses.selectOne(ns + ".getTodayTotCnt");
		}

		public int getTodayreplyTotCnt() throws Exception{
			return ses.selectOne(ns + ".getTodayreplyTotCnt");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 효원 ==============================================================================
		
	@Override
	public List<AdminOrderListVO> readOrderList(PagingCriteria cri) throws Exception {
		return ses.selectList(ns + ".readOrderList", cri);
	}

	@Override
	public int readOrderListNum() throws Exception {
		return ses.selectOne(ns + ".readOrderListNum");
	}

	@Override
	public int orderProductNum(int payment_no) throws Exception {
		return ses.selectOne(ns + ".orderProductNum", payment_no);
	}

	@Override
	public int orderTotalPrice(int payment_no) throws Exception {
		return ses.selectOne(ns + ".orderTotalPrice", payment_no);
	}






























		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
