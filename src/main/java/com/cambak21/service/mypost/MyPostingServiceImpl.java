package com.cambak21.service.mypost;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MyLikePostingVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.util.PagingCriteria;

@Service
public class MyPostingServiceImpl implements MyPostingService {

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
	  * @Method 설명 : 내가 작성한 글
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<BoardVO> getMyPosting(String member_id, PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	  * @Method Name : myWriteReply
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 댓글 기본 검색 
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<ReplyBoardVO> myWriteReply(String member_id, PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	  * @Method Name : myWriteReply
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 댓글 기간별 검색
	  * @param member_id
	  * @param cri
	  * @param fromDate
	  * @param toDate
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<ReplyBoardVO> myWriteReply(String member_id, PagingCriteria cri, String fromDate, String toDate)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
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
