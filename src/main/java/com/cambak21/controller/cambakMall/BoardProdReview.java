package com.cambak21.controller.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.ProdReviewVO;
import com.cambak21.service.boardProdReview.ProdReviewService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/cambakMall")
public class BoardProdReview {

	@Inject
	private ProdReviewService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardProdReview.class);
	
	//페이징 없는 전체 게시글 목록
//	@RequestMapping(value = "/prodReviews", method=RequestMethod.GET)
//	public void listAll(Model model) throws Exception {
//		logger.info("/prodReviewsTest 페이지 get방식 호출");
//		List<ProdReviewVO> lst = service.listProdBoard();
//		System.out.println("lst : " + lst);
//		model.addAttribute("boardList", lst);
//	}
	
	//ajax 이용 전체 게시글 목록
//	@RequestMapping(value = "/prodReviews/{product_id}", method=RequestMethod.POST)
//	public ResponseEntity<List<ProdReviewVO>> prodReviewsList(@PathVariable("product_id") int product_id){
//		ResponseEntity<List<ProdReviewVO>> entity = null;
//		
//		try {
//			entity = new ResponseEntity<List<ProdReviewVO>>(service.listProdBoard(product_id), HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<List<ProdReviewVO>>(HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
	   @RequestMapping("/prodReviews")
	   public void showProdMain() {
		   
	   }
	
	   // ajax이용 페이지 번호 클릭했을 때,
	   @RequestMapping(value = "/prodReviews/{product_id}", method=RequestMethod.POST)
	   public @ResponseBody List<ProdReviewVO> prodReviewsListPaging(@PathVariable("product_id") int product_id) {
	      System.out.println(product_id);
	      logger.info("/prodReviews의 ajax-POST방식 호출");
	      List<ProdReviewVO> prodList = null;
	      
	      try {
	         prodList = service.listProdBoard(product_id);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return prodList;
	   }
	   
	   // ajax이용 get방식 리스트 출력
	   @RequestMapping(value = "/prodReviews/{product_id}", method=RequestMethod.GET)
	   public @ResponseBody Map<String, Object> prodReviewsList(@PathVariable("product_id") int product_id) {
	      System.out.println(product_id);
	      logger.info("/prodReviews의 ajax-GET방식 호출");
	      Map<String, Object> result = new HashMap<String, Object>();
	      
	      List<ProdReviewVO> prodList = null;
	      PagingCriteria cri = new PagingCriteria();
	      PagingParam pp = new PagingParam();
	      pp.setCri(cri);
	      
	      
	      try {
	         prodList = service.listProdBoardCriteria(cri, product_id);
	         pp.setTotalCount(product_id);
	         result.put("prodList", prodList);
	         result.put("pagingParam", pp);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return result;
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
		
		return "redirect:/cambakMall/prodReviews/" + vo.getProduct_id();
	}
	
	// 페이징 처리한 전체 게시글 목록
//	@RequestMapping(value="/prodReviews/{product_id}", method=RequestMethod.GET )
//	public String prodReviewsPagingList(PagingCriteria cri, Model model, @PathVariable("product_id") int product_id) throws Exception {
//		logger.info("페이징을 이용한 전체 게시글 출력, GET 방식");
//		
//		model.addAttribute("boardList", service.listProdBoardCriteria(cri, product_id)); // 페이징 게시물을 바인딩
//		logger.info("cri.toString() : " + cri.toString());
//		
//		PagingParam pp = new PagingParam();
//		pp.setCri(cri);
//		pp.setTotalCount(service.getTotalBoardCnt()); // 전체 게시물 개수를 가져온 후 세팅
//		
//		logger.info("pp.toString() : " + pp.toString());
//		
//		model.addAttribute("pagingParam", pp); // 페이징 처리를 위한 파라메터 객체 바인딩
//		
//		return "/cambakMall/prodReviews";
//	}
	
	// ajax 이용 페이징 처리한 전체 게시글 목록
	
	
}
