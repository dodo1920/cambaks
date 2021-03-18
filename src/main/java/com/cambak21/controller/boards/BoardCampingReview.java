package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



import com.cambak21.service.boardCampingReview.CampingReviewService;
import com.cambak21.service.boardProdReview.ProdReviewService;

@Controller
public class BoardCampingReview {

	@Inject
	private CampingReviewService service;
	
	@RequestMapping(value="/camping-review", method = RequestMethod.GET)
	public String campingreview() throws Exception{
	
		return "cambakMain/board/campingreview/camping-review";
	}
	
}
