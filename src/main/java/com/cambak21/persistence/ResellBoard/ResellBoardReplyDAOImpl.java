package com.cambak21.persistence.ResellBoard;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.cambak21.domain.ResellBoardVO;

public class ResellBoardReplyDAOImpl implements ResellBoardReplyDAO {
	@Inject
	private SqlSession ses;
	private String namespace ="com.mapper.ResellBoardReplyMapper";
	@Override
	public int ResellBoardReplyInsert(ResellBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return ses.insert(namespace+".ResellBoardReplyInsert",vo);
	}

	@Override
	public List<ResellBoardVO> ResellBoardReplyRead(int bno) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(namespace+".ResellBoardReplyRead",bno);
	}

	@Override
	public void ResellBoardUpadte(ResellBoardVO vo) throws Exception {
		ses.update(namespace+".ResellBoardVO",vo);
	}

	@Override
	public void ResellBoardReplyDelete(int no) throws Exception {
		ses.delete(namespace+".ResellBoardReplyDelete",no);

	}

	@Override
	public int ResellBoardGetBno(int no) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".ResellBoardReplyDelete",no);
	}

}
