package com.cambak21.controller.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cambak21.domain.ReplyProdReviewVO;
import com.cambak21.service.boardProdReview.ReplyProdReviewService;

@RestController
@RequestMapping("/cambakMall")
public class BoardProdReviewReply {

	@Inject ReplyProdReviewService service;
	
	// 새로운 댓글 추가 부분
		@RequestMapping(value="/prodReviewReply", method=RequestMethod.POST)
		// json 타입으로 반환
		public ResponseEntity<String> register(@RequestBody ReplyProdReviewVO vo) {
			// @RequestBody ReplyVO vo : 유저가 입력한 데이터를 json으로 받아 ReplyVO vo에 저장
			//댓글 입력
			System.out.println("Replies... POST...");
			
			ResponseEntity<String> entity = null;
			
			try {
				// 댓글 인서트 수행
				service.addProdReply(vo);
				// ajax 정상 응답(200)
				entity = new ResponseEntity<String>("Success", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				// ajax 불량 응답(ajax의 error, 400)
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
		// 댓글 출력
		@RequestMapping(value="/getProdReviewReply/{prodReview_no}", method=RequestMethod.GET)
		public ResponseEntity<List<ReplyProdReviewVO>> getReplyList(@PathVariable("prodReview_no") int prodReview_no){
			System.out.println("Replies... GET...");
			System.out.println(prodReview_no);
			ResponseEntity<List<ReplyProdReviewVO>> entity = null;
			
			try {
				entity = new ResponseEntity<List<ReplyProdReviewVO>>(service.getListReply(prodReview_no), HttpStatus.OK);
				System.out.println(service.getListReply(prodReview_no));
			} catch (Exception e) {
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				e.printStackTrace();
			}
			System.out.println(entity);
			return entity;
		}
		
}
