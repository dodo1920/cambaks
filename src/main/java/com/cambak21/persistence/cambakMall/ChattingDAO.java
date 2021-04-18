package com.cambak21.persistence.cambakMall;

import java.util.List;

import com.cambak21.domain.ChattingListVO;

public interface ChattingDAO {
	void fromUser(String member_id, String chatting_content) throws Exception;
	
	List<ChattingListVO> chattingList() throws Exception;
}
