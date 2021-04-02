package com.cambak21.controller.cambakMain;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.dto.LoginDTO;
import com.cambak21.service.cambakMain.MemberService;

@Controller
@RequestMapping(value="/user")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

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
	public ResponseEntity<String> sendMail(@RequestBody FindIdVO fid) throws Exception {
		
		ResponseEntity<String> entity = null;
		String uuid = UUID.randomUUID().toString();
		boolean result = false;
		
		System.out.println(uuid);
		System.out.println(fid.toString());
		
		if(service.checkEmail(fid)) {
			
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					String subject = "<Cambak21>에서 보낸 이메일 인증번호 입니다"; // 메일 제목
					String message = "회원님, <br />"; // 메일 본문
					message += "<h2>아이디/비밀번호 찾기를 위한 인증번호입니다.</h2>";
					message += "아래의 인증번호를 확인하여 이메일 주소 인증을 완료해 주세요!<hr />";
					message += "연락처 이메일 : " + fid.getMember_email() + "<br/>";
					message += "인증번호 : " + uuid + "<br /><br />";
					message += "감사합니다!";
					
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("goot6 <goot6610@gmail.com>");
					helper.setTo(fid.getMember_email());
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
	
	@RequestMapping(value="/find_id", method = RequestMethod.POST)
	public String find_id(FindIdVO fId, Model model) throws Exception {
		System.out.println(fId.toString());
		
		List<FindIdVO> findIdLst = service.findId(fId);
		
		System.out.println(findIdLst);
		
		model.addAttribute("findId", findIdLst);
		
		return "cambakMain/user/result_id";
	}
	
	@RequestMapping(value="/find_pwd", method = RequestMethod.POST)
	public String find_pwd(FindIdVO fId, Model model) throws Exception {
		System.out.println(fId.toString());
		
		FindIdVO fid = service.findPwd(fId);
		model.addAttribute("memberInfo", fid);
		
		return "cambakMain/user/result_pwd";
	}
	
	@RequestMapping(value="/reset_pwd", method = RequestMethod.POST)
	public String reset_pwd(FindIdVO fId, Model model) throws Exception {
		System.out.println(fId.toString());
		
		if(service.updatePwd(fId)) {
			return "redirect:/user/login/yet";
		}
		
		return "error";
	}
	
	
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 김도연 아이디/비번 찾기 파트
	
//	이영광 회원가입 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	
	
	
	
	
	
	
	
	
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 이영광 회원가입 파트
	
//	김태훈 회원정보 수정 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	
	
	
	
	
	
	
	
	
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 김태훈 회원정보 수정 파트
	

	

	

	
	
	
	
}
