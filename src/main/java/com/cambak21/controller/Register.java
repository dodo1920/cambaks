package com.cambak21.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/user/*")
public class Register {
        
   private static final Logger logger = LoggerFactory.getLogger(Register.class);
  
   
   @RequestMapping(value="register", method = RequestMethod.GET)
   public String join() {
      logger.info("회원가입   작업중 . . . . .");
   
      return "cambakMain/user/join";
   }
   

}

