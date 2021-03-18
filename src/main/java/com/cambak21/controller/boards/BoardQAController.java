package com.cambak21.controller.boards;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.service.boardCS.BoardCsService;
import com.cambak21.util.PagingCriteria;

@Controller
@RequestMapping("/board/qa")
public class BoardQAController {
	
	@Inject
	private BoardCsService service;
	
	private static Logger logger = LoggerFactory.getLogger(BoardQAController.class);
	
	@RequestMapping("/")
	public String BoardQAList(Model model, PagingCriteria cri) throws Exception {
		logger.info("원영 / 게시글 전체 페이지 호출");
		
		model.addAttribute("QAList", service.listBoardCS(cri));
		
		return "cambakMain/boardCsList";
	}
	
	@RequestMapping("/write")
	public String BoardCsWrite() {
		logger.info("원영 / 게시글 작성 페이지 호출");
		
		return "cambakMain/boardCsWrite";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String BoardCsWrite(InsertCSBoardDTO dto) throws Exception {
		logger.info("원영 / 게시글 작성 POST 호출");
		
		service.writeBoardCS(dto);
		
		return "redirect:/board/cs/"; // 게시글 번호로 보내기는 어떻게?
	}
	
}