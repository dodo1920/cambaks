package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.SearchCampingTipVO;
import com.cambak21.dto.CamBoardTipModifyDTO;
import com.cambak21.dto.CamBoardTipWriteDTO;
import com.cambak21.service.boardCampingTip.CampingTipBoardService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping(value="/board/*")
public class BoardCampingTip {

	@Inject
	private CampingTipBoardService service;
	
	@RequestMapping(value="/campingTip/list", method=RequestMethod.GET)
	public String listAll(PagingCriteria cri, Model model) throws Exception {
		// 캠핑팁 게시판 모든 게시글 출력
		
		model.addAttribute("boardList", service.listCampingTipBoard(cri));
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setDisplayPageNum(5);
		pp.setTotalCount(service.totalTipBoard());
		
		model.addAttribute("pagingParam", pp);
		return "cambakMain/board/campingTip/tipBoardList";
	}
	
	@RequestMapping(value="/campingTip/list/search", method=RequestMethod.GET)
	public String tipBoardSearch(SearchCampingTipVO word, Model model, PagingCriteria cri) throws Exception {
		// 캠핑팁 게시판 검색어별 결과 출력
		
		List<BoardVO> vo = service.tipBoardSearch(word, cri);
		
		model.addAttribute("boardList", vo);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setDisplayPageNum(5);
		pp.setTotalCount(service.totalTipBoardSearch(word));
		model.addAttribute("pagingParam", pp);
		model.addAttribute("search", word);
		return "cambakMain/board/campingTip/tipBoardList";
	}
	
	@RequestMapping(value="/campingTip/view", method=RequestMethod.GET)
	public String viewBoard(@RequestParam("no") int board_no, @RequestParam("id") String board_category, Model model) throws Exception {
		// 캠핑팁 상세글 조회
		
		BoardVO vo = service.viewCampingTipBoard(board_no, board_category);
		model.addAttribute("viewBoard", vo);
		return "cambakMain/board/campingTip/tipBoardView";
	}
	
	@RequestMapping(value="/campingTip/write", method=RequestMethod.GET)
	public String writeBoard() throws Exception {
		// 캠핑팁 새로운 게시글 작성 페이지 출력
		return "cambakMain/board/campingTip/tipBoardWrite";
	}
	
	@RequestMapping(value="/campingTip/write", method=RequestMethod.POST)
	public String writeBoardTip(CamBoardTipWriteDTO dto, RedirectAttributes rttr) throws Exception {
		// 캠핑팁 작성된 게시글 저장
		String result;
		
		if(service.writeCampingTipBoard(dto)) {
			result = "success";
			rttr.addAttribute("result", result);
		} else {
			result = "fail";
			rttr.addAttribute("result", result);
		}
		
		return "redirect:list?page=1";
	}
	
	@RequestMapping(value="/campingTip/modify", method=RequestMethod.GET)
	public String modifyBoardTip(String no, String id, Model model) throws Exception {
		// 캠핑팁 작성된 게시글 수정 페이지로 이동
		
		BoardVO vo = service.viewCampingTipBoard(Integer.parseInt(no), id);
		model.addAttribute("modiBoard", vo);
		return "cambakMain/board/campingTip/tipBoardModify";
	}
	
	@RequestMapping(value="/campingTip/modify", method=RequestMethod.POST)
	public String modifyBoardTip(CamBoardTipModifyDTO modifyDTO, RedirectAttributes rttr) throws Exception {
		// 캠핑팁 작성된 게시글 수정 후 상세페이지로 이동
		String result;
		
		if(service.modifyCampingTipBoard(modifyDTO)) {
			result = "success";
			rttr.addAttribute("result", result);
		} else {
			result = "fail";
			rttr.addAttribute("result", result);
		}
		return "redirect:view?id=" + modifyDTO.getBoard_category() + "&no=" + modifyDTO.getBoard_no();
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/delete", method=RequestMethod.GET)
	public ResponseEntity<String> deleteBoardTip(@RequestParam("no") int no, RedirectAttributes rttr) {
		// 캠핑팁 작성된 게시글 삭제
		ResponseEntity<String> entity = null;
		
		try {
			// 해당 게시물의 댓글 모두 삭제
			service.deleteCampingTipBoardReply(no);
			
			// 게시물 삭제 처리
			if(service.deleteCampingTipBoard(no)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				
			}
		} catch (Exception e) {
			// 삭제 실패 시 실패 메세지 전달
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/reply", method=RequestMethod.POST)
	public List<ReplyBoardVO> viewBoardReply(@RequestParam("no") int no) throws Exception {
		// 캠핑팁 상세글 댓글 조회
		
		List<ReplyBoardVO> voReply = service.readReplyCampingTipBoard(no);
		return voReply;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/reReply", method=RequestMethod.POST)
	public List<ReplyBoardVO> getRereply(@RequestParam("no") int no) throws Exception {
		// 캠핑팁 상세글 대댓글 조회
		
		List<ReplyBoardVO> voRereply = service.readRereplyCampingTipBoard(no);
		return voRereply;
	}
	
}
