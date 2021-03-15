package com.cambak21.persistence.boardCS;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.UpdateCSBoardDTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Repository
public class BoardCsDAOImpl implements BoardCsDAO {

	@Inject
	private SqlSession ses;

	private static String ns = "com.cambak21.mappers.BoardCsMapper";

	@Override
	public void writeBoardCS(InsertCSBoardDTO dto) throws Exception {
		ses.insert(ns + ".insertBoardCS", dto);
	}

	@Override
	public int modiBoardCS(UpdateCSBoardDTO dto) throws Exception {
		return ses.update(ns + ".updateBoardCS", dto);
	}

	@Override
	public int deleteBoardCS(int board_no) throws Exception {
		
		return ses.delete(ns+".deleteBoardCS", board_no);
	}

	@Override
	public List<BoardVO> listBoardCS(PagingCriteria cri) throws Exception {
		
		return ses.selectList(ns + ".listBoardCS", cri);
	}

	@Override
	public int boardCStotalCnt() throws Exception {

		return ses.selectOne(ns + ".totalCnt");
	}

	@Override
	public void boardCSViewUpdate(int board_no) throws Exception {
		
		ses.selectOne(ns + ".updateView", board_no);
	}

	@Override
	public void boardCSLikeUpdate(int board_no) throws Exception {
		ses.selectOne(ns + ".updateLike", board_no);

	}

	@Override
	public List<BoardVO> searchListBoardCS(SearchCriteria scri, PagingCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", scri.getSearchType());
		map.put("searchWord", scri.getSearchWord());
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".searchBoard", map);
	}

	@Override
	public int searchBoardCStotalCnt(SearchCriteria scri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", scri.getSearchType());
		map.put("searchWord", scri.getSearchWord());
		
		return ses.selectOne(ns + ".searchBoardCnt", map);
	}

	@Override
	public void readBoardCS(int board_no) throws Exception {
		ses.selectOne(ns + ".readBoardCS", board_no);

	}

	@Override
	public int getReplyCnt(int board_no) throws Exception {
		
		return ses.selectOne(ns + ".replyCnt", board_no);
	}

}
