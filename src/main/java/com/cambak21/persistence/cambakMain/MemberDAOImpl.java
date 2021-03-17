package com.cambak21.persistence.cambakMain;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

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
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
