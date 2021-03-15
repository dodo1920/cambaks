package com.cambak21.service.boardCS;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.BoardVO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.UpdateCSBoardDTO;
import com.cambak21.persistence.boardCS.BoardCsDAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Service
public class BoardCsServiceImpl implements BoardCsService {

	@Inject
	private BoardCsDAO dao;
	
	@Override
	public void writeBoardCS(InsertCSBoardDTO dto) throws Exception {
		dao.writeBoardCS(dto);
	}

	@Override
	public int modiBoardCS(UpdateCSBoardDTO dto) throws Exception {
		return dao.modiBoardCS(dto);
	}

	@Override
	public int deleteBoardCS(int board_no) throws Exception {
		return dao.deleteBoardCS(board_no);
	}

	/**
	  * @Method Name : listBoardCS
	  * @작성일 : 2021. 3. 15.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 게시글 리스트 페이징
	  * @param cri : 페이징 객체
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<BoardVO> listBoardCS(PagingCriteria cri) throws Exception {
		return dao.listBoardCS(cri);
	}

	@Override
	public void boardCSViewUpdate(int board_no) throws Exception {
		dao.boardCSViewUpdate(board_no);
	}

	@Override
	public void boardCSLikeUpdate(int board_no) throws Exception {
		dao.boardCSLikeUpdate(board_no);
	}

	/**
	  * @Method Name : searchListBoardCS
	  * @작성일 : 2021. 3. 15.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 검색된 결과 리스트 페이징
	  * @param scri : 검색 객체 (Type, Word)
	  * @param cri : 페이징 객체
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<BoardVO> searchListBoardCS(SearchCriteria scri, PagingCriteria cri) throws Exception {
		
		return dao.searchListBoardCS(scri, cri);
	}

	@Override
	public void readBoardCS(int board_no) throws Exception {
		dao.readBoardCS(board_no);
		
	}

	/**
	  * @Method Name : boardCStotalCnt
	  * @작성일 : 2021. 3. 15.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 게시글 페이징을 위한 게시글 총 수 가져오기
	  * @return
	  * @throws Exception
	  */
	@Override
	public int boardCStotalCnt() throws Exception {
		
		return dao.boardCStotalCnt();
	}

	/**
	  * @Method Name : searchBoardCStotalCnt
	  * @작성일 : 2021. 3. 15.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 검색결과 페이징을 위한...
	  * @param scri : 검색 객체 (Type, Word)
	  * @return
	  * @throws Exception
	  */
	@Override
	public int searchBoardCStotalCnt(SearchCriteria scri) throws Exception {
		
		return dao.searchBoardCStotalCnt(scri);
	}

	/**
	  * @Method Name : getReplyCnt
	  * @작성일 : 2021. 3. 15.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 게시글 리스트 제목옆에 댓글 수 출력을 위한...
	  * @param board_no
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getReplyCnt(int board_no) throws Exception {
		
		return dao.getReplyCnt(board_no);
	}
	
}
