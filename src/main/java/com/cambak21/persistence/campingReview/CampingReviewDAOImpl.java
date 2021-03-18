package com.cambak21.persistence.campingReview;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Repository
public class CampingReviewDAOImpl implements CampingReviewDAO {
	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mapper.CampingReview";
	
	@Override
	public int insertCampingReview(BoardVO vo) throws Exception {
		
		return ses.insert(namespace + ".insertCampingReview", vo);
	}


	@Override
	public BoardVO readCampingReview(int no) throws Exception {
		
		return ses.selectOne(namespace + ".readCampingReview", no);
	}

	@Override
	public int updateCampingReview(BoardVO vo) throws Exception {
		return ses.update(namespace + ".updateCampingReview", vo);
	}

	@Override
	public int deleteCampingReview(int no) throws Exception {
		return ses.update(namespace + ".deleteCampingReview", no );
	}

	@Override
	public List<BoardVO> listCampingReview(int page) throws Exception {
		
		if(page <= 0) {
			page = 1;
		}
		page = (page -1) * 10;
		return ses.selectList(namespace + ".listCampingReview", page);
	}

	@Override
	public List<BoardVO> listCampingReviewCriteria(PagingCriteria cri) throws Exception {
		
		return ses.selectList(namespace + ".listCampingReviewCriteria", cri);
	}

	@Override
	public int getTotalCampingReviewCnt() throws Exception {
		
		return ses.delete(namespace + ".getToatalCampingReviewCnt") ;
	}

	@Override
	public List<BoardVO> goSearchCampingReview(SearchCriteria scri, PagingCriteria cir) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int searchCampingReviewCnt(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReply(int no, int amount) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateViewCnt(int no) throws Exception {
		ses.update(namespace + ".updateViewCnt", no);

	}

}
