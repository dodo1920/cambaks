package com.cambak21.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.cambak21.domain.MemberVO;

public class MemberUpdateDAOImpl implements MemberUpdateDAO {
	@Inject
	private SqlSession ses;
	private String namespace ="com.mapper.MemberUpdateMapper";
	@Override
	public int MemberUpdate(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return ses.update(namespace+".MemberUpdate",vo );
	}

}
