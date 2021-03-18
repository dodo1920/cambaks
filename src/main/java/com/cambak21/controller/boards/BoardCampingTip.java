package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cambak21.domain.BoardVO;
import com.cambak21.service.boardCampingTip.CampingTipBoardService;
import com.cambak21.util.PagingCriteria;

@Controller
@RequestMapping(value="/board/*")
public class BoardCampingTip {

	@Inject
	private CampingTipBoardService service;
	
	@RequestMapping(value="/campingTip", method=RequestMethod.GET)
	public String listAll(PagingCriteria cri) {
		// 캠핑팁 게시판 모든 게시글 출력
		
		return "cambakMain/board/campingTip/tipBoardList";
	}
	
	
}
