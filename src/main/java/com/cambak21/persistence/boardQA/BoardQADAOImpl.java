package com.cambak21.persistence.boardQA;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		ses.insert(ns + ".insertBoardQA", idto);
	}

	@Override
	public int modiBoardQA(UpdateBoardQADTO udto) throws Exception {
		return ses.update(ns + ".updateBoardQA", udto);
	}

	@Override
	public int delBoardQA(BoardQAVO vo) throws Exception {
		return ses.delete(ns + ".deleteBoardQA", vo);
	}

	@Override
	public List<BoardQAVO> listBoardQA(PagingCriteria cri) throws Exception {
		return ses.selectList(ns + ".listBoardQA", cri);
	}

	@Override
	public void modiBoardQALike(int board_no) throws Exception {
		ses.selectOne(ns + ".updateQALike", board_no);
	}

	@Override
	public List<BoardQAVO> searchListBoardQA(SearchCriteria scri, PagingCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", scri.getSearchType());
		map.put("searchWord", scri.getSearchWord());
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".searchBoardQA", map);
	}

	@Override
	public BoardQAVO readBoardQA(int board_no) throws Exception {
		return ses.selectOne(ns + ".readBoardQA", board_no);
	}

	@Override
	public int boardQAtotalCnt() throws Exception {
		return ses.selectOne(ns + ".QAtotalCnt");
	}

	@Override
	public int searchBoardQAtotalCnt(SearchCriteria scri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", scri.getSearchType());
		map.put("searchWord", scri.getSearchWord());
		
		return ses.selectOne(ns + ".searchQACnt", map);
	}

	@Override
	public int boardQAReplyCnt(int board_no) throws Exception {
		return ses.selectOne(ns + ".QAReplyCnt", board_no);
	}

}
