package com.cambak21.persistence.boardProdReview;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ReplyProdReviewVO;

@Repository
public class ReplyProdReviewDAOImpl implements ReplyProdReviewDAO {

	@Inject
	private SqlSession ses;
	private static final String namespace = "com.cambak21.mapper.ReplyProdReviewMapper";
	
	@Override
	public int addProdReply(ReplyProdReviewVO vo) throws Exception {
		return ses.insert(namespace + ".addProdReply", vo);
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReforder(int ref, int reforder) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ReplyProdReviewVO> getListReply(int prodReview_no) throws Exception {
		return ses.selectList(namespace + ".getListReply", prodReview_no);
	}

}
