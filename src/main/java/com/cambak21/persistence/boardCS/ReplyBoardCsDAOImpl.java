package com.cambak21.persistence.boardCS;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		return ses.selectOne(ns + ".maxBoardNo");
	}

	@Override
	public void updateRefOrder(InsertReplyCSBoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertReplyBoardCS(InsertReplyCSBoardDTO dto, int replyBoard_ref) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", dto.getBoard_no());
		map.put("member_id", dto.getMember_id());
		map.put("replyBoard_content", dto.getReplyBoard_content());
		map.put("replyBoard_ref", replyBoard_ref);
		
		ses.insert(ns + ".parentReply", map);
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
