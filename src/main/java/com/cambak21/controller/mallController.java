package com.cambak21.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/cambakMall/*")
public class mallController {
	private static final Logger logger = LoggerFactory.getLogger(mallController.class);
	
// 김대기 장원영 주문하기 페이지>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public void order() {
		logger.info("order페이지 호출");
	}
	
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<김대기 장원영 주문하기 페이지
//	이영광	결제 페이지>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	
	
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<이영광	결제 페이지
//	김태훈	검색 결과 페이지>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	
	
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<김태훈	검색 결과 페이지



	
}
