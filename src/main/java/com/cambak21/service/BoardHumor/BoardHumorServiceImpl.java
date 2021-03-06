package com.cambak21.service.BoardHumor;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.BoardVO;
import com.cambak21.persistence.boardHumor.BoardHumorDAO;
import com.cambak21.util.PagingCriteria;

@Service
public class BoardHumorServiceImpl implements BoardHumorService{

	@Inject
	private BoardHumorDAO dao;
	
	@Override
	public boolean insertBoardHumor(BoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.insertBoardHumor(vo);
		if(i == 1) {
			result = true;
		}
		return result;
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO readBoardHumor(int no) throws Exception {
		dao.updateViewCnt(no);
		
		return dao.readBoardHumor(no);
	}

	@Override
	public boolean modifyBoardHumor(BoardVO vo) throws Exception {
		boolean result = false;
		
		int i = dao.updateBoardHumor(vo);
		if(i == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean removeBoardHumor(int no) throws Exception {
		boolean result = false;
		
		int i = dao.deleteBoardHumor(no);
		if(i == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public List<BoardVO> listBoardHumorCriteria(PagingCriteria cri) throws Exception {
		
		return dao.listBoardHumorCriteria(cri);
	}

	@Override
	public int getTotalBoardHumorCnt() throws Exception {
		
		return dao.getTotalBoardHumorCnt();
	}

	

}
