package com.cambak21.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.MemberVO;
import com.cambak21.persistence.MemberUpdateDAO;

@Service
public class MemberUpdateServiceImpl implements MemberUpdateService {
	@Inject
	private MemberUpdateDAO dao;
	@Override
	public boolean MemberUpdate(MemberVO vo) throws Exception {
		boolean result = false;
		int i = dao.MemberUpdate(vo);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

}
