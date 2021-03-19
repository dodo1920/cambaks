package com.cambak21.persistence.boardQA;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardQAVO;
import com.cambak21.dto.InsertBoardQADTO;
import com.cambak21.dto.UpdateBoardQADTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Repository
public class BoardQADAOImpl implements BoardQADAO {
	
	@Inject
	private SqlSession ses;

	private static String ns = "com.cambak21.mappers.QABoardMapper";

	@Override
	public void writeBoardQA(InsertBoardQADTO idto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int modiBoardQA(UpdateBoardQADTO udto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delBoardQA(BoardQAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardQAVO> listBoardQA(PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modiBoardQALike(int board_no) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BoardQAVO> searchListBoardQA(SearchCriteria scri, PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardQAVO readBoardQA(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardQAtotalCnt() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int searchBoardQAtotalCnt(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardQAReplyCnt(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
