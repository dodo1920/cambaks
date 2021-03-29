package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.MemberVO;
import com.cambak21.persistence.cambakMall.prodOrderDAO;

@Service
public class prodOrderServiceImpl implements prodOrderService {
	@Inject
	private prodOrderDAO dao;
	
	// 김대기 DAO -->
	
	//주소록 닉네임들을 가져옴
	@Override
	public List<String> selectDestNickName(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectDestNickName(vo);
	}
	
//		  	<!-- 장원영 DAO -->

	
		  	
		  	
//		  	<!-- 김도연 DAO -->
		  	
		  	
//		  	<!-- 김정민 DAO -->
		  	
		  	
//		  	<!-- 김태훈 DAO -->
		  	
		  	
//		  	<!-- 백승권 DAO -->
		  	
		  	
//		  	<!-- 서효원 DAO -->
		  	
		  	
//		  	<!-- 박종진 DAO -->
		  	
		  	
//		  	<!-- 이영광 DAO -->
}
