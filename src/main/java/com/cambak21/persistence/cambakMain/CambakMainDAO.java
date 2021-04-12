package com.cambak21.persistence.cambakMain;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CampingVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.util.PagingCriteria;

public interface CambakMainDAO {
	
//	=============================효원 인터페이스=======================================================
	
	// DB에 있는 캠핑장 정보 개수 검색
	public int getCampingsiteNum() throws Exception;
	
	// 랜덤 캠핑장 3곳 조회
	public int checkRandomCampingImg(int randomNo) throws Exception; // 랜덤 번호로 캠핑장에 사진이 있는지 없는지 체크
	public CampingVO randomCambakInfo(int randomNo) throws Exception; // 랜덤 캠핑장 조회
	
	// 메인페이지에 캠박이일의 각 게시판의 최신 게시글 5개 출력
	public List<BoardVO> readRecentReview() throws Exception;
	public List<BoardVO> readRecentTip() throws Exception;
	public List<ResellBoardVO> readRecentResell() throws Exception;
	public List<BoardVO> readRecentQA() throws Exception;
	public List<BoardVO> readRecentHumor() throws Exception;

	
	
//	=============================효원 인터페이스 끝=======================================================
	
//	=============================도연 인터페이스=======================================================
	public List<CampingVO> getCampings(String searchWord) throws Exception;
	
	
	
	
//	=============================도연 인터페이스 끝=======================================================
	
//	=============================정민 인터페이스=======================================================
	
	
	
	
	
	
	
	
	
//	=============================정민 인터페이스 끝=======================================================
		
}
