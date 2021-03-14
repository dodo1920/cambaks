package com.cambak21.persistence.boardHumor;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Repository
public class BoardHumorDAOImple implements BoardHumorDAO {
	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mapper.BoardHumor";
	
	@Override
	public int insertBoardHumor(BoardVO vo) throws Exception {
		
		return ses.insert(namespace + ".insertBoardHumor", vo);
	}

	@Override
	public BoardVO readBoardHumor(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoardHumor(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoardHumor(int no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> listBoardHumor(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> listBoardHumorCriteria(PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalBoardHumorCnt() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> goSearchBoardHumor(SearchCriteria scri, PagingCriteria cir) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int searchBoardHumorCnt(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReply(int no, int amount) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateViewCnt(int no) throws Exception {
		// TODO Auto-generated method stub

	}

}
