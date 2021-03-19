package com.cambak21.persistence.boardNotice;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface BoardNoticeDAO {
		// 공지사항 전체 불러오기
		public List<BoardVO> getNoticeAll() throws Exception;
		// 공지사항 페이지 처리 글 보기
		public List<BoardVO> getListCriteria(PagingCriteria cri) throws Exception;
		// 공지사항 게시글 총 수 보기
		public int getTotalNoticeCnt() throws Exception;
		// 공지시항 상세글 보기
		public BoardVO noticeRead(int no) throws Exception;
		
		public void noticeViewCnt(int no, int amount) throws Exception;
		
		public int insertNotice(BoardVO vo) throws Exception;
		
		public void updateNoticeReivewCnt(int no, int amount) throws Exception;
		
		public int removeNoticeBoard(int no) throws Exception;
		
		public List<BoardVO> noticeSearch(SearchCriteria scri, PagingCriteria cri) throws Exception;
		
		public int getSearchTotalNoticeBoardCnt(SearchCriteria scri) throws Exception;
}
