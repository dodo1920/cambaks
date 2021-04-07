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
	public MemberVO memberSelect(String memberId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(memberId);
		return ses.selectOne(namespace+".memberSelect",memberId);
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
	public List<FindIdVO> findId(FindIdVO fId) throws Exception {
		return ses.selectList(namespace + ".findId", fId);
	}

	@Override
	public FindIdVO findPwd(FindIdVO fId) throws Exception {
		return ses.selectOne(namespace + ".findPwd", fId);
	}

	@Override
	public int updatePwd(FindIdVO fId) throws Exception {
		return ses.update(namespace + ".updatePwd", fId);
	}

	@Override
	public int checkEmail(FindIdVO fId) throws Exception {
		return ses.selectOne(namespace + ".checkEmail", fId);
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
