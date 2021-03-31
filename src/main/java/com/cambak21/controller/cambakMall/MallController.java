package com.cambak21.controller.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public ResponseEntity<DestinationVO> destinationsListAjax(@PathVariable("destination_no") int destination_no) throws Exception {
		
		ResponseEntity<DestinationVO> entity = null;
	
		try {
			entity = new ResponseEntity<DestinationVO>(service.selectDestOne(destination_no), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<DestinationVO>(HttpStatus.BAD_REQUEST);
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
