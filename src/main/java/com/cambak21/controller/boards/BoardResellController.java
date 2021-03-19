package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cambak21.domain.ResellBoardVO;
import com.cambak21.domain.ResellLikeBoardVO;
import com.cambak21.service.resell.ResellBoardLikeService;
import com.cambak21.service.resell.ResellBoardService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;


@Controller
@RequestMapping("/board/resell")
public class BoardResellController {
	@Inject
	private ResellBoardService resellListService;
	
	@Inject
	private ResellBoardLikeService resellLikeService;
	
	
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
	@RequestMapping(value = "/detail")
	public String boardResellDetail(@RequestParam("no") int no, Model model) throws Exception{
		System.out.println("boardResellDetail 테스트");
		System.out.println("no : " + no);
		return "cambakMain/board/Resell/boardResellDetail";
	}
	
}
