package com.cambak21.controller.cambakMain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cambak21.domain.CampingVO;
import com.cambak21.service.cambakMain.CambakMainService;

@Controller
@RequestMapping(value="/index/*")
public class CambakMainController {

	@Inject
	private CambakMainService service;
	
//	=============================================효원 메인부분 =================================================================
	@RequestMapping(value="/main", method=RequestMethod.GET)
	private String mainPageIndex(Model model) throws Exception {
		
		// 캠박이일 추천 캠핑장 3곳 랜덤으로 담아서 전달
		model.addAttribute("CampingSites", service.randomListCambak());
		
		// 캠박이일 게시판 5개의 최신글 5개 씩 담아서 전달
		model.addAttribute("Boards", service.readRecentBoard());
		
		return "/cambakMain/cambak21Main";
	}
	
	
	
	
	
	
	
// ================================================효원 메인 끝 ==================================================================
//	==============================================도연 검색 결과 부분 ============================================================
	@RequestMapping(value="/result", method=RequestMethod.GET)
	private String getResultPage(@RequestParam("keyword") String keyword, Model model) throws Exception {
		List<CampingVO> campingLst = new ArrayList<CampingVO>();
		
		campingLst = service.getCampings(keyword);
		model.addAttribute("campings", campingLst);
		
		return "/cambakMain/cambak21Result";
	}
	
	
	
	
	
	
//	==============================================도연 검색 결과 끝 ================================================================
	
//	==============================================정민 상세페이지 부분 =============================================================
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	private String getDetailPage() throws Exception {
		
		return "/cambakMain/cambak21Detail";
	}
	
	@RequestMapping(value="/campingDetail/{contentId}", method=RequestMethod.POST)
	private @ResponseBody CampingVO showCampingDetail(@PathVariable("contentId") String camping_contentId) throws Exception {
		System.out.println("campingDetail Post방식");
		System.out.println(camping_contentId);
		CampingVO vo = null;
		vo = service.getCampingDetail(camping_contentId);
		System.out.println(vo.toString());
		
		return vo;
	}
	
	
	
	
	
//	===============================================정민 상세페이지 끝 ===============================================================
	
	
	
}
