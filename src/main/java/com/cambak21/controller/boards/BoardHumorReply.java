package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.service.BoardHumor.BoardHumorReplyService;

@RestController
@RequestMapping("/cambakMain/board/humor/replies")
public class BoardHumorReply {
	
	@Inject
	private BoardHumorReplyService service;
	
	
	
	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyBoardVO>> list(@PathVariable("bno") int board_no){
		System.out.println(board_no);
		ResponseEntity<List<ReplyBoardVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<ReplyBoardVO>>(service.listReply(board_no), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
}
