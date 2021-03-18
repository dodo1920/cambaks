package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;


import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cambak21.domain.BoardVO;
import com.cambak21.service.boardCampingReview.CampingReviewService;
import com.cambak21.service.boardProdReview.ProdReviewService;

@Controller
@RequestMapping(value="/board/*")
public class BoardCampingReview {

	@Inject
	private CampingReviewService service;
	
	@RequestMapping(value="/camping-reviewAll", method = RequestMethod.GET)
	public String campingreview(Model model) throws Exception{
//		logger.info("/listAll.... get 호출");

		List<BoardVO> lst = service.campingReviewAll();
		model.addAttribute("boardList", lst);
		return "cambakMain/board/campingreview/camping-review";
	}
	
}
