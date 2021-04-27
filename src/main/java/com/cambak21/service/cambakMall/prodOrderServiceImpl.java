package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.PayInfoVO;
import com.cambak21.domain.ProdInfoVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.persistence.cambakMall.prodOrderDAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

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

	@Override
	public DestinationVO defaultDest(String member_id) throws Exception {
		
		return dao.defaultDest(member_id);
	}
	
//		  	<!-- 장원영 DAO -->
	@Override
	public List<ProdInfoVO> prodOrderInfo(String member_id) throws Exception {

		return dao.prodOrderInfo(member_id);
	}
	
	@Override
	public int payInfo(PayInfoVO vo) throws Exception {
		
		return dao.payInfo(vo);
		
	}

	@Override
	public int payInfoNo() throws Exception {
	
		return dao.payInfoNo();
	}
		  	
		  	
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

		@Override
		public List<ProductsVO> prodBoardRead(PagingCriteria cri, SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return dao.prodBoardRead(cri,scri);
		}

		@Override
		public int prodBoardReadCnt(SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return dao.prodBoardReadCnt(scri);
		}
		
		@Override
		public List<ProductsVO> prodBoardSearch(PagingCriteria cri, SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return dao.prodBoardSearch(cri,scri);
		}

		@Override
		public int prodBoardSearchId(SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return dao.prodBoardSearchId(scri);
		}

			  	
//		  	<!-- 백승권 DAO -->
		  	
		  	
//		  	<!-- 서효원 DAO -->
		  	
		  	
//		  	<!-- 박종진 DAO -->

	@Override
	public List<DestinationVO> destinationsListAjax(String member_id) throws Exception {
			return dao.destinationsListAjax(member_id);
	}

	@Override
	public boolean defaultModyAjax(String member_id, int destination_no) throws Exception {
			boolean result = false;
			int i = 0;
			i = dao.defaultModyAjax(member_id, destination_no);
			if(i >= 1) {
				result = true;
			}
			return result;
	}

	@Override
	public boolean destiModyAjax(DestinationVO vo) throws Exception {
		boolean result = false;
		int i = 0;
		i = dao.destiModyAjax(vo);
		if(i >= 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean insertDestiny(DestinationVO vo) throws Exception {
		boolean result = false;
		int i = 0;
		i = dao.insertDestiny(vo);
		if(i >= 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean deleteDestiny(String member_id, int destination_no) throws Exception {
		boolean result = false;
		int i = 0;
		i = dao.deleteDestiny(member_id, destination_no);
		if(i >= 1) {
			result = true;
		}
		return result;
	}

	@Override
	public DestinationVO GetModifydst(int dstno) throws Exception {
		return dao.GetModifydst(dstno);
	}


	

	



	
		  	
//		  	<!-- 이영광 DAO -->
}
