package com.cambak21.controller.cambakMain;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/myPage/*")
public class MyPostController {
	
	
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
	public void myPageReplyInfo() throws Exception {
		
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
