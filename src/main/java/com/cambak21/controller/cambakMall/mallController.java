package com.cambak21.controller.cambakMall;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/cambakMall/*")
public class mallController {
	private static final Logger logger = LoggerFactory.getLogger(mallController.class);
	
	// **************************************** 김도연 컨트롤러 ********************************************** 
	
	// **************************************** 김대기 컨트롤러 ********************************************** 
	@RequestMapping(value = "/prodOrder", method = RequestMethod.GET)
	public void order() {
		
	}
	
	// **************************************** 박종진 컨트롤러 **********************************************
	
	// **************************************** 장원영 컨트롤러 **********************************************
	
	// **************************************** 김정민 컨트롤러 **********************************************
	
	// **************************************** 이영광 컨트롤러 **********************************************
	
	// **************************************** 서효원 컨트롤러 **********************************************
	
	// **************************************** 백승권 컨트롤러 ********************************************** 
	
	// **************************************** 김태훈 컨트롤러 ********************************************** 

	
}
