package com.cambak21.persistence.cambakMain;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.FindPwdVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.dto.UpdateMemberPwdDTO;

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
	public List<String> findId(FindIdVO fid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findPwd(FindPwdVO fPwd) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePwd(UpdateMemberPwdDTO newPwd) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
