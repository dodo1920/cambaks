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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.ProdQAVO;
import com.cambak21.dto.ProdQAInsertDTO;
import com.cambak21.dto.ProdQAUpdateDTO;
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
	public String prodDetailPage(@RequestParam("prodId") int prodId, Model model, PagingCriteria cri) throws Exception {
		logger.info("상품 상세 페이지");
		
		logger.info("QA 목록 불러오기");
		
		logger.info(cri.toString());
		
		List<ProdQAVO> prodQALst = QAService.prodQAListAll(prodId, 1, cri);
		
		System.out.println(prodQALst.toString());
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(QAService.totalProdQACnt(1, prodId));
		System.out.println("totalProductQACnt : " + QAService.totalProdQACnt(1, prodId));
		
		System.out.println(pp.toString());
		
		if(prodQALst.size() == 0) {
			prodQALst = null;
		}
		
		model.addAttribute("prodQALst", prodQALst);
		model.addAttribute("pagingParam", pp);
		
		return "cambakMall/prodDetail";
	}
	
	@RequestMapping(value="/prodQAForm", method=RequestMethod.GET)
	public String ShowInsertProdQA(@RequestParam("prodId") int prodId) throws Exception {
		logger.info("QA 글쓰기 페이지 소환");
		
		return "cambakMall/prodQAForm";
	}
	
	@RequestMapping(value="/prodQAForm", method=RequestMethod.POST)
	public String InsertProdQA(@RequestParam("prodId") int prodId, ProdQAInsertDTO insertQA, RedirectAttributes rttr) throws Exception {
		logger.info("QA 글쓰기 저장");
		
		insertQA.setProduct_id(prodId);
		
		if(insertQA.getProdQA_isSecret().equals("on")) {
			insertQA.setProdQA_isSecret("Y");
		} else {
			insertQA.setProdQA_isSecret("N");
		}
		
		int getMaxNo = QAService.getMaxNo();
		
		int newNo = getMaxNo + 1;
		
		insertQA.setProdQA_ref(newNo);
		
		System.out.println(insertQA.toString());
		
		if(QAService.insertProdQA(insertQA)) {
			rttr.addAttribute("result", "success");
		}
		
		return "redirect:/mall/prodDetail/main?prodId=" + prodId;
	}
	
	@RequestMapping(value="/prodQAModiForm", method=RequestMethod.GET)
	public String showModiProdQA(@RequestParam("no") int no, @RequestParam("prodId") int prodId, Model model) throws Exception {
		logger.info("QA 글 수정 페이지 소환");
		
		model.addAttribute("prodQA", QAService.prodQADetail(prodId, no));
		System.out.println(model);
		
		return "cambakMall/prodQAModiForm";
	}
	
	@RequestMapping(value="/prodQAModiForm", method=RequestMethod.POST)
	public String modiProdQA(@RequestParam("prodId") int prodId, ProdQAUpdateDTO updateQA, RedirectAttributes rttr) throws Exception {
		updateQA.setProduct_id(prodId);
		
		System.out.println(updateQA);
		
		if(updateQA.getProdQA_isSecret().equals("on")) {
			updateQA.setProdQA_isSecret("Y");
		} else {
			updateQA.setProdQA_isSecret("N");
		}
		
//		if(QAService.updateProdQA(updateQA)) {
//			rttr.addAttribute("result", "success");
//		}
		
		return "redirect:/mall/prodDetail/main?prodId=" + prodId;
	}
}
