package com.cambak21.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cambak21.service.cambakMain.MemberService;
import com.cambak21.util.GoogleCapcha;

@Controller
@RequestMapping(value="/user/*")
public class Register {
   
	@Inject
	private MemberService service;
	private static final Logger logger = LoggerFactory.getLogger(Register.class);
  
   
   @RequestMapping(value="register", method = RequestMethod.GET)
   public String join() {
      logger.info("회원가입   작업중 . . . . .");
      return "cambakMain/user/registetConfirmation";
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
            entity = new ResponseEntity<String>("error", HttpStatus.OK);
        }

        return entity;
   }
   
   @RequestMapping(value="register/sendRegisterEmail", method = RequestMethod.POST)
   public ResponseEntity<String> sendRegisterEmail(@RequestParam("recaptcha") String recaptcha, HttpServletRequest request) {
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
            entity = new ResponseEntity<String>("error", HttpStatus.OK);
        }

        return entity;
   }
   
}

