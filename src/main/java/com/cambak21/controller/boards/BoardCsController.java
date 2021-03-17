package com.cambak21.controller.boards;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		logger.info("승권 / 게시글 메인 페이지 호출");
		
		model.addAttribute("boardList", service.listBoardCS(cri));
		
		return "cambakMain/boardCsList";
	}
	
	@RequestMapping("/write")
	public String BoardCsWrite() {
		logger.info("승권 / 게시글 작성 페이지 호출");
		
		return "cambakMain/boardCsWrite";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String BoardCsWrite(InsertCSBoardDTO dto) throws Exception {
		logger.info("승권 / 게시글 작성 POST 호출");
		
		return "redirect:/board/cs/detail?no=" + service.writeBoardCS(dto); // 해당 메서드 실행하면 max(board_no)값 반환해줌
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String BoardCsDetail(@RequestParam int no, Model model) throws Exception {
		logger.info("승권 / 게시글 detail GET 호출");
		
		model.addAttribute("board", service.readBoardCS(no));
		
		return "cambakMain/boardCsDetail";
	}
	
}
