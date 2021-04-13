package com.cambak21.service.cambakMain;

import java.util.List;
import java.util.Map;

import com.cambak21.domain.CampingVO;
import com.cambak21.util.PagingCriteria;

public interface CambakMainService {
	
//	=============================효원 인터페이스 =======================================================
	
	// 랜덤 캠핑장 3곳 조회
	public List<CampingVO> randomListCambak() throws Exception;
	
	// 메인페이지에 캠박이일의 각 게시판의 최신 게시글 5개 출력
	public Map<String, Object> readRecentBoard() throws Exception;
	
//	=============================효원 인터페이스 끝=======================================================
	
//	=============================도연 인터페이스=======================================================
	public List<CampingVO> getCampings(String searchWord) throws Exception;

	
	
	
	
//	=============================도연 인터페이스 끝=======================================================
	
//	=============================정민 인터페이스=======================================================
	
	// 캠핑장 상세 항목 가져오기
	public CampingVO getCampingDetail(String camping_contentId) throws Exception;
	
	
	
	
	
	
	
//	=============================정민 인터페이스 끝=======================================================
	
}
