package com.cambak21.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.MemberVO;
<<<<<<< HEAD
=======

>>>>>>> 581ceac08190d0ec5a44abc55271b64687e3a4a2
@Repository
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
