package com.cambak21.controller.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cambak21.domain.ProdQAVO;
import com.cambak21.service.boardProdQA.BoardProdQAService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/mall/prodDetail/*")
public class prodDetail {
	
	private static final Logger logger = LoggerFactory.getLogger(prodDetail.class);
	
	@Inject
	private BoardProdQAService QAService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String prodDetailPage(@RequestParam("no") int no, Model model, PagingCriteria cri) throws Exception {
		logger.info("상품 상세 페이지");
		
		logger.info("QA 목록 불러오기");
		
		logger.info(cri.toString());
		
		List<ProdQAVO> prodQALst = QAService.prodQAListAll(no, 1, cri);
		
		System.out.println(prodQALst.toString());
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(QAService.totalProdQACnt(1, no));
		System.out.println("totalProductQACnt : " + QAService.totalProdQACnt(1, no));
		
		System.out.println(pp.toString());
		
		if(prodQALst.size() == 0) {
			prodQALst = null;
		}
		
		model.addAttribute("prodQALst", prodQALst);
		model.addAttribute("pagingParam", pp);
		
		return "cambakMall/prodDetail";
	}
}
