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
	public void updateRefOrder(InsertReplyCSBoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/**
	  * @Method Name : insertReplyBoardCS
	  * @작성일 : 2021. 3. 18.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 부모댓글 입력 시.. 대댓글 x, 자기 댓글 번호를 구하귀 위해서 getRefMax() + 1 을 해줌 
	  * @param dto : view단에서 부터 넘어온 댓글 정보
	  * @throws Exception
	  */
	@Override
	public void insertReplyBoardCS(InsertReplyCSBoardDTO dto) throws Exception {
		dao.insertReplyBoardCS(dto, dao.getRefMax() + 1);
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
