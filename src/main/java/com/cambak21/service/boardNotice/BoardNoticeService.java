package com.cambak21.service.boardNotice;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.util.PagingCriteria;

public interface BoardNoticeService {

	
		// 공지사항 등록하기
		public boolean insertNotice(BoardVO vo) throws Exception;
		// 공지사항 전체 불러오기
		public List<BoardVO> getNoticeAll() throws Exception;
		// 공지사항 페이징 처리
		public List<BoardVO> getListCriteria(PagingCriteria cri) throws Exception;
		// 공지사항 총 페이지수 구하기
		public int getTotalNoticeCnt() throws Exception;
		// 공지사항 상세글 보기
		public BoardVO noticeRead(int no) throws Exception;
		
		public boolean removeNoticeBoard(int no) throws Exception;
}
