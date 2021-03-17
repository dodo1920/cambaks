package com.cambak21.persistence.boardCS;

import java.util.List;


import com.cambak21.domain.BoardCsVO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.UpdateCSBoardDTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface BoardCsDAO {
	// 게시글 작성
	void writeBoardCS(InsertCSBoardDTO dto) throws Exception;

	// 게시글 수정
	int modiBoardCS(UpdateCSBoardDTO dto) throws Exception;

	// 게시글 삭제
	int deleteBoardCS(int board_no) throws Exception;

	// 게시글 리스트
	// 페이징 제약조건 넘겨야댐
	List<BoardCsVO> listBoardCS(PagingCriteria cri) throws Exception;

	// 게시글 총 수 구하기 (페이징 하기 위한)
	int boardCStotalCnt() throws Exception;

	// 조회수 업데이트
	void boardCSViewUpdate(int board_no) throws Exception;

	// 좋아요 업데이트
	void boardCSLikeUpdate(int board_no) throws Exception;

	// 제목 검색
	// 내용 검색
	// 작성자 검색
	// 내용 + 제목 검색
//	List<BoardVO> searchBoardCS(SearchCriteria scri) throws Exception;

	// 검색결과 게시글 리스트
	// 페이징 제약조건 넘겨야댐
	List<BoardCsVO> searchListBoardCS(SearchCriteria scri, PagingCriteria cri) throws Exception;

	// 검색된 게시글 총 수 구하기 (페이징 하기 위한)
	int searchBoardCStotalCnt(SearchCriteria scri) throws Exception;

	// 게시글 상세보기
	BoardCsVO readBoardCS(int board_no) throws Exception;
	
	// 댓글 갯수 구하기 (리스트에 출력용)
	int getReplyCnt(int board_no) throws Exception;

}
