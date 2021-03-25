package com.cambak21.persistence.boardProdReview;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ReplyProdReviewVO;
import com.cambak21.dto.InsertReplyProdReviewDTO;

@Repository
public class ReplyProdReviewDAOImpl implements ReplyProdReviewDAO {

	@Inject
	private SqlSession ses;
	private static final String namespace = "com.cambak21.mappers.cambakBoard.ReplyProdReviewMapper";
	
	@Override
	public int addProdReply(InsertReplyProdReviewDTO dto) throws Exception {
		return ses.insert(namespace + ".addProdReply", dto);
	}

	@Override
	public List<ReplyProdReviewVO> read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(ReplyProdReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getBno(int no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getMaxNo() throws Exception {
		return ses.selectOne(namespace + ".getMaxNo");
	}

	@Override
	public void updateReforder(int ref, int reforder) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ReplyProdReviewVO> getListReply(int prodReview_no) throws Exception {
		return ses.selectList(namespace + ".getListReply", prodReview_no);
	}

	@Override
	public int getMaxReforder(int replyProdReview_no) throws Exception {
		return ses.selectOne(namespace + ".getMaxReforder", replyProdReview_no);
	}

}
