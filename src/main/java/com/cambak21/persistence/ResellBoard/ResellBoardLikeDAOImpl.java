package com.cambak21.persistence.ResellBoard;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.cambak21.domain.ResellLikeBoardVO;

public class ResellBoardLikeDAOImpl implements ResellBoardLikeDAO {
	@Inject
	private SqlSession ses;
	private String namespace ="com.mapper.ResellBoardLikeMapper";
	@Override
	public int ResellBoardLikeInsert(ResellLikeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return ses.insert(namespace+".ResellBoardLikeInsert",vo);
	}

	@Override
	public int ResellBoardLikeDelete(ResellLikeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return ses.delete(namespace+".ResellBoardLikeDelete",vo);
	}

	@Override
	public int ResellBoardLikeCnt(ResellLikeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".ResellBoardLikeCnt",vo);
	}

}
