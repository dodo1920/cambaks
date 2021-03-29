package com.cambak21.controller.cambakMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.persistence.myPost.MyPostingDAO;
import com.cambak21.service.myPost.MyPostingService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping(value="/myPage/*")
public class MyPostController {
	
	@Inject
	private MyPostingService service;
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 박종진
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@RequestMapping(value="checkList.mp", method=RequestMethod.GET)
	public void callCheckList() throws Exception {
		
	}
	
	
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 김정민
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@RequestMapping(value="myPost.mp", method=RequestMethod.GET)
	public void myPostList() throws Exception {
		
	}
	
	
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 서효원
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@RequestMapping(value="myReply.mp", method=RequestMethod.GET)
	public String myPageReplyInfo() throws Exception {
		// 마이페이지 내 댓글 페이지로 이동
		return "cambakMain/myPage/myPageReply";
	}
	
	@ResponseBody
	@RequestMapping(value="myReplyList.mp", method=RequestMethod.POST)
	public Map<String, Object> myPageReplyList(@RequestParam("member_id") String member_id, @RequestParam("board_category")  String board_category, PagingCriteria cri)
			throws Exception {
		// 마이페이지 내 댓글 페이지 로딩 시 전체 내용 가져오기
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<MyPageReplyVO> lst = service.myWriteReply(member_id, board_category, cri);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setDisplayPageNum(5);
		pp.setTotalCount(service.myReplyTotal());
		
		param.put("myReplyList", lst);
		param.put("paging", pp);
		
		return param;
	}
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 백승권
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@RequestMapping(value="myLike.mp", method=RequestMethod.GET)
	public void myLikeList() throws Exception {
		
	}
	
}
