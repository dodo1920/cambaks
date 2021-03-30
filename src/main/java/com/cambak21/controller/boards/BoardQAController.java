package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.BoardQAVO;
import com.cambak21.domain.SearchBoardQAVO;
import com.cambak21.dto.InsertBoardQADTO;
import com.cambak21.dto.UpdateBoardQADTO;
import com.cambak21.service.boardQA.BoardQAService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardQAController {
	
	@Inject
	private BoardQAService service;
	
	private static Logger logger = LoggerFactory.getLogger(BoardQAController.class);
	
	@RequestMapping("/qa/list.bo")
	public String BoardQAList(Model model, PagingCriteria cri) throws Exception {
		logger.info("게시글 리스트");
		model.addAttribute("boardList", service.listBoardQA(cri));
		
		logger.info(cri.toString());
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.boardQAtotalCnt());
		logger.info(pp.toString());
		
		model.addAttribute("pagingParam", pp);
		
		return "cambakMain/board/QA/boardQAList";
	}
	
	@RequestMapping("/qa/write.bo")
	public String BoardQAWrite() {
		logger.info("게시글 작성");
		
		return "cambakMain/board/QA/boardQAWrite";
	}
	
	@RequestMapping(value="/qa/write.bo", method=RequestMethod.POST)
	public String BoardQAWrite(InsertBoardQADTO dto, RedirectAttributes ra) throws Exception {
		logger.info("게시글 작성(POST)");
		System.out.println(dto.toString());
		ra.addFlashAttribute("status", "writeOk");
		
		return "redirect:/board/qa/detail.bo?no=" + service.writeBoardQA(dto); // 해당 메서드 실행하면 max(board_no)값 반환해줌
	}
	
	@RequestMapping(value="/qa/detail.bo", method=RequestMethod.GET)
	public String BoardQADetail(@RequestParam("no") int no, Model model) throws Exception {
		
		logger.info("상세게시글 호출");
		
		model.addAttribute("board", service.readBoardQA(no));
		
		return "cambakMain/board/QA/boardQADetail";
	}
	
	@RequestMapping(value="/qa/delete.bo", method=RequestMethod.GET)
	public String BoardQADelete(@RequestParam("no") int board_no, RedirectAttributes ra) throws Exception {
		logger.info("게시글 삭제");
		
		service.delBoardQA(board_no);
		
		ra.addFlashAttribute("status", "deleteOk");
		
		return "redirect:/board/qa/list.bo";
	}
	
	@RequestMapping("/qa/modi.bo")
	public String BoardModi(@RequestParam("no") int no, Model model) throws Exception {
		logger.info("게시글 수정");
		
		model.addAttribute("board", service.readBoardQA(no));
		
		return "cambakMain/board/QA/boardQAModi";
	}
	
	@RequestMapping(value="/qa/modi.bo", method=RequestMethod.POST)
	public String BoardModi(UpdateBoardQADTO dto, RedirectAttributes ra) throws Exception {
		logger.info("게시글 수정(post)");
		
		service.modiBoardQA(dto);
		
		ra.addFlashAttribute("status", "modiOk");
		
		
		return "redirect:/board/qa/detail.bo?no=" + dto.getBoard_no();
	}
	
	@RequestMapping(value="/qa/search.bo", method=RequestMethod.GET)
	public String BoardSearch(SearchCriteria scri, Model model, PagingCriteria cri) throws Exception {
		logger.info("게시글 검색");
		List<BoardQAVO> search = service.searchListBoardQA(scri, cri);
		
		model.addAttribute("boardList", search);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setDisplayPageNum(5);
		pp.setTotalCount(service.searchBoardQAtotalCnt(scri));
		model.addAttribute("pagingParam", pp);
		model.addAttribute("search", scri);
		
		System.out.println(pp.toString());
		System.out.println(scri.toString());
		
		return "cambakMain/board/QA/boardQAList";
	}
	
}