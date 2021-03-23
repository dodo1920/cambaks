package com.cambak21.service.boardProdReview;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ReplyProdReviewVO;
import com.cambak21.persistence.boardProdReview.ReplyProdReviewDAO;

@Service
public class ReplyProdReviewServiceImpl implements ReplyProdReviewService{
	@Inject private ReplyProdReviewDAO dao;

	@Override
	public int addProdReply(ReplyProdReviewVO vo) throws Exception {
		return dao.addProdReply(vo);
	}

	@Override
	public List<ReplyProdReviewVO> getListReply(int prodReview_no) throws Exception {
		return dao.getListReply(prodReview_no);
	}
	
	
}
