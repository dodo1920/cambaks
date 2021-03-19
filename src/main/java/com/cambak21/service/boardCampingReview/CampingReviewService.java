package com.cambak21.service.boardCampingReview;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface CampingReviewService {

	public boolean insertCampingReview(BoardVO vo) throws Exception;

	public BoardVO readCampingReview(int no) throws Exception;

	public boolean modifyCampingReview(BoardVO vo) throws Exception;

	public boolean removeCampingReview(int no) throws Exception;

	public List<BoardVO> campingReviewAll() throws Exception;

	public List<BoardVO> listCampingReviewCriteria(PagingCriteria cri) throws Exception;

	public int getTotalCampingReviewCnt() throws Exception;

	public List<BoardVO> goSearchCampingReview(SearchCriteria scri, PagingCriteria cri) throws Exception;

	public int searchCampingReviewCnt(SearchCriteria scri) throws Exception;

}
