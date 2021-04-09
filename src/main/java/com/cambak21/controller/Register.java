package com.cambak21.controller;

import java.io.IOException;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cambak21.domain.MemberVO;
import com.cambak21.service.cambakMain.MemberService;
import com.cambak21.util.GoogleCapcha;

@Controller
@RequestMapping(value="/user/*")
public class Register {
   
	@Inject
	private MemberService service;
	private static final Logger logger = LoggerFactory.getLogger(Register.class);

	@Autowired
	private JavaMailSenderImpl mailSender;
	
   
   @RequestMapping(value="register", method = RequestMethod.GET)
   public String register() {
      return "cambakMain/user/registetConfirmation";
   }
   
   @RequestMapping(value="join", method = RequestMethod.GET)
   public String join() {
      return "cambakMain/user/join";
   }
   
   @RequestMapping(value="joinComplete", method = RequestMethod.POST)
   public String joinMember(MemberVO vo, Model model) throws Exception {
	   String result;
	   System.out.println(vo.toString());
	   
	   if (vo.getMember_img() == null) {
		   vo.setMember_img("/resources/cambak21/img/profileDefualt.png");
	   }
	   
	   if (service.memberInsert(vo)) {
		   model.addAttribute("joinMember", vo);
		   result = "success";
		   model.addAttribute("result", result);
	   } else {
		   result = "fail";
		   model.addAttribute("result", result);
	   }
	   	   
	   return "cambakMain/user/joinComplete";
   }
   
   @RequestMapping(value="register/checkId", method = RequestMethod.POST)
   public ResponseEntity<String> checkId(@RequestParam("member_id") String member_id) {
	   // 유저가 작성한 ID 중복 확인
	   ResponseEntity<String> entity = null;
	   try {
			if (service.checkUserId(member_id)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
       return entity;
   }

   @RequestMapping(value="register/checkRecaptcha", method = RequestMethod.POST)
   public ResponseEntity<String> checkRecaptcha(@RequestParam("recaptcha") String recaptcha, HttpServletRequest request) {
	   // 유저 recapcha 체크하기
	   ResponseEntity<String> entity = null;
	   
	   GoogleCapcha.setSecretKey("6LcPSqIaAAAAAJL1k-pAZ1KuLXHzGCDG_aB80L8s");
        //0 = 성공, 1 = 실패, -1 = 오류
        try {
            if(GoogleCapcha.verify(recaptcha)) {
            	entity = new ResponseEntity<String>("success", HttpStatus.OK);
            } else {
            	entity = new ResponseEntity<String>("fail", HttpStatus.OK);
            }
        } catch (IOException e) {
        	e.printStackTrace();
			entity = new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
        }

        return entity;
   }
   
   @RequestMapping(value="register/sendRegisterEmail", method = RequestMethod.POST)
   public ResponseEntity<String> sendRegisterEmail(@RequestParam("userEmail") String userEmail, HttpServletRequest request) throws Exception {
	   // 유저 recapcha 체크하기
	   
	   ResponseEntity<String> entity = null;
	   String uuid = UUID.randomUUID().toString();
	   System.out.println(uuid);
	   

		if (service.checkRegisterEmail(userEmail)) { // 작성한 이메일 사용 가능
			   entity = new ResponseEntity<String>("possibility", HttpStatus.OK);
			   
				final MimeMessagePreparator preparator = new MimeMessagePreparator() {
					
					@Override
					public void prepare(MimeMessage mimeMessage) throws Exception {
						String subject = "<Cambak21>에서 보낸 이메일 인증번호 입니다"; // 메일 제목
						String message = "회원님, <br />"; // 메일 본문
						message += "회원가입 하려면 ";
						message += "http://localhost:8081/user/join?user=" + uuid + "&email=" + userEmail;
						message += " 로 들어오셈";
						
						final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
						helper.setFrom("goot6 <goot6610@gmail.com>");
						helper.setTo(userEmail);
						helper.setSubject(subject);
						helper.setText(message, true);
					}
				};
				
				mailSender.send(preparator); // 메일 발송
				HttpSession ses = request.getSession();
				ses.setAttribute("registerUUID", uuid);
				ses.setAttribute("registerEmail", userEmail);
				
		   } else { // 중복되는 이메일이 있음
			   entity = new ResponseEntity<String>("impossibility", HttpStatus.OK);
		   }
		
        return entity;
   }
   
}

