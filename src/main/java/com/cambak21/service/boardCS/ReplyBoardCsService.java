package com.cambak21.service.boardCS;

import java.util.List;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyCSBoardDTO;
import com.cambak21.dto.UpdateReplyCSBoardDTO;

public interface ReplyBoardCsService {
	
	// 댓글 작성
	void insertReplyBoardCS(InsertReplyCSBoardDTO dto) throws Exception;
	
	// 댓글 수정
	int updateReplyBoardCS(UpdateReplyCSBoardDTO dto) throws Exception;
	
	// 댓글 삭제
	int deleteReplyBoardCS(int replyBoard_no) throws Exception;
	
	// 댓글 리스트 출력
	List<ReplyBoardVO> getReplyListBoardCS(int board_no) throws Exception;
	
	
}
