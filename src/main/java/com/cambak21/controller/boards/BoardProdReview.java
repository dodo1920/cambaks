package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cambak21.domain.ProdReviewVO;
import com.cambak21.service.boardProdReview.ProdReviewService;

@Controller
public class BoardProdReview {

	@Inject
	private ProdReviewService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardProdReview.class);
	
	//페이징 없는 전체 게시글 목록
	@RequestMapping(value = "/cambakMall/prodReviewsTest", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		logger.info("/prodReviewsTest 페이지 get방식 호출");
		List<ProdReviewVO> lst = service.listProdBoard();
		System.out.println("lst : " + lst);
		model.addAttribute("boardList", lst);
		
	}
}
