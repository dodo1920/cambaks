/**
 * 
 */
package com.cambak21.persistence.myPost;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MyLikePostingVO;
import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.util.PagingCriteria;

@Repository
public class MyPostingDAOImpl implements MyPostingDAO {
	
	@Inject
	private SqlSession ses;
	private static String ns = "com.cambak21.mappers.cambakMain.myPostMapper.";

	
	
	
	
	
	
	
	/**
	  * @Method Name : getMyLikePostng
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 백승권
	  * @변경이력 : 
	  * @Method 설명 : 내가 좋아요 누른 글 리스트 출력, 페이징
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyLikePostingVO> getMyLikePostng(String member_id, PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : getMyLikePostngCnt
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 백승권
	  * @변경이력 : 
	  * @Method 설명 : 페이징 처리 위한 갯수 구하기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getMyLikePostngCnt(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
	
	
	
	
	
	
	
	

	
	/**
	  * @Method Name : getMyPosting
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 :내가 게시한 글 리스트 출력, 페이징
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<BoardVO> getMyPosting(String member_id, PagingCriteria cri) throws Exception {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".getMyPosting1", param);
	}
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : getMyPostingCnt
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 : 페이징 처리 위한 갯수 구하기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getMyPostingCnt(String member_id) throws Exception {
		return ses.selectOne(ns + ".getMyPostingCnt1", member_id);
	}
	
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : myWriteReply
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 효원
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 댓글 기본 검색 페이지
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyPageReplyVO> myWriteReply(String member_id, String board_category, PagingCriteria cri) throws Exception {
		// 내가 작성한 댓글 가져오기
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("board_category", board_category);
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + "readMyReplyList", param);
	}
	
	/**
	  * @Method Name : myWriteReply
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 효원
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 댓글 기본 검색 페이지
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public int myReplyTotal() throws Exception {
		// 가져온 내 댓글 총 개수
		return ses.selectOne(ns + "readMyReplyTotal");
	}
	
	
	
	
	

	/**
	  * @Method Name : getCheckList
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 종진
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 얻어오기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<CheckListVO> getCheckList(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : delCheckList
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 종진
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 삭제하기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<CheckListVO> delCheckList(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : modyCheckList
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 종진
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 수정하기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<CheckListVO> modyCheckList(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : resisterCheckList
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 종진
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 등록
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<CheckListVO> resisterCheckList(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}