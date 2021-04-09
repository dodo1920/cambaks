package com.cambak21.controller.cambakMain;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cambak21.service.cambakMain.CambakMainService;

@Controller
@RequestMapping(value="/index/*")
public class CambakMainController {

	@Inject
	private CambakMainService service;
	
//	=============================================효원 메인부분 =================================================================
	@RequestMapping(value="/main", method=RequestMethod.GET)
	private String mainPageIndex(Model model) throws Exception {
		
		// 캠박이일 게시판 5개의 최신글 5개 씩 담아서 전달
		model.addAttribute("Boards", service.readRecentBoard());
		return "/cambakMain/cambak21Main";
	}
	
	
	
	
	
	
	
// ================================================효원 메인 끝 ==================================================================
//	==============================================도연 검색 결과 부분 ============================================================
	@RequestMapping(value="/result", method=RequestMethod.GET)
	private String getResultPage(Model model) throws Exception {
		return "/cambakMain/cambak21Result";
	}
	
	
	
	
	
	
//	==============================================도연 검색 결과 끝 ================================================================
	
//	==============================================정민 상세페이지 부분 =============================================================
	
	
	
	
	
	
//	===============================================정민 상세페이지 끝 ===============================================================
	
	
	
}
