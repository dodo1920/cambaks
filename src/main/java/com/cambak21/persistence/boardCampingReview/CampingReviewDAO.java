package com.cambak21.persistence.boardCampingReview;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface CampingReviewDAO {
	
	// 캠핑리뷰 게시판 글 입력
	public int insertCampingReview(BoardVO vo) throws Exception;
	
	// 캠핑리뷰 상세 글 보기
	public BoardVO readCampingReview(int no) throws Exception;
	
	// 캠핑리뷰 업데이트
	public int modifyCampingReview(BoardVO vo) throws Exception;
	
	// 캠핑리뷰 삭제
	public int removeCampingReview(int no) throws Exception;
	
	
	public List<BoardVO> campingReviewAll() throws Exception;
	
	
	//페이징`
//	public List<BoardVO> listCampingReviewPaging(int page) throws Exception;
	
	
	public List<BoardVO> listCampingReviewCriteria(PagingCriteria cri) throws Exception;
	
	// 페이징을 위해 총 게시물 수
	public int getTotalCampingReviewCnt() throws Exception;
	
	public List<BoardVO> goSearchCampingReview(SearchCriteria scri, PagingCriteria cir) throws Exception;
	
	public int searchCampingReviewCnt(SearchCriteria scri) throws Exception;
	
	// 검색결과 글 수 가져오기
	public void updateReply(int no, int amount) throws Exception;
	
	public void updateViewCnt(int no) throws Exception;

	public List<BoardVO> listBoardPaging(int page) throws Exception;


	
}
