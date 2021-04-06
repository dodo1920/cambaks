package com.cambak21.service.cambakMain;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.MyQAVO;
import com.cambak21.persistence.cambakMain.MyMallDAO;

@Service
public class MyMallSerivceImpl implements MyMallService {
	
	@Inject
	private MyMallDAO dao;

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 대기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 정민 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/**
	  * @Method Name : getMyQAList
	  * @작성일 : 2021. 4. 6.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 게시글 가져오기
	  * @param member_id : 현재 로그인한 회원 아이디
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyQAVO> getMyQAList(String member_id) throws Exception {
		return dao.getMyQAList(member_id);
	}
	
	/**
	  * @Method Name : getQaCnt
	  * @작성일 : 2021. 4. 6.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getQaCnt(String member_id) throws Exception {
		return dao.getQaCnt(member_id);
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 태훈 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
