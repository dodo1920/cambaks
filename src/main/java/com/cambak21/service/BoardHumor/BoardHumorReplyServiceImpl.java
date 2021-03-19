package com.cambak21.service.BoardHumor;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.persistence.boardHumor.BoardHumorDAO;
import com.cambak21.persistence.boardHumor.BoardHumorReplyDAO;
@Service
public class BoardHumorReplyServiceImpl implements BoardHumorReplyService {
	
	@Inject
	private BoardHumorReplyDAO rdao;
	
	@Inject
	private BoardHumorDAO bdao;
	
	@Override
	public List<ReplyBoardVO> listReply(int board_no) throws Exception {
		System.out.println(board_no);
		return rdao.read(board_no);
	}

	@Override
	public void insert(ReplyBoardVO vo) throws Exception {
		rdao.create(vo);
		
	}

	@Override
	public void delete(int board_no) throws Exception {
		rdao.delete(board_no);
		
	}

	@Override
	public void update(ReplyBoardVO vo) throws Exception {
		rdao.update(vo);
		
	}

}
