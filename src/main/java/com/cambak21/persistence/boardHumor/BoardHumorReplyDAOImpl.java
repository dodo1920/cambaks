package com.cambak21.persistence.boardHumor;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ReplyBoardVO;

@Repository
public class BoardHumorReplyDAOImpl implements BoardHumorReplyDAO {
	
	@Inject
	private SqlSession ses;
	
	private static final String namespace = "com.cambak21.mapper.boardHumorReplyMapper";
	
	@Override
	public List<ReplyBoardVO> read(int board_no) throws Exception {
		System.out.println(board_no);
		return ses.selectList(namespace + ".read", board_no);
		
	}

}
