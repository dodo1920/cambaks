package com.cambak21.service.myPost;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MyLikePostingVO;
import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.persistence.myPost.MyPostingDAO;
import com.cambak21.util.PagingCriteria;

@Service
public class MyPostingServiceImpl implements MyPostingService {
	
	@Inject
	private MyPostingDAO dao;
	
	
	/**
	  * @Method Name : getMyLikePostng
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 내가 좋아요 누른 글
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyLikePostingVO> getMyLikePostng(String member_id, PagingCriteria cri) throws Exception {
		return dao.getMyLikePostng(member_id, cri);
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
	  * @Method 설명 : 내가 작성한 글
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<BoardVO> getMyPosting(String member_id, PagingCriteria cri) throws Exception {

		
		return dao.getMyPosting(member_id, cri);
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
		return dao.getMyPostingCnt(member_id);
	}

	
	
	
	
	
	
	
	
	
	
	
	/**
	  * @Method Name : myWriteReply
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 댓글 기본 검색 
	  * @param member_id
	  * @param board_category
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyPageReplyVO> myWriteReply(String member_id, String board_category, PagingCriteria cri) throws Exception {
		// 내가 작성한 댓글 가져오기
		return dao.myWriteReply(member_id, board_category, cri);
	}

	/**
	  * @Method Name : myWriteReply
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 댓글 기본 검색 
	  * @param member_id
	  * @param board_category
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public int myReplyTotal() throws Exception {
		// 가져온 내 댓글 총 개수
		return dao.myReplyTotal();
	}
	
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : getCheckList
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 갖고 오기
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
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 지우기
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
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 :체크리스트 수정하기
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
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 등록하기
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
