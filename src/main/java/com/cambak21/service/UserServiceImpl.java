package com.cambak21.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.MemberVO;
import com.cambak21.dto.LoginDTO;
import com.cambak21.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
			return dao.login(dto);
	}

	@Override
	public MemberVO checkUserWithSesKey(String member_cookie) throws Exception {
		return dao.checkUserWithSesKey(member_cookie);
	}

	@Override
	public void keepLogin(String member_id, String sesId, Date cookieAge) throws Exception {
		dao.keepLogin(member_id, sesId, cookieAge);

	}

}
