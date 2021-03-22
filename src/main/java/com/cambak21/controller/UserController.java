package com.cambak21.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.MemberVO;
import com.cambak21.dto.LoginDTO;
import com.cambak21.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Inject
	private UserService service;
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	private void login() {
		
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	private void login(LoginDTO dto, HttpSession session, Model model) throws Exception {
		MemberVO vo = service.login(dto);
		System.out.println("유저 컨트롤러 : " + vo.toString());
					if(vo == null) {
						return;
					}
		model.addAttribute("loginMember", vo);
		
		if(dto.isMember_cookie()) { // 자동 로그인을 눌렀을 경우
			System.out.println("***** 자동 로그인 체크 ***** ");
			int amount = 60 * 60 * 24 * 7; // 일주일의 milliSecond
			
			Date sesLimit = new Date(System.currentTimeMillis() + (amount * 1000)); 
			// 로그인 쿠키 값이 유지 되는 시간, sessionID를 로그인한 유저의 정보에 update 
			System.out.println("테스트! " + session.getId());
			service.keepLogin(dto.getMember_id(), session.getId(), sesLimit);
		
		}
		
	}
	
	

	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("loginMember");
	
		if(vo != null) {
			session.removeAttribute("loginMember");
			session.invalidate();
			 Cookie loginCook = WebUtils.getCookie(request, "ssid");
		
		 if(loginCook != null) {
			 loginCook.setPath("/");
			 loginCook.setMaxAge(0);
			 response.addCookie(loginCook);
			 
			 service.keepLogin(vo.getMember_id(), session.getId(), new Date());
		 }
		
		}
			return "/home";
	}
	
	
	
	
	
}
