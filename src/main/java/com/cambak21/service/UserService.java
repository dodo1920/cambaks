package com.cambak21.service;

import java.util.Date;

import com.cambak21.domain.MemberVO;
import com.cambak21.dto.LoginDTO;

public interface UserService {
	public MemberVO login(LoginDTO dto) throws Exception;

	public MemberVO checkUserWithSesKey(String member_cookie) throws Exception;
	
	public void keepLogin(String member_id, String sesId, Date cookieAge) throws Exception;
	
	public boolean memberDelete(String member_id) throws Exception;
	
}
