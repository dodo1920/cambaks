package com.cambak21.service.resellboard;

import java.util.List;

import javax.inject.Inject;

import com.cambak21.domain.PagingCriteria;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.domain.SerachCriteria;
import com.cambak21.dto.ResellBoardDeteDTO;
import com.cambak21.dto.ResellBoardUpdateDTO;
import com.cambak21.dto.ResellLikeBoardInsertDTO;
import com.cambak21.persistence.ResellBoard.ResellBoardDAO;

public class ResellBoardServiceImpl implements ResellBoardService {
	@Inject
	private ResellBoardDAO dao;
	@Override
	public boolean ResellBoardInsert(ResellLikeBoardInsertDTO dto) throws Exception {
		boolean result = false;
		int i = dao.ResellBoardInsert(dto);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public List<ResellBoardVO> ResellBoardReadAll(PagingCriteria cri) throws Exception {
		List<ResellBoardVO>  vo = dao.ResellBoardReadAll(cri);
		return vo;
	}

	@Override
	public int ResellBoardReadAllCnt() throws Exception {
		return dao.ResellBoardReadAllCnt();
	}

	@Override
	public List<ResellBoardVO> ResellBoardRead(PagingCriteria cri, SerachCriteria scri) throws Exception {
		
		return dao.ResellBoardRead(cri,scri);
	}

	@Override
	public int ResellBoardReadCnt(SerachCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.ResellBoardReadCnt(scri);
	}

	@Override
	public boolean ResellBoardUpdate(ResellBoardUpdateDTO dto) throws Exception {
		boolean result = false;
		int i = dao.ResellBoardUpdate(dto);
		if (i == 1) {
			result = true;
		}

		return result;
	}

	@Override
	public boolean ResellBoardDelete(ResellBoardDeteDTO dto) throws Exception {
		boolean result = false;
		int i = dao.ResellBoardDelete(dto);
		if (i == 1) {
			result = true;
		}

		return result;
	}

	@Override
	public void ResellBoardViewcnt(int no) throws Exception {
		dao.ResellBoardViewcnt(no);

	}

	@Override
	public void ResellBoardUpdateReply(int no, int amount) throws Exception {
		dao.ResellBoardUpdateReply(no,amount);


	}

}
