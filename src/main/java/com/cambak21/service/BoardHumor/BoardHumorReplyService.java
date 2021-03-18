package com.cambak21.service.BoardHumor;

import java.util.List;

import com.cambak21.domain.ReplyBoardVO;

public interface BoardHumorReplyService {
	public List<ReplyBoardVO> listReply(int bno) throws Exception;
}
