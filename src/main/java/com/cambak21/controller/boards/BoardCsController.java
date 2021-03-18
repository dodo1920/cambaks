package com.cambak21.controller.boards;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.service.boardCS.BoardCsService;
import com.cambak21.util.PagingCriteria;

@Controller
@RequestMapping("/board/cs")
public class BoardCsController {
	
	@Inject
	private BoardCsService service;
	
	private static Logger logger = LoggerFactory.getLogger(BoardCsController.class);
	
	@RequestMapping("/")
	public String BoardCsList(Model model, PagingCriteria cri) throws Exception {
		logger.info("승권 / 게시글 리스트 get방식 호출");
		
		model.addAttribute("boardList", service.listBoardCS(cri));
		
		return "cambakMain/boardCsList";
	}
	
	@RequestMapping("/write")
	public String BoardCsWrite() {
		logger.info("승권 / 글 쓰기 폼 get 방식 호출");
		
		return "cambakMain/boardCsWrite";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String BoardCsWrite(InsertCSBoardDTO dto, RedirectAttributes ra) throws Exception {
		logger.info("승권 / 글 작성 POST 방식 호출");
		
		ra.addFlashAttribute("status", "writeOk");
		
		return "redirect:/board/cs/detail?no=" + service.writeBoardCS(dto); // 해당 메서드 실행하면 max(board_no)값 반환해줌
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String BoardCsDetail(@RequestParam("no") int no, Model model) throws Exception {
		logger.info("승권 / 게시글 detail GET 호출");
		
		model.addAttribute("board", service.readBoardCS(no));
		
		return "cambakMain/boardCsDetail";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String BoardCsDelete(@RequestParam("no") int board_no) throws Exception {
		
		service.deleteBoardCS(board_no);
		
		return "redirect:/board/cs/";
	}
	
	
}
