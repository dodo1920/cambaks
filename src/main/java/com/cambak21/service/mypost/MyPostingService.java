
package com.cambak21.service.mypost;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MyLikePostingVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.util.PagingCriteria;

public interface MyPostingService {
	// 내가 쓴 글
	List<BoardVO> getMyPosting(String member_id, PagingCriteria cri) throws Exception;
	
	// 내가 쓴 글 카운트
	int getMyPostingCnt(String member_id) throws Exception;
	
	
	// 내가 좋아요 누른 글
	List<MyLikePostingVO> getMyLikePostng(String member_id, PagingCriteria cri) throws Exception;

	// 내가 좋아요 누른 글 카운트
	int getMyLikePostngCnt(String member_id) throws Exception;
	
	// 내 댓글
	List<ReplyBoardVO> myWriteReply(String member_id, PagingCriteria cri) throws Exception;
	
	// 내 댓글 검색하기(기간)
	List<ReplyBoardVO> myWriteReply(String member_id, PagingCriteria cri, String fromDate, String toDate) throws Exception;
		
	// 내 체크리스트 불러오기
	public List<CheckListVO> getCheckList(String member_id) throws Exception;
	
	// 내 체크리스트 삭제하기
	public List<CheckListVO> delCheckList(String member_id) throws Exception;
	
	// 내 체크리스트 수정하기
	public List<CheckListVO> modyCheckList(String member_id) throws Exception;
		
	// 내 체크리스트 등록하기
	public List<CheckListVO> resisterCheckList(String member_id) throws Exception;

		
	
	
	
}
