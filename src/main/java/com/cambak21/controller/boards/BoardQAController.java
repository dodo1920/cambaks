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

import com.cambak21.dto.InsertBoardQADTO;
import com.cambak21.dto.UpdateBoardQADTO;
import com.cambak21.service.boardQA.BoardQAService;
import com.cambak21.util.PagingCriteria;

@Controller
@RequestMapping("/board/qa")
public class BoardQAController {
	
	@Inject
	private BoardQAService service;
	
	private static Logger logger = LoggerFactory.getLogger(BoardQAController.class);
	
	@RequestMapping("/")
	public String BoardQAList(Model model, PagingCriteria cri) throws Exception {
		logger.info("게시글 리스트");
		
		model.addAttribute("boardList", service.listBoardQA(cri));
		
		return "cambakMain/board/QA/boardQAList";
	}
	
	@RequestMapping("/write")
	public String BoardQAWrite() {
		logger.info("게시글 작성");
		
		return "cambakMain/board/QA/boardQAWrite";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String BoardQAWrite(InsertBoardQADTO dto, RedirectAttributes ra) throws Exception {
		logger.info("게시글 작성(POST)");
		
		ra.addFlashAttribute("status", "writeOk");
		
		return "redirect:/board/QA/detail?no=" + service.writeBoardQA(dto); // 해당 메서드 실행하면 max(board_no)값 반환해줌
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String BoardQADetail(@RequestParam("no") int no, Model model) throws Exception {
		
		logger.info("상세게시글 호출");
		
		model.addAttribute("board", service.readBoardQA(no));
		
		return "cambakMain/board/QA/boardQADetail";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String BoardQADelete(@RequestParam("no") int board_no, RedirectAttributes ra) throws Exception {
		logger.info("게시글 삭제");
		
		service.delBoardQA(board_no);
		
		ra.addFlashAttribute("status", "deleteOk");
		
		return "redirect:/board/QA/";
	}
	
	@RequestMapping("/modi")
	public String BoardModi(@RequestParam("no") int no, Model model) throws Exception {
		logger.info("게시글 수정");
		
		model.addAttribute("board", service.readBoardQA(no));
		
		return "cambakMain/board/QA/boardQAModi";
	}
	
	@RequestMapping(value="/modi", method=RequestMethod.POST)
	public String BoardModi(UpdateBoardQADTO dto, RedirectAttributes ra) throws Exception {
		logger.info("게시글 수정(post)");
		
		service.modiBoardQA(dto);
		
		ra.addFlashAttribute("status", "modiOk");
		
		
		return "redirect:/board/QA/detail?no=" + dto.getBoard_no();
	}
	
}