package com.cambak21.controller.cambakMall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ChattingController {
	
	@RequestMapping("/chattingTest")
	public String test () {
		return "cambakMall/chattingTest";
	}

}
