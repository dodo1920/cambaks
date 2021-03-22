package com.cambak21.persistence;

import java.util.Date;

import com.cambak21.domain.MemberVO;
import com.cambak21.dto.LoginDTO;

public interface UserDAO {
	// 로그인 처리
		 public MemberVO login(LoginDTO dto) throws Exception;
		 
		 // 유저의 세션ID를 체크 
		 public MemberVO checkUserWithSesKey(String sesKey) throws Exception;
		 
		 // 로그인 유지하기 위해 
		 public void keepLogin(String uid, String sesId, Date cookieAge) throws Exception;
		 
		 
}
