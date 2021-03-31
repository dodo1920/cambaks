package com.cambak21.controller.cambakMain;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MyLikeBoardListVO;
import com.cambak21.domain.MyPageAllCountVO;
import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.domain.ProdReviewVO;
import com.cambak21.service.myPost.CheckListService;
import com.cambak21.service.myPost.MyPostingService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/myPage/*")
public class myPostController {

	// 서비스 주입
	@Inject
	private MyPostingService service;

	// 디버깅용 Logger
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
	@RequestMapping(value = "checkList.mp", method = RequestMethod.GET)
	public void callCheckList() throws Exception {

	}

	@RequestMapping(value = "myPost", method = RequestMethod.GET)
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
	   public @ResponseBody Map<String, Object> myPostList(@RequestParam("member_id") String member_id, @RequestParam(value = "page", defaultValue = "1", required = false) int page, @RequestParam("board_category")String board_category){
	      System.out.println(member_id);
	      System.out.println(page);
	      System.out.println(board_category);
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
	         boardList = service.getMyPosting(member_id, cri, board_category);
	         System.out.println(boardList.toString());
	          pp.setTotalCount(service.getMyPostingCnt(member_id, board_category));
	          System.out.println("pp2 : " + pp);
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	       result.put("boardList", boardList);
	       result.put("pagingParam", pp);
	       
	      return result;
	   }

	//--------------------------------------------------------------- 서효원 controller ---------------------------------------------------------------
	
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
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 서효원
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="myReplyList.mp", method=RequestMethod.POST)
	public Map<String, Object> myPageReplyList(@RequestParam("member_id") String member_id, @RequestParam("board_category")  String board_category, PagingCriteria cri)
			throws Exception {
		// 마이페이지 내 댓글 페이지 로딩 시 전체 내용 가져오기
		Map<String, Object> param = new HashMap<String, Object>();
		
		cri.setPerPageNum(6); // 5개 씩 게시글, 댓글 가져오기
		List<MyPageReplyVO> lst = service.myWriteReply(member_id, board_category, cri);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setDisplayPageNum(5);
		pp.setTotalCount(service.myReplyTotal(member_id, board_category));
		
		param.put("myReplyList", lst);
		param.put("paging", pp);
		System.out.println(member_id + ", " + board_category + ", " + cri.toString() + ", " + pp.toString());
		return param;
	}
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 서효원
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="getMyCount.mp", method=RequestMethod.POST)
	public MyPageAllCountVO myPageAllCount(@RequestParam("member_id") String member_id) throws Exception {
		// 마이페이지 내 댓글 페이지 로딩 시 전체 게시글, 댓글, 좋아요, 문의 개수 가져오기
		return service.myPageAllCount(member_id);
	}

	//--------------------------------------------------------------- 서효원 controller ---------------------------------------------------------------
	
	/**
	  * @Method Name : myPageLikeBoards
	  * @작성일 : 2021. 3. 31.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 카테고리에서 클릭해서 들어갔을 시....
	  * @return
	  * @throws Exception
	  */
	@RequestMapping("myLike.mp")
	public String myPageLikeBoards() throws Exception {
		return "cambakMain/myPage/myLikeBoard";
	}

	/**
	  * @Method Name : getList
	  * @작성일 : 2021. 3. 31.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 페이징처리와 게시글 출력 함께
	  * @param category : view단에서 넘어온 카테고리... 해당 카테고리 글만 보여주기 위함
	  * @param page : 페이징에 필요한 변수
	  * @param cri
	  * @param request : 세션 얻어오기 위함
	  * @return
	  */
	@RequestMapping(value = "myLike/{category}/{page}", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getList(@PathVariable("category") String category,
			@PathVariable("page") int page, PagingCriteria cri, HttpServletRequest request) {
		logger.info("승권 / 마이페이지 내가 좋아요 누른글 카테고리 호출");

		// json 담을 객체
		ResponseEntity<Map<String, Object>> entity = null;

		// 세션 정보 얻어오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");

		try {
			// 페이징, 리스트 map에 담기 위한 객체 생성
			Map<String, Object> map = new HashMap<String, Object>();

			// 리스트 가져오기
			List<MyLikeBoardListVO> lst = service.getMyLikePostng(vo.getMember_id(), cri, category);

			// 페이징
			PagingParam pp = new PagingParam();
			pp.setCri(cri);
			pp.setTotalCount(service.getMyLikePostngCnt(vo.getMember_id(), category));

			// lst는 map에 넣기
			for (int i = 0; i < lst.size(); i++) {
				map.put(i + "", lst.get(i));
			}
			// pp map에 넣기
			map.put("pp", pp);

			// 해당 카테고리 좋아요 한 이력이 없다면 ...
			if (lst.size() != 0) {
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} else {
				entity = new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// *****************************  종진 체크리스트 컨트롤러  **********************************//
	
	@Inject
	private CheckListService ckservice;
	
	@RequestMapping(value="/checkList", method = RequestMethod.GET)
	   public String checkList() {
	      logger.info("JJONG ckeckList2 작업중 . . . . .");
	   
	      
	      return "cambakMain/myPage/checkList";
	   }
		   
		   
		@RequestMapping(value = "/checkList/ajax/{member_id}", method = RequestMethod.GET)
		public  ResponseEntity<List<CheckListVO>> ajaxcheckList(Model model, @PathVariable("member_id") String member_id) throws Exception{
			logger.info("종진 / ajax/checkList 전체 목록 ckeckList로 전달, 멤버아디는 :" + member_id);
		
			ResponseEntity<List<CheckListVO>> entity = null;
			entity = new ResponseEntity<List<CheckListVO>>(ckservice.getCheckListAll(member_id), HttpStatus.OK);
		
			return entity;
		}

		@RequestMapping(value = "/checkList/ajax/change/{checkList_checked}/{checkList_no}", method = RequestMethod.GET)
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
		
		@RequestMapping(value = "/checkList/ajax/deleteThis/{checkList_no}", method = RequestMethod.GET)
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
		
		@RequestMapping(value = "/checkList/ajax/deleteAll/{member_id}", method = RequestMethod.POST)
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
		
		
		@RequestMapping(value = "/checkList/ajax/saveList", method = RequestMethod.POST)
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
