package com.cambak21.service.boardCS;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyCSBoardDTO;
import com.cambak21.dto.UpdateReplyCSBoardDTO;
import com.cambak21.persistence.boardCS.ReplyBoardCsDAO;

@Service
public class ReplyBoardCsServiceImpl implements ReplyBoardCsService{

	@Inject
	private ReplyBoardCsDAO dao;
	
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
		return dao.getReplyListBoardCS(board_no);
	}

	@Override
	public int totReplyBoardCS(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
