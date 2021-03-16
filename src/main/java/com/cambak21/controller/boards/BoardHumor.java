package com.cambak21.controller.boards;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.BoardVO;
import com.cambak21.service.BoardHumor.BoardHumorService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("cambakMain/board/humor/*")
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
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(BoardVO vo, Model model) {
		
		return "cambakMain/board/humor/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String wirtePost(BoardVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("register post 호출 ");
		logger.debug(vo.toString());
		
		if(service.insertBoardHumor(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:cambakMain/board/humor/listAll";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readBoard(@RequestParam("no") int no, Model model) throws Exception{
		model.addAttribute("board", service.readBoardHumor(no));
	}
}
