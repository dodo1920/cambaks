package com.cambak21.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
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
	@RequestMapping(value = "/mall", method = RequestMethod.GET)
	public String homeheader(Locale locale, Model model) {
		logger.info("homeheader 작업중 . . . . .");
	
		
		return "mall";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
