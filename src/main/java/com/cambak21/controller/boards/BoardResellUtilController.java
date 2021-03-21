package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cambak21.domain.ReplyResellVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.domain.ResellLikeBoardVO;
import com.cambak21.service.resell.ResellBoardLikeService;
import com.cambak21.service.resell.ResellBoardReplyService;

@Controller 
@RequestMapping("/utile")
public class BoardResellUtilController {
	@Inject
	private ResellBoardReplyService ReplyService;
	
	@Inject
	private ResellBoardLikeService LikeService;
	
	@RequestMapping(value = "/reply/all/{bno}",method = RequestMethod.GET)
	public ResponseEntity<List<ResellBoardVO>> list(@PathVariable("bno") int bno) throws Exception{
		System.out.println(bno);
		 ResponseEntity<List<ResellBoardVO>> entity = null;
		System.out.println(ReplyService.ResellBoardReplyRead(bno));
		 try{
			 entity = new ResponseEntity<List<ResellBoardVO>>(ReplyService.ResellBoardReplyRead(bno),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); //예외가 발생하면 list<RdplyVO)는 null이므로 ..>> ResoinseEntity<>
		}
		 return entity;
		
	}
	@RequestMapping(value = "",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyResellVO vo) {
		System.out.println("Rplies.........POST방식 연결");
		System.out.println(vo);
		ResponseEntity<String> entity = null;
		try {
			ReplyService.ResellBoardReplyInsert(vo);
			entity = new ResponseEntity<String>("Success",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "like",method=RequestMethod.POST)
	public ResponseEntity<String> like(@RequestBody ResellLikeBoardVO vo) {
		System.out.println("like.........POST방식 연결");
		System.out.println(vo);
		ResponseEntity<String> entity = null;
//		try {
//			LikeService.ResellBoardLikeInsert(vo);
//			entity = new ResponseEntity<String>("Success",HttpStatus.OK);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
//		}
		return entity;
	}
}
