package com.cambak21.service.cambakAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.cambak21.domain.AdminOrderListVO;
import com.cambak21.domain.MainCategoryVO;
import com.cambak21.domain.BoardVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MiddleCategoryVO;
import com.cambak21.domain.OrderManagementSearchVO;
import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.dto.UpdateAdminMemberDTO;
import com.cambak21.dto.AdminProductListDTO;
import com.cambak21.persistence.cambakAdmin.AdminDAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;


@Service
public class adminServiceImpl implements adminService {
	@Inject
	private AdminDAO dao;

	
	// ======================================== 도연 ============================================================================
	
	@Override
	public List<MemberVO> getMember(PagingCriteria cri) throws Exception {
		return dao.getMember(cri);
	}
	
	@Override
	public int getTotMemberCnt() throws Exception {
		return dao.getTotMemberCnt();
	}
	
	@Override
	public boolean deleteMember(String member_id) throws Exception {
		boolean result = false;
		
		int i = dao.deleteMember(member_id);
		
		if(i == 1) {
			result = true;
		}
		
		return result;	
	}
	
	@Override
	public boolean updateMember(UpdateAdminMemberDTO dto) throws Exception {
		boolean result = false;
		
		int i = dao.updateMember(dto);
		
		if(i == 1) {
			result = true;
		}
		
		return result;	
	}
	
	
	
	
	
	
	
	
	
	
	
//		---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 대기 ==============================================================================
		
	   
	   @Override
	   public RevenueVO getDayRevenue() throws Exception {
	      
	      return dao.getDayRevenue();
	   }


	   @Override
	   public List<RevenueVO> getPerDayRevenue(int dateVal) throws Exception {
	      
	      return dao.getPerDayRevenue(dateVal);
	   }


	   @Override
	   public List<RevenueVO> selectDate(String startDate, String endDate) throws Exception {
	      
	      return dao.selectDate(startDate, endDate);
	   }


	   @Override
	   public List<RevenueMonthVO> selectMonthly(int revenueMonthly) throws Exception {
	      System.out.println("서비스 : " + revenueMonthly);
	      return dao.selectMothly(revenueMonthly);
	   }


	   @Override
	   public List<RevenueWeeklyVO> selectWeekly(int revenueWeekly) throws Exception {
	      
	      System.out.println(dao.selectWeekly(revenueWeekly).toString());
	      return dao.selectWeekly(revenueWeekly);
	      
	   }


	   @Override
	   public RevRefundVO thisMonthRevenue() throws Exception {
	      
	      return dao.thisMonthRevenue();
	   }


	   @Override
	   public RevRefundVO prevMonthRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.prevMonthRevenue();
	   }


	   @Override
	   public RevRefundVO thisMonthRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.thisMonthRefund();
	   }


	   @Override
	   public RevRefundVO prevMonthRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.prevMonthRefund();
	   }


	   @Override
	   public RevRefundVO thisWeekRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.thisWeekRevenue();
	   }


	   @Override
	   public RevRefundVO prevWeekRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.prevWeekRevenue();
	   }


	   @Override
	   public RevRefundVO thisWeekRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.thisWeekRefund();
	   }


	   @Override
	   public RevRefundVO prevWeekRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.prevWeekRefund();
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
			return dao.insertProduct(vo);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 원영 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 정민 ==============================================================================
		
		// 페이징 처리한 productList 출력
		@Override
		public List<ProductsVO> prodList(PagingCriteria cri) throws Exception {
			return dao.prodList(cri);
		}
		
		// 게시물 총 개수 가져오기
		@Override
		public int getTotalProdListCnt() throws Exception {
			return dao.getTotalProdListCnt();
		}
		
		// 검색한 결과의 총 게시글 수
		@Override
		public int getTotalSearchProdListCnt(SearchCriteria scri, AdminProductListDTO dto) throws Exception {
			return dao.getTotalSearchProdListCnt(scri, dto);
		}
		
		// 검색한 결과 리스트 가져오기
		@Override
		public List<ProductsVO> goSearchProdList(SearchCriteria scri, PagingCriteria cri, AdminProductListDTO dto) throws Exception {
			return dao.goSearchProdList(scri,cri, dto);
		}

		
		// ajax를 통한 메인 카테고리 리스트 출력
		@Override
		public List<MainCategoryVO> getMainCategories() throws Exception {
			return dao.getMainCategories();
		}

		// ajax 방식으로 메인카테고리 하위의 미들카테고리 목록 가져오기
		@Override
		public List<MiddleCategoryVO> getMiddleCategories(int mainCategory_id) throws Exception {
			return dao.getMiddleCategories(mainCategory_id);
		}
		
		
		
//		---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 종진 ==============================================================================
		
		

		@Override
		public List<BoardVO> goGetBoard_admin(String goStartDate, String goEndDate, String board_category, PagingCriteria pc) throws Exception {
			// TODO Auto-generated method stub
			return dao.goGetBoard_admin(goStartDate, goEndDate, board_category, pc);
		}
		
		@Override
		public List<ReplyBoardVO> goGetreply_admin(String goStartDate, String goEndDate, String board_category, PagingCriteria pc) throws Exception {
			// TODO Auto-generated method stub
			return dao.goGetreply_admin(goStartDate, goEndDate, board_category, pc);
		}
		
		@Override
		public List<BoardVO> searchGetBoard_admin(String goStartDate, String goEndDate, String board_category, String searchboardType, String searchTxtValue,PagingCriteria pc) throws Exception {
			
			return dao.searchGetBoard_admin(goStartDate, goEndDate, board_category, searchboardType, searchTxtValue, pc);
		}
		
		@Override
		public List<ReplyBoardVO> searchGetreply_admin(String goStartDate, String goEndDate, String board_category, String searchboardType, String searchTxtValue, PagingCriteria pc) throws Exception {
			
			return dao.searchGetreply_admin(goStartDate, goEndDate, board_category, searchboardType, searchTxtValue, pc);
		}

		public int getTodayTotCnt() throws Exception {
			
			return dao.getTodayTotCnt();
		}
		
		public int getTodayreplyTotCnt() throws Exception {
			
			return dao.getTodayreplyTotCnt();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 효원 ==============================================================================
		
	@Override
	public Map<String, Object> readOrderList(PagingCriteria cri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		List<AdminOrderListVO> vo = dao.readOrderList(cri);
		
		for (int i = 0; i < vo.size(); i++) {
			vo.get(i).setOrderProductNum(dao.orderProductNum(vo.get(i).getPayment_no()) - 1); // 해당 상품의 리뷰 개수 넣기
			vo.get(i).setBuyProduct_totPrice(dao.orderTotalPrice(vo.get(i).getPayment_no())); // 해당 주문의 총 결제 금액 넣기
		}
		
		param.put("orderList", vo);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(dao.readOrderListNum());
		param.put("paging", pp);
		
		return param;
	}

	@Override
	public Map<String, Object> orderManageSearch(OrderManagementSearchVO vo, PagingCriteria cri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		List<AdminOrderListVO> lst = dao.orderManageSearch(vo, cri);
		
		for (int i = 0; i < lst.size(); i++) {
			lst.get(i).setOrderProductNum(dao.orderProductNum(lst.get(i).getPayment_no()) - 1); // 해당 상품의 리뷰 개수 넣기
			lst.get(i).setBuyProduct_totPrice(dao.orderTotalPrice(lst.get(i).getPayment_no())); // 해당 주문의 총 결제 금액 넣기
		}
		
		param.put("orderList", lst);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(dao.orderManageSearchNum(vo));
		param.put("paging", pp);
		
		return param;
	}

	































	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
