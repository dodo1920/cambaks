package com.cambak21.service.BoardHumor;

import java.util.List;

import com.cambak21.domain.ReplyBoardVO;

public interface BoardHumorReplyService {
	public List<ReplyBoardVO> listReply(int bno) throws Exception;
	
	public void insert(ReplyBoardVO vo) throws Exception;
	
	public void delete(int board_no) throws Exception;
	
	public void update(ReplyBoardVO vo) throws Exception;
}
