package com.cambak21.controller.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.ProdReviewVO;
import com.cambak21.service.boardProdReview.ProdReviewService;

@Controller
@RequestMapping("/cambakMall")
public class BoardProdReview {

	@Inject
	private ProdReviewService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardProdReview.class);
	
	//페이징 없는 전체 게시글 목록
	@RequestMapping(value = "/prodReviews", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		logger.info("/prodReviewsTest 페이지 get방식 호출");
		List<ProdReviewVO> lst = service.listProdBoard();
		System.out.println("lst : " + lst);
		model.addAttribute("boardList", lst);
	}
	
	@RequestMapping(value="/writingProdReviews", method = RequestMethod.GET)
	public String writingProdReviewGet() throws Exception{
		logger.info("/writingProdReviews의 get방식 호출");
		return "cambakMall/prodReviewsWriting";
	}
	
	@RequestMapping(value="/writingProdReviews", method = RequestMethod.POST)
	public String writingProdReviewPost(ProdReviewVO vo, RedirectAttributes rttr) throws Exception {
		// 상품후기 게시글 작성 페이지에서 등록 버튼 클릭 시
		logger.info("/writingProdReviews의 post방식 호출");
		logger.info(vo.toString());
		
		if(service.insert(vo) == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/cambakMall/prodReviews";
	}
}
