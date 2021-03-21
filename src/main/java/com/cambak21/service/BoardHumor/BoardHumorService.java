package com.cambak21.service.BoardHumor;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface BoardHumorService {
	public boolean insertBoardHumor(BoardVO vo) throws Exception;
	
	public BoardVO readBoardHumor(int no) throws Exception;
	
	public boolean modifyBoardHumor(BoardVO vo) throws Exception;
	
	public boolean removeBoardHumor(int no) throws Exception;
	
	public List<BoardVO> listBoardHumorCriteria(PagingCriteria cri) throws Exception;
	
	public int getTotalBoardHumorCnt() throws Exception;

	public List<BoardVO> goSearch(SearchCriteria scri, PagingCriteria cri) throws Exception;

	public int searchBoardCnt(SearchCriteria scri) throws Exception;

}
