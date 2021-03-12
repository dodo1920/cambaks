package com.cambak21.persistence.checkList;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.CheckListVO;

@Repository
public class CheckListDAOImpl implements CheckListDAO {

	@Inject
	private SqlSession ses;
	
	private static final String ns = "com.cambak21.mappers.checkListMapper";
	
	@Override
	public List<CheckListVO> getCheckList(String member_id) throws Exception {
				ses.selectList(ns + ".readCheckList", member_id);
		return null;
	}

}
