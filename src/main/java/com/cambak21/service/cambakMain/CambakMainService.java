package com.cambak21.service.cambakMain;

import java.util.List;
import java.util.Map;

import com.cambak21.domain.CampingVO;
import com.cambak21.util.PagingCriteria;

public interface CambakMainService {
	
//	=============================효원 인터페이스 =======================================================
	
	// 캠핑장 검색 자동완성 select
	public List<String> searchCambak(String searchWord, PagingCriteria cri) throws Exception;
	
	// 랜덤 캠핑장 3곳 조회
	public List<CampingVO> randomListCambak(int[] randomId) throws Exception;
	
	// 메인페이지에 캠박이일의 각 게시판의 최신 게시글 5개 출력
	public Map<String, Object> readRecentBoard() throws Exception;
	
//	=============================효원 인터페이스 끝=======================================================
	
//	=============================도연 인터페이스=======================================================
	
	
	
	
	
//	=============================도연 인터페이스 끝=======================================================
	
//	=============================정민 인터페이스=======================================================
	
	
	
	
	
	
	
	
	
//	=============================정민 인터페이스 끝=======================================================
	
}
