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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.service.boardNotice.BoardNoticeService;
import com.cambak21.service.boardNotice.NoticeReplyService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/board/notice/*")
public class BoardNotice {

	@Inject
	private BoardNoticeService service;
	
	@Inject
	private NoticeReplyService nrservice;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardHumor.class);
	
	// 전체글 출력 ( Test용 )
	@RequestMapping(value = "/listall", method = RequestMethod.GET)
	public String listAll(Model model) throws Exception{
		logger.info("종진 / listAll 전체 목록 출력");
		
		List<BoardVO> lst = service.getNoticeAll();
		System.out.println("lst : " + lst.toString());
		model.addAttribute("noticeList", lst);
		return "cambakMain/board/notice/jjongnotice";
	}
	// 페이징 처리된 게시판 출력
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public String listCri(PagingCriteria cri, Model model) throws Exception{
		logger.info("종진 / listCri 페이징처리 목록 출력");
		
		List<BoardVO> lst = service.getListCriteria(cri);
		System.out.println(lst.toString());
		
		model.addAttribute("noticeList", lst); // 게시물 데이터
	
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.getTotalNoticeCnt());
		System.out.println(pp.toString());
		model.addAttribute("pagingParam", pp);
		return "cambakMain/board/notice/jjongnotice";
	}
	
	// 게시판 상세 페이지 보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String noticehome(@RequestParam("no") int no, Model model) throws Exception{
		logger.info("종진 / read 게시판 상세 페이지 이동");
	
		model.addAttribute("noticeBoard", service.noticeRead(no));
		
		return "cambakMain/board/notice/readNotice2";
	}
	// 게시판 수정 클릭시 페이지로 이동
	@RequestMapping(value = "/modi", method = RequestMethod.GET)
	public String modiNoticepage(@RequestParam("no") int no, Model model) throws Exception{
		logger.info("종진 / 공지사항 수정 페이지 이동");
		System.out.println(no);
			
		model.addAttribute("noticeBoard", service.noticeRead(no));
		
		return "cambakMain/board/notice/modiNotice";
	}
	
	// 게시판 수정된 VO 로 게시판 수정
	@RequestMapping(value = "/modi", method = RequestMethod.POST)
	public String modiNoticeBoard(BoardVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("종진 / 공지사항 수정된 VO로 업데이트");
		
		
		return "cambakMain/board/notice/modiNotice";
	}
	
	
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String resisterNotice(BoardVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("종진 / 공지사항 작성 페이지 이동");
	
			if(service.insertNotice(vo)) {
				rttr.addFlashAttribute("result", "success");
			}
			
		return "redirect:/board/notice/listCri";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String goResisterNotice(BoardVO vo, Model model) throws Exception{
		logger.info("종진 / 공지사항 등록 페이지로 이동");
			
		return "cambakMain/board/notice/registerNotice";
	}
	
	@RequestMapping(value = "/getReply/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyBoardVO>> lst(@PathVariable("bno") int bno) throws Exception{
		logger.info("종진 / 공지사항 해당 댓글 불러오기");
			
		ResponseEntity<List<ReplyBoardVO>> entity = null;
		entity = new ResponseEntity<List<ReplyBoardVO>>(nrservice.listNoticeReply(bno), HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/modiReply/{replyBoard_no}", method = RequestMethod.POST)
	public ResponseEntity<String> Replylst(@PathVariable("replyBoard_no") int replyBoard_no, @RequestBody ReplyBoardVO vo) throws Exception{
		logger.info("종진 / 공지사항 해당 댓글 수정하기");
		ResponseEntity<String> entity = null;
		vo.setReplyBoard_no(replyBoard_no);
		System.out.println(replyBoard_no + "," + vo.toString());
		
		nrservice.modiReplyBoard(vo);
		
		entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/insertReply/", method = RequestMethod.POST)
	public ResponseEntity<String> insertReplylst(@RequestBody ReplyBoardVO vo) throws Exception{
		logger.info("종진 / 공지사항에 댓글 작성하기");
		ResponseEntity<String> entity = null;
		System.out.println(vo.toString());
		
		nrservice.insertReplyBoard(vo);
		
		
		
		return entity;
	}
	
	@RequestMapping(value = "/dropReply/{no}", method = RequestMethod.GET)
	public String dropReplylst(@PathVariable("no") int no, RedirectAttributes rttr) throws Exception{
		logger.info("종진 / 공지사항에 댓글 삭제하기");
		ResponseEntity<String> entity = null;
		if(nrservice.dropReply(no)) {
			rttr.addFlashAttribute("result", "success");
		}
		return"redirect:/board/notice/listCri";
	}
	
		@RequestMapping(value = "/remove/{no}", method = RequestMethod.GET)
	public ResponseEntity<String> removeNoticeBoard(@PathVariable("no") int no) throws Exception{
		logger.info("종진 / 공지사항에 상세글 삭제하기");
		ResponseEntity<String> entity = null;
		service.removeNoticeBoard(no);
		entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		
		return entity;
	}
	
	
	
	
}
