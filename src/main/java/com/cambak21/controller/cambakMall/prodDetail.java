package com.cambak21.controller.cambakMall;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mall/prodDetail")
public class prodDetail {
	private static final Logger logger = LoggerFactory.getLogger(prodDetail.class);
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String QAListAll(Locale locale, Model model) {
		logger.info("QA 목록 불러오기");
		
		return "cambakMall/prodDetail";
	}
}
