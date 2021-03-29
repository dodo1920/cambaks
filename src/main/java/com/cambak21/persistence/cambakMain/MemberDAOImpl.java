package com.cambak21.persistence.cambakMain;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession ses;
	private String namespace = "com.mappers.cambakMain.memeberMapper";

	@Override
	public int memberUpdate(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memberDelete(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memberInsert(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<String> findId(FindIdVO fId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findPwd(String member_id, String member_Mobile) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePwd(String member_id, String member_password) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkEmail(String member_email, String member_name) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_name", member_name);
		params.put("member_email", member_email);
		return ses.selectOne(namespace + ".checkEmail", params);
	}

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
	public int memberDel(LoginDTO dto) throws Exception {
		return ses.update(namespace + ".MemberDelete", dto);
	}

}
