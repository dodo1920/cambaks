package com.cambak21.persistence;

import com.cambak21.domain.MemberVO;

public interface MemberUpdateDAO {
	public int MemberUpdate(MemberVO vo)throws Exception;
}
