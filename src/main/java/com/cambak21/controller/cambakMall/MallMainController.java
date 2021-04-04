package com.cambak21.controller.cambakMall;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/mall/main/*")
public class MallMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MallMainController.class);
	  
	   /**
	    * @Method Name : homeheader
	    * @작성일 : 2021. 3. 12.
	    * @작성자 : 박종진
	    * @변경이력 : 캠박몰 메인 컨트롤러 - 맵핑 추가
	    * @Method 설명 : 캠박몰 메인 URI 설정
	    * @param locale
	    * @param model
	    * @return
	    */
	
	   @RequestMapping(value = "", method = RequestMethod.GET)
	   public String homeheader(Locale locale, Model model) {
	      logger.info("JJONG homeheader 작업중 . . . . .");
	   
	      return "cambakMall/mall";
	   }
	   
	      

}
