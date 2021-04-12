package com.cambak21.persistence.cambakMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CampingVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.util.PagingCriteria;

@Repository
public class CambakMainDAOImpl implements CambakMainDAO {
	
	@Inject
	private SqlSession session;
	private static String nameSpace = "com.cambak21.mappers.cambakMain.CambakMainPageMapper.";
	
	
//	=============================효원 DAO=======================================================
	@Override
	public List<CampingVO> randomCambakInfo() throws Exception {
		// 랜덤 캠핑장 조회
		return session.selectList(nameSpace + "randomCapingsite");
	}

	@Override
	public List<BoardVO> readRecentReview() throws Exception {
		// 메인페이지에 캠핑 리뷰 게시판의 최신 게시글 5개 출력
		return session.selectList(nameSpace + "readRecentReview");
	}

	@Override
	public List<BoardVO> readRecentTip() throws Exception {
		// 메인페이지에 캠핑팁 게시판의 최신 게시글 5개 출력
		return session.selectList(nameSpace + "readRecentTip");
	}

	@Override
	public List<ResellBoardVO> readRecentResell() throws Exception {
		// 메인페이지에 캠박마켓 게시판의 최신 게시글 5개 출력
		return session.selectList(nameSpace + "readRecentResell");
	}

	@Override
	public List<BoardVO> readRecentQA() throws Exception {
		// 메인페이지에 Q&A 게시판의 최신 게시글 5개 출력
		return session.selectList(nameSpace + "readRecentQA");
	}

	@Override
	public List<BoardVO> readRecentHumor() throws Exception {
		// 메인페이지에 유머 게시판의 최신 게시글 5개 출력
		return session.selectList(nameSpace + "readRecentHumor");
	}

	
//	=============================효원 DAO 끝=======================================================
	
//	=============================도연 DAO=======================================================
	@Override
	public List<CampingVO> getCampings(String searchWord, PagingCriteria cri) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchWord", searchWord);
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		
		return session.selectList(nameSpace + "getCampings", params);
	}

	@Override
	public int getTotCnt(String keyword) throws Exception {
		return session.selectOne(nameSpace + "getTotCnt", keyword);
	}
	
	
	
	
//	=============================도연 DAO 끝=======================================================
	
//	=============================정민 DAO=======================================================
	
	
	
	
	
	
	
	
	
//	=============================정민 DAO 끝=======================================================

}
