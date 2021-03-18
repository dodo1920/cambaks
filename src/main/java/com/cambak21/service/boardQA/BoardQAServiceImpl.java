package com.cambak21.service.boardQA;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.BoardQAVO;
import com.cambak21.dto.InsertBoardQADTO;
import com.cambak21.dto.UpdateBoardQADTO;
import com.cambak21.persistence.boardQA.BoardQADAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Service
public class BoardQAServiceImpl implements BoardQAService {
	
	@Inject
	private BoardQADAO dao;

	/**
	 * @Method Name : writeBoardQA
	 * @작성일 : 2021. 3. 18.
	 * @작성자 : 장원영 
	 * @변경이력 : 
	 * @Method 설명 : Q&A게시판 글쓰기 메서드
	 * @return
	 * @throws Exception
	*/
	@Transactional
	@Override
	public void writeBoardQA(InsertBoardQADTO idto) throws Exception {
		dao.writeBoardQA(idto);
	}

	/**
	 * @Method Name : modiBoardQA
	 * @작성일 : 2021. 3. 18.
	 * @작성자 : 장원영 
	 * @변경이력 : 
	 * @Method 설명 : Q&A게시판 글수정 메서드
	 * @return
	 * @throws Exception
	*/
	@Override
	public int modiBoardQA(UpdateBoardQADTO udto) throws Exception {
		return dao.modiBoardQA(udto);
	}

	/**
	 * @Method Name : delBoardQA
	 * @작성일 : 2021. 3. 18.
	 * @작성자 : 장원영 
	 * @변경이력 : 
	 * @Method 설명 : Q&A게시판 글삭제 메서드
	 * @return
	 * @throws Exception
	*/
	@Override
	public int delBoardQA(BoardQAVO vo) throws Exception {
		return dao.delBoardQA(vo);
	}

	/**
	 * @Method Name : listBoardQA
	 * @작성일 : 2021. 3. 18.
	 * @작성자 : 장원영 
	 * @변경이력 : 
	 * @Method 설명 : Q&A게시판 글목록 메서드
	 * @return
	 * @throws Exception
	*/
	@Override
	public List<BoardQAVO> listBoardQA(PagingCriteria cri) throws Exception {
		return dao.listBoardQA(cri);
	}

	@Override
	public void modiBoardQALike(int board_no) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BoardQAVO> searchListBoardQA(SearchCriteria scri, PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardQAVO readBoardQA(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardQAtotalCnt() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int searchBoardQAtotalCnt(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardQAReplyCnt(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
