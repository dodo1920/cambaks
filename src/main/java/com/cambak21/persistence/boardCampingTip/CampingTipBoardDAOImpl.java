package com.cambak21.persistence.boardCampingTip;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.SearchCampingTipVO;
import com.cambak21.dto.CamBoardTipModifyDTO;
import com.cambak21.dto.CamBoardTipReplyDTO;
import com.cambak21.dto.CamBoardTipRereplyDTO;
import com.cambak21.dto.CamBoardTipWriteDTO;
import com.cambak21.util.PagingCriteria;

@Repository
public class CampingTipBoardDAOImpl implements CampingTipBoardDAO {
	
	@Inject
	private SqlSession session;
	private static String nameSpace = "com.cambak21.mapper.cambakBoard.tipBoardMapper.";	
	
	@Override
	public List<BoardVO> listCampingTipBoard(PagingCriteria cri) throws Exception {
		// 캠핑팁 게시판 전체 조회
		return session.selectList(nameSpace + "selectTipBoard", cri);
	}

	@Override
	public int totalTipBoard() throws Exception {
		// 캠핑팁 게시판 전체 게시물 개수 가져오기
		return session.selectOne(nameSpace + "totalTipBoard");
	}
	
	@Override
	public List<BoardVO> tipBoardSearch(SearchCampingTipVO word, PagingCriteria cri) throws Exception {
		// 캠핑팁 게시판 검색
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchWord", word.getSearchWord());
		param.put("searchType", word.getSearchType());
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		return session.selectList(nameSpace + "searchTipBoard", param);
	}
	
	@Override
	public int totalTipBoardSearch(SearchCampingTipVO word) throws Exception {
		// 캠핑팁 게시판 검색 결과 개수 가져오기
		return session.selectOne(nameSpace + "searchTipBoardSearch", word);
	}
	
	@Override
	public BoardVO viewCampingTipBoard(int board_no, String board_category) throws Exception {
		// 캠핑팁 게시판 상세 조회
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("board_no", board_no);
		params.put("board_category", board_category);
		return session.selectOne(nameSpace + "viewTipBoard", params);
	}
	
	@Override
	public boolean writeCampingTipBoard(CamBoardTipWriteDTO writeDTO) throws Exception {
		// 게시글 쓰기 insert
		boolean result = false;
		int insertResult = session.insert(nameSpace + "writeTipBoard", writeDTO);
		if (insertResult == 1) {
			result = true;
		}
		return result;
	}
	
	@Override
	public int searchBoardLastNum(CamBoardTipWriteDTO writeDTO) throws Exception {
		// 방금 작성한 게시글번호 가져오기
		return session.selectOne(nameSpace + "searchBoardNum", writeDTO);
	}

	@Override
	public boolean modifyCampingTipBoard(CamBoardTipModifyDTO modifyDTO) throws Exception {
		// 게시글 수정 update
		boolean result = false;
		
		if (session.update(nameSpace + "modifyTipBoard", modifyDTO) == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public int deleteCampingTipBoardReply(int board_no) throws Exception {
		// 게시글 삭제 시 해당 게시글의 댓글 먼저 모두 삭제 delete
		return session.delete(nameSpace + "deleteTipBoardReply", board_no);
	}
	
	@Override
	public boolean deleteCampingTipBoard(int board_no) throws Exception {
		// 게시글 삭제 delete
		boolean result = false;
		
		if (session.update(nameSpace + "deleteTipBoard", board_no) == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public List<BoardVO> readCampingTipBoard(int board_no) throws Exception {
		// 게시글 상세 보기 select
		return null;
	}

	@Override
	public boolean upCountCampingTipBoard(int board_no) throws Exception {
		// 상세 게시글 좋아요
		return false;
	}

	@Override
	public boolean addCountCampingTipBoard(String member_id, int board_no) throws Exception {
		// 상세 게시글 좋아요
		return false;
	}

	@Override
	public List<ReplyBoardVO> readReplyCampingTipBoard(int board_no) throws Exception {
		// 게시글 상세 보기 시 댓글 select
		return session.selectList(nameSpace + "detailTipBoard", board_no);
	}

	@Override
	public boolean saveCampingTipReply(CamBoardTipReplyDTO replyDTO) throws Exception {
		// 상세 게시글 댓글 작성 insert
		boolean result = false;
		
		if (session.insert(nameSpace + "saveReplyTipBoard", replyDTO) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public int getCampingTipReplyNextNum(CamBoardTipReplyDTO replyDTO) throws Exception {
		// 상세 게시글 댓글 작성 max(replyBoard_no) 가져오기
		return session.selectOne(nameSpace + "searchMaxNo", replyDTO);
	}

	@Override
	public boolean updateCampingTipReplyRef(int replyBoard_no) throws Exception {
		// 상세 게시글 댓글 작성 replyBoard_ref 수정해주기
		boolean result = false;
		
		if (session.update(nameSpace + "updateReplyRef", replyBoard_no) == 1) {
			result = true;
		}
		return result;
	}
	
	@Override
	public boolean updateCampingTipReplyCnt(int board_no) throws Exception {
		// 상세 게시글 댓글 저장 완료 시 Boards 테이블의 board_replyCnt 컬럼 1증가
		boolean result = false;
		
		if (session.update(nameSpace + "updateReplyCnt", board_no) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean modifyCampingTipReply(int replyBoard_no, String replyBoard_content) throws Exception {
		// 상세 게시글 댓글 수정 update
		boolean result = false;
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("replyBoard_no", replyBoard_no);
		param.put("replyBoard_content", replyBoard_content);
		
		if (session.update(nameSpace + "modifyReplyTipBoard", param) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean deleteCampingTipReply(int replyBoard_no) throws Exception {
		// 상세 게시글 댓글, 대댓글 삭제 delete
		boolean result = false;
		
		if (session.update(nameSpace + "deleteReplyTipBoard", replyBoard_no) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean deleteCampingTipReplyCount(int board_no) throws Exception {
		// 상세 게시글 댓글, 대댓글 삭제 후 게시글 댓글 개수 update
		boolean result = false;
		
		if (session.update(nameSpace + "deleteReplyTipBoardCount", board_no) == 1) {
			result = true;
		}
		return result;
	}
	
	@Override
	public List<ReplyBoardVO> readRereplyCampingTipBoard(int board_no) throws Exception {
		// 상세 게시글 대댓글 보기 select
		return session.selectList(nameSpace + "moreViewTipBoard", board_no);
	}
	
	@Override
	public int checkReforderMax(CamBoardTipRereplyDTO dto) throws Exception {
		// 상세 게시글 대댓글 작성에 필요한 refOrder max 값 가져오기
		return session.selectOne(nameSpace + "checkMaxReforder", dto);
	}
	
	@Override
	public boolean addRereplyCampingTipBoard(CamBoardTipRereplyDTO rereplyDTO) throws Exception {
		// 상세 게시글 대댓글 작성 insert
		boolean result = false;
		
		if (session.insert(nameSpace + "writeRereply", rereplyDTO) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean modifyRereplyCampingTipBoard(int replyBoard_no, String replyBoard_content) throws Exception {
		// 상세 게시글 대댓글 수정 update
		boolean result = false;
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("replyBoard_no", replyBoard_no);
		param.put("replyBoard_content", replyBoard_content);
		
		if (session.update(nameSpace + "modifyRereply", param) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public int checkReplyCount(int board_no) throws Exception {
		// 상세 게시글 댓글 개수 select
		return session.selectOne(nameSpace + "checkReplyCnt", board_no);
	}

}
