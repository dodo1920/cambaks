package com.cambak21.controller.cambakMall;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.service.cambakMall.prodOrderService;

@Controller
@RequestMapping(value = "/cambakMall/*")
public class MallController {
	@Inject
	private prodOrderService service;
	private static final Logger logger = LoggerFactory.getLogger(MallController.class);
	
	// **************************************** 김도연 컨트롤러 ********************************************** 
	
	// **************************************** 김대기 컨트롤러 ********************************************** 
	@RequestMapping(value = "/prodOrder", method = RequestMethod.GET)
	public void order() throws Exception {
		
	}
	
	@RequestMapping(value = "/prodOrder/{member_id}", method= RequestMethod.GET)
	public ResponseEntity<List<DestinationVO>> destList(@PathVariable("member_id") String member_id){
		
		ResponseEntity<List<DestinationVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<DestinationVO>>(service.selectDestNickName(member_id), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<DestinationVO>>(HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/prodOrder/select/{destination_no}", method= RequestMethod.GET)
	public ResponseEntity<DestinationVO> selectDestOne(@PathVariable("destination_no") int destination_no) throws Exception {
		ResponseEntity<DestinationVO> entity = null;
		System.out.println(destination_no);
		try {
			entity = new ResponseEntity<DestinationVO>(service.selectDestOne(destination_no), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<DestinationVO>(HttpStatus.BAD_REQUEST);
		}
		
//		DestinationVO vo = service.selectDestOne(destination_no);
//		System.out.println(vo.toString());
		
		return entity;
	}
	
	
	// **************************************** 박종진 컨트롤러 **********************************************
	@RequestMapping(value = "/destinationsList", method = RequestMethod.GET)
	public void destinationsList() throws Exception {
		
	}
	
	@RequestMapping(value = "/destinationsList/ajax/{member_id}", method = RequestMethod.GET)
	public ResponseEntity<List<DestinationVO>> destinationsListAjax(@PathVariable("member_id") String member_id) throws Exception {
		
		ResponseEntity<List<DestinationVO>> entity = null;
	
		try {
			entity = new ResponseEntity<List<DestinationVO>>(service.destinationsListAjax(member_id), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<DestinationVO>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
		
	}
	
	@RequestMapping(value = "/destinationsList/ajax/{member_id}/{dstno}", method = RequestMethod.POST)
	public ResponseEntity<String> defaultModyAjax(@PathVariable("member_id") String member_id, @PathVariable("dstno") int dstno, HttpServletResponse response) throws Exception {
		
		ResponseEntity<String> entity = null;
		if(service.defaultModyAjax(member_id, dstno)) {
			System.out.println("업데이트 성공");
			entity = new ResponseEntity<String>("result", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("result", HttpStatus.BAD_REQUEST);
		}
	
		return entity;
		
	}
	
	
	@RequestMapping(value = "/destinationsList/deleteDestiny/{member_id}/{dstno}", method = RequestMethod.GET)
	public ResponseEntity<String> deleteDestiny(@PathVariable("member_id") String member_id, @PathVariable("dstno") int dstno, HttpServletResponse response) throws Exception {
		
		ResponseEntity<String> entity = null;
		if(service.deleteDestiny(member_id, dstno)) {
			System.out.println("삭제 성공");
			entity = new ResponseEntity<String>("result", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("result", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value = "/destinationsList/modiajax", method = RequestMethod.POST)
	public ResponseEntity<String> destiModyAjax(@RequestBody DestinationVO vo) throws Exception {
		
		ResponseEntity<String> entity = null;
		System.out.println(vo.toString());
		if(service.destiModyAjax(vo)) {
			System.out.println("업데이트 성공");
			entity = new ResponseEntity<String>("result", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("result", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value = "/destinationsList/insertDestiny", method = RequestMethod.POST)
	public ResponseEntity<String> insertDestiny(@RequestBody DestinationVO vo) throws Exception {
		
		ResponseEntity<String> entity = null;
		System.out.println(vo.toString());
		if(service.insertDestiny(vo)) {
			System.out.println("배송지 추가 성공");
			entity = new ResponseEntity<String>("result", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("result", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}

	
	// **************************************** 장원영 컨트롤러 **********************************************
	
	// **************************************** 김정민 컨트롤러 **********************************************
	
	// **************************************** 이영광 컨트롤러 **********************************************
	
	// **************************************** 서효원 컨트롤러 **********************************************
	
	// **************************************** 백승권 컨트롤러 ********************************************** 
	
	// **************************************** 김태훈 컨트롤러 ********************************************** 

	
}
