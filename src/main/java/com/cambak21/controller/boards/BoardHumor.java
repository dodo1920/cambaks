package com.cambak21.controller.boards;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
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
		
		return "redirect:/cambakMain/board/humor/listAll?page=1";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readBoard(@RequestParam("no") int no, Model model) throws Exception{
		model.addAttribute("board", service.readBoardHumor(no));
	}
	
	@RequestMapping(value = "/modi", method = RequestMethod.GET)
	public void modiBoard(@RequestParam("no") int no, Model model) throws Exception{
		model.addAttribute("board", service.readBoardHumor(no));
	}
	
	@RequestMapping(value = "/modi", method = RequestMethod.POST)
	public String modiBoardPost(BoardVO vo, RedirectAttributes rttr) throws Exception{
		
		System.out.println(vo.toString());
		if(service.modifyBoardHumor(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/cambakMain/board/humor/listAll?page=1";
	}
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String delBoard(@RequestParam("no") int no, RedirectAttributes rttr) throws Exception{
		if(service.removeBoardHumor(no)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/cambakMain/board/humor/listAll?page=1";
	}
	
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void test() {
		
	}
}
