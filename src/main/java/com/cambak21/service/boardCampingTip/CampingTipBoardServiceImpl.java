package com.cambak21.service.boardCampingTip;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.SearchCampingTipVO;
import com.cambak21.dto.CamBoardTipModifyDTO;
import com.cambak21.dto.CamBoardTipReplyDTO;
import com.cambak21.dto.CamBoardTipRereplyDTO;
import com.cambak21.dto.CamBoardTipWriteDTO;
import com.cambak21.persistence.boardCampingTip.CampingTipBoardDAO;
import com.cambak21.util.PagingCriteria;

@Service
public class CampingTipBoardServiceImpl implements CampingTipBoardService {
	
	@Inject
	private CampingTipBoardDAO dao;
	
	@Override
	public List<BoardVO> listCampingTipBoard(PagingCriteria cri) throws Exception {
		// 캠핑팁 게시판 전체 조회
		return dao.listCampingTipBoard(cri);
	}

	@Override
	public int totalTipBoard() throws Exception {
		// 캠핑팁 게시판 전체 게시물 개수 가져오기
		return dao.totalTipBoard();
	}
	
	@Override
	public List<BoardVO> tipBoardSearch(SearchCampingTipVO word, PagingCriteria cri) throws Exception {
		// 캠핑팁 게시판 검색
		return dao.tipBoardSearch(word, cri);
	}
	
	@Override
	public int totalTipBoardSearch(SearchCampingTipVO word) throws Exception {
		// 캠핑팁 게시판 검색 결과 개수 가져오기
		return dao.totalTipBoardSearch(word);
	}
	
	@Override
	public BoardVO viewCampingTipBoard(int board_no, String board_category) throws Exception {
		// 캠핑팁 게시판 상세 조회
		return dao.viewCampingTipBoard(board_no, board_category);
	}
	
	@Override
	public boolean writeCampingTipBoard(CamBoardTipWriteDTO writeDTO) throws Exception {
		// 게시글 쓰기 insert
		return dao.writeCampingTipBoard(writeDTO);
	}

	@Override
	public boolean modifyCampingTipBoard(CamBoardTipModifyDTO modifyDTO, int countThumbnail) throws Exception {
		// 게시글 수정 update
		return false;
	}

	@Override
	public boolean deleteCampingTipBoard(int board_no) throws Exception {
		// 게시글 삭제 delete
		return false;
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
		return dao.readReplyCampingTipBoard(board_no);
	}

	@Override
	public boolean saveCampingTipReply(CamBoardTipReplyDTO replyDTO) throws Exception {
		// 상세 게시글 댓글 작성 insert
		return false;
	}

	@Override
	public int getCampingTipReplyNextNum(int board_no, String member_id) throws Exception {
		// 상세 게시글 댓글 작성 insert
		return 0;
	}

	@Override
	public boolean updateCampingTipReplyRef(int replyBoard_no) throws Exception {
		// 상세 게시글 댓글 작성 insert
		return false;
	}

	@Override
	public boolean modifyCampingTipReply(int board_no, String replyBoard_content) throws Exception {
		// 상세 게시글 댓글 수정 update
		return false;
	}

	@Override
	public boolean deleteCampingTipReply(int replyBoard_no) throws Exception {
		// 상세 게시글 댓글 삭제 delete
		return false;
	}

	@Override
	public List<ReplyBoardVO> readRereplyCampingTipBoard(int board_no) throws Exception {
		// 상세 게시글 대댓글 보기 select
		return dao.readRereplyCampingTipBoard(board_no);
	}
	
	@Override
	public boolean addRereplyCampingTipBoard(CamBoardTipRereplyDTO rereplyDTO) throws Exception {
		// 상세 게시글 대댓글 작성 insert
		return false;
	}

	@Override
	public boolean modifyRereplyCampingTipBoard(int replyBoard_no, String replyBoard_content) throws Exception {
		// 상세 게시글 대댓글 수정 update
		return false;
	}

	@Override
	public boolean deleteRereplyCampingTipBoard(int replyBoard_no) throws Exception {
		// 상세 게시글 대댓글 수정 update
		return false;
	}

}
