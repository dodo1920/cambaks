package com.cambak21.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.MemberVO;
import com.cambak21.dto.LoginDTO;


@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mapper.userMapper";
	
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return ses.selectOne(namespace + ".login", dto);
	}

	@Override
	public MemberVO checkUserWithSesKey(String member_cookie) throws Exception {
		return ses.selectOne(namespace + ".checkUserWithSesKey", member_cookie);
	}

	@Override
	public void keepLogin(String member_id, String member_cookie, Date member_cookieAge) throws Exception {
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("member_id", member_id);
		paraMap.put("member_cookie", member_cookie);
		paraMap.put("member_cookieAge", member_cookieAge);
		ses.update(namespace + ".keepLogin", paraMap);
		
	}

	@Override
	public int memberDel(String member_id) throws Exception {
		return ses.update(namespace + ".MemberDelete", member_id);
		
	}

}
