package com.cambak21.controller.boards;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cambak21.dto.InsertBoardQADTO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.service.boardCS.BoardCsService;
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
		logger.info("원영 / 게시글 전체 페이지 호출");
		
		model.addAttribute("QAList", service.listBoardQA(cri));
		
		return "cambakMain/board/QA/boardQAList";
	}
	
	@RequestMapping("/write")
	public String BoardQAWrite() {
		logger.info("원영 / 게시글 작성 페이지 호출");
		
		return "cambakMain/boardQAWrite";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String BoardQAWrite(InsertBoardQADTO dto) throws Exception {
		logger.info("원영 / 게시글 작성 POST 호출");
		
		service.writeBoardQA(dto);
		
		return "redirect:/board/qa/"; // 게시글 번호로 보내기는 어떻게?
	}
	
}
