package com.cambak21.persistence.boardCampingTip;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.CamBoardTipModifyDTO;
import com.cambak21.dto.CamBoardTipReplyDTO;
import com.cambak21.dto.CamBoardTipRereplyDTO;
import com.cambak21.dto.CamBoardTipWriteDTO;
import com.cambak21.util.PagingCriteria;

@Repository
public class CampingTipBoardDAOImpl implements CampingTipBoardDAO {
	
	@Inject
	private SqlSession session;
	private static String nameSpace = "com.cambak21.mapper.cambakBoard.tipBoardMapper.";	
	
	@Override
	public List<BoardVO> listCampingTipBoard(PagingCriteria cri) throws Exception {
		return session.selectList(nameSpace + "selectTipBoard", cri);
	}

	@Override
	public BoardVO viewCampingTipBoard(int board_no, String board_category) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("board_no", board_no);
		params.put("board_category", board_category);
		return session.selectOne(nameSpace + "viewTipBoard", params);
	}
	
	@Override
	public boolean writeCampingTipBoard(CamBoardTipWriteDTO writeDTO) throws Exception {
		boolean result = false;
		int insertResult = session.insert(nameSpace + "writeTipBoard", writeDTO);
		if (insertResult == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean modifyCampingTipBoard(CamBoardTipModifyDTO modifyDTO, int countThumbnail) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteCampingTipBoard(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<BoardVO> readCampingTipBoard(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean upCountCampingTipBoard(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addCountCampingTipBoard(String member_id, int board_no) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ReplyBoardVO> readReplyCampingTipBoard(int board_no) throws Exception {
		return session.selectList(nameSpace + "detailTipBoard", board_no);
	}

	@Override
	public boolean saveCampingTipReply(CamBoardTipReplyDTO replyDTO) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getCampingTipReplyNextNum(int board_no, String member_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean updateCampingTipReplyRef(int replyBoard_no) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyCampingTipReply(int board_no, String replyBoard_content) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteCampingTipReply(int replyBoard_no) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ReplyBoardVO> readRereplyCampingTipBoard(int board_no) throws Exception {
		return session.selectList(nameSpace + "moreViewTipBoard", board_no);
	}
	
	@Override
	public boolean addRereplyCampingTipBoard(CamBoardTipRereplyDTO rereplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyRereplyCampingTipBoard(int replyBoard_no, String replyBoard_content) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteRereplyCampingTipBoard(int replyBoard_no) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
