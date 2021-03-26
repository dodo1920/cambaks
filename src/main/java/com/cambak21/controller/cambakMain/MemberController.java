package com.cambak21.controller.cambakMain;

import java.util.Date;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.MemberVO;
import com.cambak21.dto.LoginDTO;
import com.cambak21.service.cambakMain.MemberService;

@Controller
@RequestMapping(value="/user")
public class MemberController {

	@Inject
	private MemberService service;
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	private String login() {
		return "/cambakMain/user/login";
	}
	
	@RequestMapping(value="/login/yet", method=RequestMethod.GET)
	private String loginyet() {
		return "/cambakMain/user/login";
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	private String login(LoginDTO dto, HttpSession session, Model model) throws Exception {
		MemberVO vo = service.login(dto);
		System.out.println("유저 컨트롤러 : " );
		
		model.addAttribute("loginMember", vo);
		
		System.out.println();
		
		if(dto.isMember_cookie()) { // 자동 로그인을 눌렀을 경우
			System.out.println("***** 자동 로그인 체크 ***** ");
			int amount = 60 * 60 * 24 * 7; // 일주일의 milliSecond
			Date sesLimit = new Date(System.currentTimeMillis() + (amount * 1000)); 
			// 로그인 쿠키 값이 유지 되는 시간, sessionID를 로그인한 유저의 정보에 update 
			System.out.println("테스트! " + session.getId());
			service.keepLogin(dto.getMember_id(), session.getId(), sesLimit);
		
		}
		
		return "/cambakMain/user/login";
	}
	
	

	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
      MemberVO vo = (MemberVO)session.getAttribute("loginMember");
      System.out.println("로그아웃 하러 왔나");
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
         return "redirect:/user/login/yet";
	}
	
	
//	김대기 멤버 탈퇴 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@RequestMapping(value = "/quitMember", method = RequestMethod.GET)
	public String quitMember() {
		
		
		return "/user/quitMember";
	}
	
	@RequestMapping(value = "/quitMemberStep2", method = RequestMethod.POST)
	public void quitMemberStep2() {
		
	}

//	@RequestMapping(value = "/quitMemberStep3", method = RequestMethod.GET)
//	public void quitMemberStep3() {
//
//	}
	
	
	@RequestMapping(value = "/quitMemberStep3", method = RequestMethod.POST)
	public String quitMemberStep2(LoginDTO dto, RedirectAttributes rttr) throws Exception {
		System.out.println(dto.toString());
		if(service.memberDelete(dto)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "/user/quitMemberStep3";
	}
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<김대기 멤버 탈퇴
	
//	김도연 아이디/비번 찾기 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@RequestMapping(value="/find_idPwd", method = RequestMethod.GET)
	public String find_idPwd() {
		return "cambakMain/user/findIdnPwd";
	}
	
	@RequestMapping(value="/find_idPwd", method = RequestMethod.POST)
	public void sendMail(@RequestBody MemberVO vo) throws Exception {
		String uuid = UUID.randomUUID().toString();
		
		System.out.println(uuid);
		System.out.println(vo.getMember_email());
		System.out.println(vo.getMember_name());
		
		if(service.checkEmail(vo.getMember_email(),vo.getMember_name())) {
			System.out.println("이메일, 이름 확인 완료");
		}
	}
	
	
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<김도연 아이디/비번 찾기 탈퇴
	

	
	
	
	
}
