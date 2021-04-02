package com.cambak21.controller.cambakMain;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/index/main/*")
public class CambakMainController {

	   @RequestMapping(value="/", method=RequestMethod.GET)
	   private String main() {
	      return "/cambakMain/cambak21MainPage";
	   }
	
}
