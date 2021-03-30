
package com.cambak21.service.myPost;

import java.util.List;


import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MyLikeBoardListVO;
import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.util.PagingCriteria;

public interface MyPostingService {
	// 내가 쓴 글
	List<BoardVO> getMyPosting(String member_id, PagingCriteria cri) throws Exception;
	
	// 내가 쓴 글 카운트
	int getMyPostingCnt(String member_id) throws Exception;
	
	// 내가 좋아요 누른 글
	List<MyLikeBoardListVO> getMyLikePostng(String member_id, PagingCriteria cri, String category) throws Exception;

	// 내가 좋아요 누른 글 카운트
	int getMyLikePostngCnt(String member_id) throws Exception;
	
	// 내 댓글
	List<MyPageReplyVO> myWriteReply(String member_id, String board_category, PagingCriteria cri) throws Exception;
	
	// 가져온 내 댓글 총 개수
	int myReplyTotal() throws Exception;
	
	// 내 체크리스트 불러오기
	public List<CheckListVO> getCheckList(String member_id) throws Exception;
	
	// 내 체크리스트 삭제하기
	public List<CheckListVO> delCheckList(String member_id) throws Exception;
	
	// 내 체크리스트 수정하기
	public List<CheckListVO> modyCheckList(String member_id) throws Exception;
		
	// 내 체크리스트 등록하기
	public List<CheckListVO> resisterCheckList(String member_id) throws Exception;

		
	
	
	
}
