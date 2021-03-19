package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cambak21.controller.DAOTest;
import com.cambak21.domain.BoardVO;
import com.cambak21.service.boardCS.BoardCsService;
import com.cambak21.service.boardCampingReview.CampingReviewService;
import com.cambak21.service.boardProdReview.ProdReviewService;
import com.cambak21.util.PagingCriteria;

@Controller
@RequestMapping(value="/board/campingreview")
public class BoardCampingReview {

	@Inject
	private CampingReviewService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardCampingReview.class);

		
	@RequestMapping("/")
	public String BoardCsList(Model model, PagingCriteria cri) throws Exception {
		logger.info("영광 / 게시글 리스트 get방식 호출");
		
		model.addAttribute("boardList", service.listCampingReviewCriteria(cri));
		
		return "cambakMain/board/campingreview/camping-review";
	}
	
}
