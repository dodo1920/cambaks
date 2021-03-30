package com.cambak21.controller.cambakMain;

import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
   
   @Autowired
   private JavaMailSenderImpl mailSender;
   
   
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
               if(vo == null) {
                  System.out.println("회원이름 못찾음");
                  return "/cambakMain/user/login";
               }
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
	@RequestMapping(value = "/resign", method = RequestMethod.GET)
	public String quitMember() {
		
		return "cambakMain/user/resign";
		
	}
	
	@RequestMapping(value = "/resignStep2", method = RequestMethod.POST)
	public String quitMemberStep2() {
		return "cambakMain/user/resignStep2";
	}
	
	
	@RequestMapping(value = "/resignStep3", method = RequestMethod.POST)
	public String quitMemberStep2(LoginDTO dto, RedirectAttributes rttr) throws Exception {
		System.out.println(dto.toString());
		if(service.memberDelete(dto)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "cambakMain/user/resignStep3";
	}
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 김대기 멤버 탈퇴
	
//	김도연 아이디/비번 찾기 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@RequestMapping(value="/find_idPwd", method = RequestMethod.GET)
	public String find_idPwd() {
		return "cambakMain/user/findIdnPwd";
	}
	
	@RequestMapping(value="/find_idPwd", method = RequestMethod.POST)
	public ResponseEntity<String> sendMail(@RequestBody MemberVO vo) throws Exception {
		
		ResponseEntity<String> entity = null;
		String uuid = UUID.randomUUID().toString();
		
		System.out.println(uuid);
		System.out.println(vo.getMember_email());
		System.out.println(vo.getMember_name());
		
		if(service.checkEmail(vo.getMember_email(),vo.getMember_name())) {
			System.out.println("이름, 이메일 확인 완료");
			
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					String subject = "<Cambak21>에서 보낸 이메일 인증번호 입니다"; // 메일 제목
					String message = vo.getMember_name() + "님, <br />"; // 메일 본문
					message += "<h2>아이디/비밀번호 찾기를 위한 인증번호입니다.</h2>";
					message += "아래의 인증번호를 확인하여 이메일 주소 인증을 완료해 주세요!<hr />";
					message += "연락처 이메일 : " + vo.getMember_email() + "<br/>";
					message += "인증번호 : " + uuid + "<br /><br />";
					message += "감사합니다!";
					
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("goot6 <goot6610@gmail.com>");
					helper.setTo(vo.getMember_email());
					helper.setSubject(subject);
					helper.setText(message, true);
				}
			};
			
			mailSender.send(preparator);
			
			entity = new ResponseEntity<String>(uuid, HttpStatus.OK);
			
			return entity;
		}
		
		return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	@RequestMapping(value="/find_id", method = RequestMethod.GET)
	public void find_id(@RequestParam("member_email") String member_email, @RequestParam("member_name") String member_name) {
		System.out.println(member_name);
		System.out.println(member_email);
	}
	
	
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 김도연 아이디/비번 찾기 파트
	
//	이영광 회원가입 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	
	
	
	
	
	
	
	
	
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 이영광 회원가입 파트
	
//	김태훈 회원정보 수정 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	
	
	
	
	
	
	
	
	
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 김태훈 회원정보 수정 파트
	

	

	

	
	
	
	
}
