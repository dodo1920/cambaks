package com.cambak21.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cambak21.service.cambakMain.MemberService;

@Controller
@RequestMapping(value="/user/*")
public class Register {
   
	@Inject
	private MemberService service;
	private static final Logger logger = LoggerFactory.getLogger(Register.class);
  
   
   @RequestMapping(value="register", method = RequestMethod.GET)
   public String join() {
      logger.info("회원가입   작업중 . . . . .");
      return "cambakMain/user/join";
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

}

