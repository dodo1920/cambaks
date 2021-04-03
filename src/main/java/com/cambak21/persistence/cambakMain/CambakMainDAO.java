package com.cambak21.persistence.cambakMain;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CampingVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.util.PagingCriteria;

public interface CambakMainDAO {
	
	// 캠핑장 검색 자동완성 select
	public List<String> searchCambak(String searchWord, PagingCriteria cri) throws Exception;
	
	// 랜덤 캠핑장 3곳 조회
	public List<CampingVO> randomListCambak(int[] randomId) throws Exception;
	
	// 메인페이지에 캠박이일의 각 게시판의 최신 게시글 5개 출력
	public List<BoardVO> readRecentReview() throws Exception;
	public List<BoardVO> readRecentTip() throws Exception;
	public List<ResellBoardVO> readRecentResell() throws Exception;
	public List<BoardVO> readRecentQA() throws Exception;
	public List<BoardVO> readRecentHumor() throws Exception;
	
}
