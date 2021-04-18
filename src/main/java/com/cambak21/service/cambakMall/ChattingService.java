package com.cambak21.service.cambakMall;

import java.util.List;

import com.cambak21.domain.ChattingListVO;

public interface ChattingService {
	void fromUser(String member_id, String chatting_content) throws Exception;
	
	List<ChattingListVO> chattingList() throws Exception;
}
