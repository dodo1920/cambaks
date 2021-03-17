package com.cambak21.persistence.boardCS;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyCSBoardDTO;
import com.cambak21.dto.UpdateReplyCSBoardDTO;

@Repository
public class ReplyBoardCsDAOImpl implements ReplyBoardCsDAO {

	@Inject
	private SqlSession ses;
	
	private static String ns = "com.cambak21.mapper.ReplyBoardCS";
	
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
		return ses.selectList(ns + ".replyList", board_no);
	}

	@Override
	public int totReplyBoardCS(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
