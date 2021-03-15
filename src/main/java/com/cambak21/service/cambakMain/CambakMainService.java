package com.cambak21.service.cambakMain;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CampingVO;
import com.cambak21.util.PagingCriteria;

public interface CambakMainService {
	
	// 캠핑장 검색 자동완성 select
	public List<String> searchCambak(String searchWord, PagingCriteria cri) throws Exception;
	
	// 랜덤 캠핑장 3곳 조회
	public List<CampingVO> randomListCambak(int[] randomId) throws Exception;
	
	// 캠박이일 게시판 별 최신글 3개 조회
	public List<BoardVO> newBoardList(String board_category, PagingCriteria cri) throws Exception;
	
}
