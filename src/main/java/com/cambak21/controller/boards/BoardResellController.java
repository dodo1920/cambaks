package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.ResellBoardVO;
import com.cambak21.domain.ResellLikeBoardVO;
import com.cambak21.dto.ResellBoardUpdateDTO;
import com.cambak21.service.resell.ResellBoardLikeService;
import com.cambak21.service.resell.ResellBoardService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;


@Controller
@RequestMapping("/board/resell")
public class BoardResellController {
	@Inject
	private ResellBoardService resellListService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardResellController.class);

	
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String BoardResellList(PagingCriteria cri,Model model) throws Exception {
		System.out.println("boardResellList 테스트");
		model.addAttribute("board",resellListService.ResellBoardReadAll(cri));
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(resellListService.ResellBoardReadAllCnt()); // 게시물 갯수
		System.out.println(pp.toString());
		model.addAttribute("pagingParam", pp);
		return "cambakMain/board/Resell/boardResellList";
	}
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public String boardResellDetail(@RequestParam("no") int no, Model model) throws Exception{
		System.out.println("boardResellDetail 테스트");
		System.out.println("no : "+no);
		System.out.println(resellListService.ResellBoardReadDetail(no));
		model.addAttribute("board",resellListService.ResellBoardReadDetail(no));
		return "cambakMain/board/Resell/boardResellDetail";
	}
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public String BoardResellRemove(@RequestParam("no") int no, RedirectAttributes rttr) throws Exception {
		logger.info("no : "+no);
		logger.info("/remove... get호출");
		if(resellListService.ResellBoardDelete(no)) {
			System.out.println("여기까진 옴");
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/resell/list";
		
	}
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String BoardResellWrite(Model model) throws Exception {
		logger.info("/write... get호출");
		return "cambakMain/board/Resell/boardResellWrite";
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String BoardResellWrite(ResellBoardVO vo,RedirectAttributes rttr) throws Exception {
		logger.info("vo : "+vo);
		logger.info("/write... post호출");
		if(resellListService.ResellBoardInsert(vo)) {
			System.out.println("여기까진 옴");
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/resell/list";
		
	}
	@RequestMapping(value="/modi", method=RequestMethod.GET)
	public String BoardResellModi(int no,Model model) throws Exception {
		logger.info("/modi... get호출");
		logger.info("no : "+no);
		model.addAttribute("board",resellListService.ResellBoardReadDetail(no));
		
		return "cambakMain/board/Resell/boardResellModi";
	}
	@RequestMapping(value="/modi", method=RequestMethod.POST)
	public String BoardResellModi(ResellBoardUpdateDTO dto,RedirectAttributes rttr) throws Exception {
		logger.info("/modi... post호출");
		logger.info("dto : "+dto);
		if(resellListService.ResellBoardUpdate(dto)) {
			System.out.println("여기까진 옴");
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/resell/list";
	}
}
