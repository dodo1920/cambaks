package com.cambak21.persistence.boardCampingReview;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	private static String namespace = "com.cambak21.mapper.CampingreviewMapper";
	
	@Override
	public int insertCampingReview(BoardVO vo) throws Exception {
		return ses.insert(namespace + ".insertCampingReview", vo);
	}

	@Override
	public BoardVO readCampingReview(int no) throws Exception {
		return ses.selectOne(namespace + ".readCampingReview", no);
	}

	@Override
	public int modifyCampingReview(BoardVO vo) throws Exception {
		return ses.update(namespace + ".modifyCampingReview", vo);
	}

	@Override
	public int removeCampingReview(int no) throws Exception {
		return ses.update(namespace + ".removeCampingReview", no);
		
	}

	@Override
	public List<BoardVO> campingReviewAll() throws Exception {
		return ses.selectList(namespace + ".campingReviewAll");
	}


	@Override
	public List<BoardVO> listBoardPaging(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return ses.selectList(namespace + ".listBoardPaging", page);
	}

	@Override
	public List<BoardVO> listCampingReviewCriteria(PagingCriteria cri) throws Exception {
		return ses.selectList(namespace + ".listCampingReviewCriteria", cri);
	}

	@Override
	public int getTotalCampingReviewCnt() throws Exception {
		return ses.selectOne(namespace + ".getTotalCampingReviewCnt");
	}

	@Override
	public List<BoardVO> goSearchCampingReview(SearchCriteria scri, PagingCriteria cri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchType", scri.getSearchType());
		param.put("searchWord", scri.getSearchWord());
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		return ses.selectList(namespace + ".goSearchCampingReview", param);
	}

	@Override
	public int searchCampingReviewCnt(SearchCriteria scri) {
		return ses.selectOne(namespace + ".searchCampingReviewCnt", scri);
	}

	@Override
	public void updateReply(int no, int amount) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateViewCnt(int no) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
