package com.cambak21.controller.boards;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cambak21.service.BoardHumor.BoardHumorService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("board/humor/*")
public class BoardHumor {
	
	@Inject
	private BoardHumorService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardHumor.class);
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(PagingCriteria cri, Model model) throws Exception{
		logger.info("전체 목록 출력!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		model.addAttribute("boardList", service.listBoardHumorCriteria(cri));
		
		logger.info(cri.toString());
		
		PagingParam pp = new PagingParam();
		
		pp.setCri(cri);
		pp.setTotalCount(service.getTotalBoardHumorCnt());
		
		model.addAttribute("pagingParam", pp);
		logger.info(pp.toString());
		
	}
}
