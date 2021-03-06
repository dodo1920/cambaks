package com.cambak21.service.boardCampingTip;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.CamBoardTipModifyDTO;
import com.cambak21.dto.CamBoardTipReplyDTO;
import com.cambak21.dto.CamBoardTipRereplyDTO;
import com.cambak21.dto.CamBoardTipWriteDTO;
import com.cambak21.util.PagingCriteria;



public interface CampingTipBoardService {
	
	// 캠핑팁 게시판 전체 조회
	public List<BoardVO> listCampingTipBoard(PagingCriteria cri) throws Exception;
	
	// 게시글 쓰기 insert
	public boolean writeCampingTipBoard(CamBoardTipWriteDTO writeDTO, int countThumbnail) throws Exception;
	
	// 게시글 수정 update
	public boolean modifyCampingTipBoard(CamBoardTipModifyDTO modifyDTO, int countThumbnail) throws Exception;
	
	// 게시글 삭제 delete
	public boolean deleteCampingTipBoard(int board_no) throws Exception;
	
	// 게시글 상세 보기 select
	public List<BoardVO> readCampingTipBoard(int board_no) throws Exception;
	
	// 상세 게시글 좋아요
	public boolean upCountCampingTipBoard(int board_no) throws Exception;
	public boolean addCountCampingTipBoard(String member_id, int board_no) throws Exception;
	
	// 게시글 상세 보기 시 댓글 select
	public List<ReplyBoardVO> readReplyCampingTipBoard(int board_no, PagingCriteria cri) throws Exception;
	
	// 상세 게시글 댓글 작성 insert
	public boolean saveCampingTipReply(CamBoardTipReplyDTO replyDTO) throws Exception;
	public int getCampingTipReplyNextNum(int board_no, String member_id) throws Exception;
	public boolean updateCampingTipReplyRef(int replyBoard_no) throws Exception;
	
	// 상세 게시글 댓글 수정 update
	public boolean modifyCampingTipReply(int board_no, String replyBoard_content) throws Exception;
	
	// 상세 게시글 댓글 삭제 delete
	public boolean deleteCampingTipReply(int replyBoard_no) throws Exception;
	
	// 상세 게시글 대댓글 작성 insert
	public boolean addRereplyCampingTipBoard(CamBoardTipRereplyDTO rereplyDTO) throws Exception;
	
	// 상세 게시글 대댓글 수정 update
	public boolean modifyRereplyCampingTipBoard(int replyBoard_no, String replyBoard_content) throws Exception;
	
	// 상세 게시글 대댓글 수정 update
	public boolean deleteRereplyCampingTipBoard(int replyBoard_no) throws Exception;
}
