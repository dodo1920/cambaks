package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.persistence.cambakMall.prodOrderDAO;
import com.cambak21.util.PagingCriteria;

@Service
public class prodOrderServiceImpl implements prodOrderService {
	@Inject
	private prodOrderDAO dao;
	
	// 김대기 DAO -->
	
	//주소록 닉네임들을 가져옴
	@Override
	public List<DestinationVO> selectDestNickName(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectDestNickName(member_id);
	}

	@Override
	public DestinationVO selectDestOne(int destination_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOneDest(destination_no);
	}


	
	
//		  	<!-- 장원영 DAO -->

	
		  	
		  	
//		  	<!-- 김도연 DAO -->
		  	
		  	
//		  	<!-- 김정민 DAO -->
		  	
		  	
//		  	<!-- 김태훈 DAO -->
		@Override
		public List<ProductsVO> prodBoardReadAll(PagingCriteria cri) throws Exception {
			cri.setPerPageNum(9);
			List<ProductsVO>  vo = dao.prodBoardReadAll(cri);
			return vo;
		}
	
		@Override
		public int prodBoardReadAllCnt() throws Exception {
			// TODO Auto-generated method stub
			return dao.prodBoardReadAllCnt();
		}
			  	
//		  	<!-- 백승권 DAO -->
		  	
		  	
//		  	<!-- 서효원 DAO -->
		  	
		  	
//		  	<!-- 박종진 DAO -->
		  	
		  	
//		  	<!-- 이영광 DAO -->
}
