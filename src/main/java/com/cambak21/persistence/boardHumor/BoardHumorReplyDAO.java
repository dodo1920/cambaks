package com.cambak21.persistence.boardHumor;

import java.util.List;

import com.cambak21.domain.ReplyBoardVO;

public interface BoardHumorReplyDAO {
	public List<ReplyBoardVO> read(int bno) throws Exception;
}
