package com.cambak21.service.boardNotice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.BoardVO;
import com.cambak21.persistence.boardNotice.BoardNoticeDAO;
import com.cambak21.util.PagingCriteria;


@Service
public class BoardNoticeServiceImpl implements BoardNoticeService {

	@Inject
	private BoardNoticeDAO dao;
	
	
	@Override
	public List<BoardVO> getNoticeAll() throws Exception {
		return dao.getNoticeAll();
	}


	@Override
	public List<BoardVO> getListCriteria(PagingCriteria cri) throws Exception {
		return dao.getListCriteria(cri);
	}


	@Override
	public int getTotalNoticeCnt() throws Exception {
			return dao.getTotalNoticeCnt();
	}


	@Override
	public BoardVO noticeRead(int no) throws Exception {
		dao.noticeViewCnt(no, 1);
		BoardVO vo = dao.noticeRead(no);
		return vo;
	}


	@Override
	public boolean insertNotice(BoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.insertNotice(vo);
		
		if(i == 1) {
			result = true;
		}
		return result;
	}

	@Transactional
	@Override
	public boolean removeNoticeBoard(int no) throws Exception {
		boolean result = false;
		int i = dao.removeNoticeBoard(no);
		if(i == 1) {
			result = true;
		}
		return false;
	}

}
