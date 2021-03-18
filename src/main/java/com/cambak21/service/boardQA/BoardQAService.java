package com.cambak21.service.boardQA;

import java.util.List;

import com.cambak21.domain.BoardVO;

public interface BoardQAService {
	// 글쓰기
	void writeBoardQA(BoardVO vo) throws Exception;
	
	// 수정
	int modiBoardQA(BoardVO vo) throws Exception;
	
	// 삭제
	int delBoardQA(BoardVO vo) throws Exception;
	
	// 리스트
	List<BoardVO> listBoardQA(BoardVO vo) throws Exception;
	
	
}
