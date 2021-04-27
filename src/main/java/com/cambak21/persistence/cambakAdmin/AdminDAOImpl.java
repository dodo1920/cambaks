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
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.util.PagingCriteria;


@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession ses;
	
	private static String ns = "com.cambak21.mappers.cambakAdmin.adminMapper";
	
	// ======================================== 도연 ============================================================================
	
	@Override
	public List<MemberVO> getMember() throws Exception {
		return ses.selectList(ns + ".getMember");
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
		public int getTotalSearchProdListCnt(SearchCriteria scri) throws Exception {
			return ses.selectOne(ns + ".getTotalSearchProdListCnt", scri);
		}

		// 검색된 결과 리스트 가져오기
		@Override
		public List<ProductsVO> goSearchProdList(SearchCriteria scri, PagingCriteria cri) throws Exception {
			// 여러 개의 객체를 한번에 보낼 때, Map을 사용
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("searchType", scri.getSearchType());
			param.put("searchWord", scri.getSearchWord());
			param.put("pageStart", cri.getPageStart());
			param.put("perPageNum", cri.getPerPageNum());
			return ses.selectList(ns + ".goSearchProdList", param);
		}

		// ajax 이용 메인 카테고리 리스트 출력
		@Override
		public List<MainCategoryVO> getMainCategories() throws Exception {
			return ses.selectList(ns + ".getMainCategories");
		}
		
		
		
		
		
		
		
//		---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 종진 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
