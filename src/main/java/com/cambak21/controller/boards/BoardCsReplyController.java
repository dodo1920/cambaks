package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyCSBoardDTO;
import com.cambak21.service.boardCS.ReplyBoardCsService;

@RestController
@RequestMapping("/board/cs")
public class BoardCsReplyController {

	@Inject
	private ReplyBoardCsService service;

	private static Logger log = LoggerFactory.getLogger(BoardCsReplyController.class);

	/**
	 * @Method Name : replyList
	 * @작성일 : 2021. 3. 18.
	 * @작성자 : 승권
	 * @변경이력 :
	 * @Method 설명 : 댓글 리스트 ajax 호출 메서드
	 * @param board_no : 해당 게시글 번호
	 * @return
	 */
	@RequestMapping("/reply/all/{board_no}")
	public ResponseEntity<List<ReplyBoardVO>> replyList(@PathVariable("board_no") int board_no) {
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

	@RequestMapping(value = "/reply/insert", method = RequestMethod.POST)
	public ResponseEntity<String> insertReply(InsertReplyCSBoardDTO dto) {
		log.info("승권 / 댓글 작성 ajax POST 호출");

		ResponseEntity<String> entity = null;

		try {
			service.insertReplyBoardCS(dto);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

}
