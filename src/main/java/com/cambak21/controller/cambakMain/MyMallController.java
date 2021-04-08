package com.cambak21.controller.cambakMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.PointVO;
import com.cambak21.domain.ProdQAVO;
import com.cambak21.service.cambakMain.MyMallService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/myMall/*")
public class MyMallController {
	
	@Inject
	private MyMallService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MyMallController.class);

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 대기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/myRefund")
	public String myRefund(Model model, @SessionAttribute("loginMember") MemberVO member, PagingCriteria cri) throws Exception {
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.getTotalRefund(member.getMember_id()));
		
		model.addAttribute("pp", pp);
		model.addAttribute("refundList", service.getRefundList(member.getMember_id()));
		
		return "cambakMain/myPage/myRefund";
	}
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 정민 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value="myPoint", method=RequestMethod.GET)
	public String showMyPointListMain(){
		
		return "cambakMain/myPage/myPoint";
	}
		
	@RequestMapping(value="myPoint/{member_id}", method=RequestMethod.POST)
	   public @ResponseBody List<PointVO> myPointList(@PathVariable("member_id") String member_id){
	       logger.info("/myPointList의 ajax-POST방식 호출");
	       List<PointVO> vo = null;
	       try {
			vo = service.getPointList(member_id);
			System.out.println(vo.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       
	      return vo;
	   }
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("myQnA")
	public String myPageLikeBoards(Model model, @SessionAttribute("loginMember") MemberVO loginMember, PagingCriteria cri) throws Exception {
		logger.info("승권 / 상품문의 게시글 get 호출");
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.getQaCnt(loginMember.getMember_id()));
		
		model.addAttribute("pp", pp);
		model.addAttribute("QaList", service.getMyQAList(loginMember.getMember_id()));
		
		return "cambakMain/myPage/myQnA";
	}
	
	@RequestMapping("answer/{no}")
	@ResponseBody
	public ResponseEntity<ProdQAVO> answer(@PathVariable("no") int prodQA_no, @SessionAttribute("loginMember") MemberVO loginMember) {
		ResponseEntity<ProdQAVO> entity = null;
		
		System.out.println("prodQA_no : " + prodQA_no);
		System.out.println("로그인한 아이디 : " + loginMember.getMember_id());
		
		try {
			entity = new ResponseEntity<ProdQAVO>(service.getProdQAVO(loginMember.getMember_id(), prodQA_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<ProdQAVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 태훈 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
