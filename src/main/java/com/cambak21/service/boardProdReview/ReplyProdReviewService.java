package com.cambak21.service.boardProdReview;

import java.util.List;

import com.cambak21.domain.ReplyProdReviewVO;

public interface ReplyProdReviewService {
	// 댓글 추가
	public int addProdReply(ReplyProdReviewVO vo) throws Exception;
	
	// 댓글 목록 가져오기
	public List<ReplyProdReviewVO> getListReply(int prodReview_no) throws Exception;
	
	

}
