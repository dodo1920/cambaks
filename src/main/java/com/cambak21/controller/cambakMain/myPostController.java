package com.cambak21.controller.cambakMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.domain.ProdReviewVO;
import com.cambak21.service.myPost.MyPostingService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/myPage/*")
public class myPostController {

	// 서비스 주입
	@Inject
	private MyPostingService service;
	
	//디버깅용 Logger
	private static final Logger logger = LoggerFactory.getLogger(myPostController.class);
	
	/**
	 * @Method Name : showMyPostList
	 * @작성일 : 2021. 3. 27.
	 * @작성자 : Kim Jeong Min
	 * @변경이력 : 
	 * @Method 설명 : 페이징 처리를 한 나의 게시글 목록
	 * @return
	 * @throws Exception
	 */
//	@RequestMapping(value="/myPost", method=RequestMethod.GET)
//	public String showMyPostList(PagingCriteria cri, Model model, @RequestParam("member_id") String member_id) throws Exception {
//		logger.info("페이징 처리를 한 내가 작성한 게시글 목록...");
//		// 게시물 데이터 바인딩
//		model.addAttribute("myPostList", service.getMyPosting(member_id, cri));
//		System.out.println(service.getMyPosting(member_id, cri));
//		PagingParam pp = new PagingParam();
//		pp.setCri(cri);
//		// 내가 작성한 총 게시물 수를 가져와서 세팅
//		pp.setTotalCount(service.getMyPostingCnt(member_id));
//		System.out.println(pp.toString());
//		
//		model.addAttribute("pagingParam", pp);
//		
//		return "cambakMain/myPage/myPost";
//	}
	
	
	
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 박종진
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@RequestMapping(value="checkList.mp", method=RequestMethod.GET)
	public void callCheckList() throws Exception {
		
	}
	
	
	
	@RequestMapping(value="myPost", method=RequestMethod.GET)
	public String showMain() throws Exception {
		return "cambakMain/myPage/myWriting";
	}
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 김정민
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@RequestMapping(value="myPost.mp", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> myPostList(@RequestParam("member_id") String member_id, @RequestParam(value = "page", defaultValue = "1", required = false) int page){
		System.out.println(member_id);
		System.out.println(page);
	    logger.info("/myPost의 ajax-GET방식 호출");
	    Map<String, Object> result = new HashMap<String, Object>();
	    
	    List<BoardVO> boardList = null;
    
	    PagingCriteria cri = new PagingCriteria();
	    PagingParam pp = new PagingParam();
	    pp.setCri(cri);
	    cri.setPage(page);
	    System.out.println("pp1 : " + pp);
	    //System.out.println("cri : " + cri);
	    
	    try {
			boardList = service.getMyPosting(member_id, cri);
			System.out.println("boardList : " + boardList);
		    pp.setTotalCount(service.getMyPostingCnt(member_id));
		    System.out.println("pp2 : " + pp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    result.put("boardList", boardList);
	    result.put("pagingParam", pp);
	    
		return result;
	}
	
	
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 서효원
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@RequestMapping(value="myReply.mp", method=RequestMethod.GET)
	public String myPageReplyInfo() throws Exception {
		// 마이페이지 내 댓글 페이지로 이동
		return "cambakMain/myPage/myPageReply";
	}
	
	@ResponseBody
	@RequestMapping(value="myReplyList.mp", method=RequestMethod.POST)
	public Map<String, Object> myPageReplyList(@RequestParam("member_id") String member_id, @RequestParam("board_category")  String board_category, PagingCriteria cri)
			throws Exception {
		// 마이페이지 내 댓글 페이지 로딩 시 전체 내용 가져오기
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<MyPageReplyVO> lst = service.myWriteReply(member_id, board_category, cri);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setDisplayPageNum(5);
		pp.setTotalCount(service.myReplyTotal());
		
		param.put("myReplyList", lst);
		param.put("paging", pp);
		
		return param;
	}
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 백승권
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@RequestMapping(value="myLike.mp", method=RequestMethod.GET)
	public void myLikeList() throws Exception {

	}
	
}
