package com.cambak21.service.boardProdReview;

import java.util.List;

import com.cambak21.domain.ProdReviewVO;

public interface ProdReviewService {

	// 게시글 작성
		public int insert(ProdReviewVO vo) throws Exception;
		
		// 글번호로 게시글 상세 조회
		//public ProdReviewVO readProdBoard(int no) throws Exception;
		
		// 글 수정
		//public int update(ProdReviewVO vo) throws Exception;
		
		// 글 삭제
		//public int delete(int no) throws Exception;
		
		// 전체 글 출력
		public List<ProdReviewVO> listProdBoard() throws Exception;
		
		// 페이징
		//public List<ProdReviewVO> listProdBoardPaging(int page) throws Exception;
		
		//public List<ProdReviewVO> listBoardCriteria(PagingCriteria cri) throws Exception;
		
		// 전체 게시글 수 가져오기
		//public int getTotalBoardCnt() throws Exception;
		
		
		// 검색 결과 전체 글 수 가져오기
		//public int getSearchCount(SearchCriteria scri) throws Exception;
		
		//public List<ProdReviewVO> goSearch(SearchCriteria scri, PagingCriteria cri) throws Exception;
		
		// 게시글에 답글이 달렸을 때, 답글 수 update
		//public void updateReply(int no, int amount) throws Exception;
	
}
