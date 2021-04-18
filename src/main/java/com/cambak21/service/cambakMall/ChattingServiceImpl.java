package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ChattingListVO;
import com.cambak21.persistence.cambakMall.ChattingDAO;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Inject
	private ChattingDAO dao;
	
	@Override
	public void fromUser(String member_id, String chatting_content) throws Exception {
		dao.fromUser(member_id, chatting_content);
	}

	@Override
	public List<ChattingListVO> chattingList() throws Exception {
		return dao.chattingList();
	}

	@Override
	public List<ChattingListVO> getChatting(String member_id) throws Exception {
		return dao.getChatting(member_id);
	}
	
}
