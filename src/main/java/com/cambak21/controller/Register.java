package com.cambak21.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cambak21.domain.CheckListVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class Register {
        
   private static final Logger logger = LoggerFactory.getLogger(Register.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
  
   
   @RequestMapping(value="register", method = RequestMethod.GET)
   public String signup() {
      logger.info("회원가입   작업중 . . . . .");
   
      
      
      
      
      
      return "register";
   }
   

}

