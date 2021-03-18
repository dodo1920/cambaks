package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.service.boardCS.ReplyBoardCsService;

@RestController
@RequestMapping("/board/cs")
public class BoardCsReplyController {

	@Inject
	private ReplyBoardCsService service;

	private static Logger log = LoggerFactory.getLogger(BoardCsReplyController.class);
	
	@RequestMapping("/reply/all/{board_no}")
	public ResponseEntity<List<ReplyBoardVO>> replyList(@PathVariable("board_no") int board_no ) {
		log.info("댓글 리스트 get 방식 호출 ajax");
		
		ResponseEntity<List<ReplyBoardVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<ReplyBoardVO>>(service.getReplyListBoardCS(board_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
}
