package com.cambak21.controller;

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
import com.cambak21.controller.boards.BoardHumor;
import com.cambak21.domain.CheckListVO;
import com.cambak21.service.mypost.CheckListService;

@Controller
@RequestMapping("myPage/checkList")
public class CheckListController {
	
	@Inject
	private CheckListService ckservice;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardHumor.class);
	
   @RequestMapping(value="", method = RequestMethod.GET)
   public String checkList() {
      logger.info("JJONG ckeckList2 작업중 . . . . .");
   
      
      return "cambakMain/myPage/checkList";
   }
	   
	   
	@RequestMapping(value = "/ajax/{member_id}", method = RequestMethod.GET)
	public  ResponseEntity<List<CheckListVO>> ajaxcheckList(Model model, @PathVariable("member_id") String member_id) throws Exception{
		logger.info("종진 / ajax/checkList 전체 목록 ckeckList로 전달, 멤버아디는 :" + member_id);
	
		ResponseEntity<List<CheckListVO>> entity = null;
		entity = new ResponseEntity<List<CheckListVO>>(ckservice.getCheckListAll(member_id), HttpStatus.OK);
	
		return entity;
	}

	@RequestMapping(value = "/ajax/change/{checkList_checked}/{checkList_no}", method = RequestMethod.GET)
	public ResponseEntity<String> changeCheckList(@PathVariable("checkList_checked") String checkList_checked, @PathVariable("checkList_no") int checkList_no) throws Exception{
		logger.info("종진 / 체크리스트 체크여부 수정하기");
		ResponseEntity<String> entity = null;
		
		if(ckservice.changeCheckList(checkList_checked, checkList_no)) {
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);	
		}else {

			entity = new ResponseEntity<String>("Fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/ajax/deleteThis/{checkList_no}", method = RequestMethod.GET)
	public ResponseEntity<String> deleteCheckList(@PathVariable("checkList_no") int checkList_no) throws Exception{
		logger.info("종진 / 체크리스트 체크여부 수정하기");
		ResponseEntity<String> entity = null;
		
		if(ckservice.deleteThis(checkList_no)) {
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);	
		}else {

			entity = new ResponseEntity<String>("Fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/ajax/deleteAll/{member_id}", method = RequestMethod.POST)
	public ResponseEntity<String> deleteCheckListAll(@PathVariable("member_id") String member_id) throws Exception{
		logger.info("종진 / 체크리스트 체크된거 모두 삭제하기");
		ResponseEntity<String> entity = null;
		
		if(ckservice.deleteThisAll(member_id)) {
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);	
		}else {

			entity = new ResponseEntity<String>("Fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/ajax/saveList", method = RequestMethod.POST)
	public ResponseEntity<String> saveList(@RequestBody CheckListVO vo) throws Exception{
		logger.info("종진 / 체크리스트 체크여부 수정하기");
		ResponseEntity<String> entity = null;
		
		if(ckservice.saveList(vo)) {
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);	
		}else {

			entity = new ResponseEntity<String>("Fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
		
	

	
}
