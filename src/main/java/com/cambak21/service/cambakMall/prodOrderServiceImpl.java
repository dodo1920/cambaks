package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.persistence.cambakMall.prodOrderDAO;

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
	
		  	
//		  	<!-- 이영광 DAO -->
}
