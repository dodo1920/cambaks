package com.cambak21.controller.cambakMall;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cambak21.service.cambakMall.ChattingService;


@Controller
public class ChattingController {
	
	@Inject
	private ChattingService service;
	
	@RequestMapping("/chattingTest")
	public String test () {
		return "cambakMall/userChatting";
	}
	
	@RequestMapping("/chattingTest2")
	public String test2 () {
		return "cambakMall/adminChatting";
	}
	
	@RequestMapping("/chattingList")
	public String chattingList (Model model) throws Exception {
		
		model.addAttribute("ChattingList", service.chattingList());
		return "cambakMall/chatiingList";
	}
	
	/**
	  * @Method Name : fromUser
	  * @작성일 : 2021. 4. 19.
	  * @작성자 : 유저가 채팅 보낼 시 DB Insert작업
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param msg
	  * @return
	  */
	@RequestMapping("/fromUser/{msg}")
	public ResponseEntity<String> fromUser (@PathVariable("msg") String msg) {
		ResponseEntity<String> entity = null;
		
		System.out.println("컨트롤러단 msg : " + msg);
		
		try {
			// member_id 수정해야함
			service.fromUser("test123", msg);
			new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}

}
