package com.cambak21.controller.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.cambak21.domain.ChattingListVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.service.cambakMall.ChattingService;
import com.cambak21.service.cambakMall.ProdListService;


@Controller
public class ChattingController {
	
	@Inject
	private ChattingService service;
	
	@RequestMapping("/userChatting")
	public String userChatting (@SessionAttribute("loginMember") MemberVO loginMember, Model model) throws Exception {
		
		model.addAttribute("chatting", service.getChatting(loginMember.getMember_id()));
		model.addAttribute("popularList", service.popularProdList()); // 하단에 인스타그램 형식 사진 출력
		model.addAttribute("userImg", loginMember.getMember_img());
		
		return "cambakMall/userChatting";
	}
	
	@RequestMapping("/adminChatting")
	public String adminChatting (@RequestParam("id") String member_id, Model model) throws Exception {
		
		model.addAttribute("chatting", service.getChatting(member_id));
		
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
	@PostMapping("/fromUser/{msg}")
	public ResponseEntity<String> fromUser (@PathVariable("msg") String msg, @SessionAttribute("loginMember") MemberVO loginMember) {
		ResponseEntity<String> entity = null;
		
		try {
			service.fromUser(loginMember.getMember_id(), msg);
			new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@PostMapping("/fromAdmin/{msg}/{member_id}")
	public ResponseEntity<String> fromUser (@PathVariable("msg") String chatting_content, @PathVariable("member_id") String member_id) {
		ResponseEntity<String> entity = null;
		
		try {
			service.fromAdmin(member_id, chatting_content);
			new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@PostMapping("/isRead/{who}/{member_id}")
	public ResponseEntity<String> updateIsRead (@PathVariable("member_id") String member_id, @PathVariable("who") String who) {
		ResponseEntity<String> entity = null;
		
		try {
			service.updateIsRead(member_id, who);
			new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}

}
