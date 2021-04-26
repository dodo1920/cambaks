package com.cambak21.service.cambakAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.AdminOrderListVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.persistence.cambakAdmin.AdminDAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Service
public class adminServiceImpl implements adminService {
	@Inject
	private AdminDAO dao;

	
	// ======================================== 도연 ============================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 승권 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 원영 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 정민 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 종진 ==============================================================================
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 효원 ==============================================================================
		
	@Override
	public Map<String, Object> readOrderList(PagingCriteria cri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		List<AdminOrderListVO> vo = dao.readOrderList(cri);
		
		for (int i = 0; i < vo.size(); i++) {
			vo.get(i).setOrderProductNum(dao.orderProductNum(vo.get(i).getPayment_no()) - 1); // 해당 상품의 리뷰 개수 넣기
		}
		
		param.put("orderList", vo);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(dao.readOrderListNum());
		param.put("paging", pp);
		
		return param;
	}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
