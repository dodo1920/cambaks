package com.cambak21.service.cambakMain;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.dto.LoginDTO;
import com.cambak21.persistence.boardProdQA.BoardProdQADAO;
import com.cambak21.persistence.cambakMain.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;
	
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
	public boolean checkEmail(String member_email, String member_name) throws Exception {
		boolean result = false;
		
		int i = dao.checkEmail(member_email, member_name);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}	

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

	@Override
	public boolean memberDelete(LoginDTO dto) throws Exception {
		dao.login(dto);
		boolean result = false;
		int i = dao.memberDel(dto);
		if(i == 1) {
			result = true;
		}
		
		return result;
	}
}
