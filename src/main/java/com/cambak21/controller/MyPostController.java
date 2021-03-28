package com.cambak21.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cambak21.service.mypost.MyPostingService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/myPage")
public class MyPostController {

	// 서비스 주입
	@Inject
	private MyPostingService service;
	
	//디버깅용 Logger
	private static final Logger logger = LoggerFactory.getLogger(MyPostController.class);
	
	/**
	 * @Method Name : showMyPostList
	 * @작성일 : 2021. 3. 27.
	 * @작성자 : Kim Jeong Min
	 * @변경이력 : 
	 * @Method 설명 : 페이징 처리를 한 나의 게시글 목록
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/myPost", method=RequestMethod.GET)
	public String showMyPostList(PagingCriteria cri, Model model, @RequestParam("member_id") String member_id) throws Exception {
		logger.info("페이징 처리를 한 내가 작성한 게시글 목록...");
		// 게시물 데이터 바인딩
		model.addAttribute("myPostList", service.getMyPosting(member_id, cri));
		System.out.println(service.getMyPosting(member_id, cri));
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		// 내가 작성한 총 게시물 수를 가져와서 세팅
		pp.setTotalCount(service.getMyPostingCnt(member_id));
		System.out.println(pp.toString());
		
		model.addAttribute("pagingParam", pp);
		
		return "cambakMain/myPage/myPost";
	}
	
}
