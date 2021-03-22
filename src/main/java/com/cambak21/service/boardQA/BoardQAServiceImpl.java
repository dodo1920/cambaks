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
	 * @return 
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
	public int writeBoardQA(InsertBoardQADTO idto) throws Exception {
		dao.writeBoardQA(idto);
		return dao.getBoard_no(idto.getMember_id());
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
	public int delBoardQA(int board_no) throws Exception {
		return dao.delBoardQA(board_no);
	}

	/**
	 * @Method Name : listBoardQA
	 * @작성일 : 2021. 3. 18.
	 * @작성자 : 장원영 
	 * @변경이력 : 
	 * @Method 설명 : Q&A게시판 리시트 페이징 메서드
	 * @return
	 * @throws Exception
	*/
	@Override
	public List<BoardQAVO> listBoardQA(PagingCriteria cri) throws Exception {
		return dao.listBoardQA(cri);
	}

	/**
	 * @Method Name : modiBoardQALike
	 * @작성일 : 2021. 3. 19.
	 * @작성자 : 장원영 
	 * @변경이력 : 
	 * @Method 설명 : Q&A게시판 좋아요 업데이트 메서드
	 * @return
	 * @throws Exception
	*/
	@Override
	public void modiBoardQALike(int board_no) throws Exception {
		dao.modiBoardQALike(board_no);
	}

	/**
	 * @Method Name : searchListBoardQA
	 * @작성일 : 2021. 3. 19.
	 * @작성자 : 장원영 
	 * @변경이력 : 
	 * @Method 설명 : Q&A게시판 검색목록 페이징 메서드
	 * @return
	 * @throws Exception
	*/
	@Override
	public List<BoardQAVO> searchListBoardQA(SearchCriteria scri, PagingCriteria cri) throws Exception {
		return dao.searchListBoardQA(scri, cri);
	}

	@Transactional
	@Override
	public BoardQAVO readBoardQA(int board_no) throws Exception {
		dao.boardQAViewUpdate(board_no);
		
		return dao.readBoardQA(board_no);
	}

	/**
	 * @Method Name : boardQAtotalCnt
	 * @작성일 : 2021. 3. 19.
	 * @작성자 : 장원영 
	 * @변경이력 : 
	 * @Method 설명 : Q&A게시판 게시글 수 카운트 메서드
	 * @return
	 * @throws Exception
	*/
	@Override
	public int boardQAtotalCnt() throws Exception {
		return dao.boardQAtotalCnt();
	}

	/**
	 * @Method Name : searchBoardQAtotalCnt
	 * @작성일 : 2021. 3. 19.
	 * @작성자 : 장원영 
	 * @변경이력 : 
	 * @Method 설명 : Q&A게시판 검색결과 게시글 수 카운트 메서드
	 * @return
	 * @throws Exception
	*/
	@Override
	public int searchBoardQAtotalCnt(SearchCriteria scri) throws Exception {
		return dao.searchBoardQAtotalCnt(scri);
	}

	/**
	 * @Method Name : boardQAReplyCnt
	 * @작성일 : 2021. 3. 19.
	 * @작성자 : 장원영 
	 * @변경이력 : 
	 * @Method 설명 : Q&A게시판 댓글 수 카운트 메서드
	 * @return
	 * @throws Exception
	*/
	@Override
	public int boardQAReplyCnt(int board_no) throws Exception {
		return dao.boardQAReplyCnt(board_no);
	}

}