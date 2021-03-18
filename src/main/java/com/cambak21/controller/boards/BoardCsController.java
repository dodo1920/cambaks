package com.cambak21.controller.boards;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
		logger.info("�듅沅� / 寃뚯떆湲� 硫붿씤 �럹�씠吏� �샇異�");
		
		model.addAttribute("boardList", service.listBoardCS(cri));
		
		return "cambakMain/boardCsList";
	}
	
	@RequestMapping("/write")
	public String BoardCsWrite() {
		logger.info("�듅沅� / 寃뚯떆湲� �옉�꽦 �럹�씠吏� �샇異�");
		
		return "cambakMain/boardCsWrite";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String BoardCsWrite(InsertCSBoardDTO dto) throws Exception {
		logger.info("�듅沅� / 寃뚯떆湲� �옉�꽦 POST �샇異�");
		
		return "redirect:/board/cs/detail?no=" + service.writeBoardCS(dto); // 해당 메서드 실행하면 max(board_no)값 반환해줌
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String BoardCsDetail(@RequestParam("no") int no, Model model) throws Exception {
		logger.info("승권 / 게시글 detail GET 호출");
		
<<<<<<< HEAD
		return "redirect:/board/cs/"; // 寃뚯떆湲� 踰덊샇濡� 蹂대궡湲곕뒗 �뼱�뼸寃�?
=======
		model.addAttribute("board", service.readBoardCS(no));
		
		return "cambakMain/boardCsDetail";
>>>>>>> 10e5a19bbecc59d3e75bc901705aa3fafadd7863
	}
	
	
}
