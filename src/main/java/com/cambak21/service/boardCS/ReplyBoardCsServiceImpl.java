package com.cambak21.service.boardCS;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyCSBoardDTO;
import com.cambak21.dto.UpdateReplyCSBoardDTO;

@Service
public class ReplyBoardCsServiceImpl implements ReplyBoardCsService{

	@Override
	public int getRefMax() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateRefOrder(InsertReplyCSBoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertReplyBoardCS(InsertReplyCSBoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateReplyBoardCS(UpdateReplyCSBoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReplyBoardCS(int replyBoard_no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReplyBoardVO> getReplyListBoardCS(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int totReplyBoardCS(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
