package com.cambak21.service.cambakMain;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Override
	public boolean memberUpdate(MemberVO vo) throws Exception {
//		boolean result = false;
//		int i = dao.MemberUpdate(vo);
//		if (i == 1) {
//			result = true;
//		}
	//	
		return false;
	}

	@Override
	public boolean memberDelete(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean memberInsert(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<String> findId(FindIdVO fId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean findPwd(String member_id, String member_Mobile) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatePwd(String member_id, String member_password) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}	
}
