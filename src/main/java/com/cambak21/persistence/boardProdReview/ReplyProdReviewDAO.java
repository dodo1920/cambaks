package com.cambak21.persistence.boardProdReview;

import java.util.List;

import com.cambak21.domain.ReplyProdReviewVO;

public interface ReplyProdReviewDAO {

	// 댓글번호 처리
	public int getMaxNo() throws Exception;
	
	// 상품후기 게시글에 대한 댓글 삭제/목록 출력/댓글 수 확인을 위한 Bno 가져오기
	public int getBno(int no) throws Exception;
	
	// reforder 가져오기
	
	
	// 댓글 정렬 순서 정리
	public void updateReforder(int ref, int reforder) throws Exception;
	
	
	
	// 상품후기 게시글에 대한 댓글 생성
	public int addProdReply(ReplyProdReviewVO vo) throws Exception;
	
	// 상품후기 게시글에 대한 댓글 전체 목록 조회
	public List<ReplyProdReviewVO> read(int bno) throws Exception;
	
	// 상품후기 게시글에 대한 댓글 수정
	public void update(ReplyProdReviewVO vo) throws Exception;
	
	// 상품후기 게시글에 대한 댓글 삭제(update처리)
	public void delete(int no) throws Exception;

	public List<ReplyProdReviewVO> getListReply(int prodReview_no) throws Exception;
	

	
}
