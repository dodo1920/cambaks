package com.cambak21.controller.boards;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.UpdateCSBoardDTO;
import com.cambak21.service.boardCS.BoardCsService;
import com.cambak21.util.BoardCsFileUpload;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;

@Controller
@RequestMapping("/board")
public class BoardCsController {

	@Inject
	private BoardCsService service;

	private static Logger logger = LoggerFactory.getLogger(BoardCsController.class);

	@RequestMapping("/cs")
	public String BoardCsList(Model model, PagingCriteria cri) throws Exception {
		logger.info("승권 / 게시글 리스트 get방식 호출");

		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.boardCStotalCnt());

		// 게시물 데이터
		model.addAttribute("boardList", service.listBoardCS(cri));
		model.addAttribute("pp", pp);

		return "cambakMain/board/cs/boardCsList";
	}

	@RequestMapping("/cs/write")
	public String BoardCsWrite() {
		logger.info("승권 / 글 쓰기 폼 get 방식 호출");

		return "cambakMain/board/cs/boardCsWrite";
	}

	@RequestMapping(value = "/cs/write", method = RequestMethod.POST)
	public String BoardCsWrite(InsertCSBoardDTO dto, RedirectAttributes ra) throws Exception {
		logger.info("승권 / 글 작성 POST 방식 호출");

		ra.addFlashAttribute("status", "writeOk");

		return "redirect:/board/cs/detail?no=" + service.writeBoardCS(dto); // 해당 메서드 실행하면 max(board_no)값 반환해줌
	}

	@RequestMapping(value = "/cs/detail", method = RequestMethod.GET)
	public String BoardCsDetail(@RequestParam("no") int no, Model model) throws Exception {
		logger.info("승권 / 게시글 detail GET 호출");

		model.addAttribute("board", service.readBoardCS(no));
		model.addAttribute("prev", service.prevNo(no));
		model.addAttribute("next", service.nextNo(no));

		return "cambakMain/board/cs/boardCsDetail";
	}

	@RequestMapping(value = "/cs/delete", method = RequestMethod.GET)
	public String BoardCsDelete(@RequestParam("no") int board_no, RedirectAttributes ra) throws Exception {
		logger.info("승권 / 글 삭제 get방식 호출");

		service.deleteBoardCS(board_no);

		ra.addFlashAttribute("status", "deleteOk");

		return "redirect:/board/cs/";
	}

	@RequestMapping("/cs/modi")
	public String BoardModi(@RequestParam("no") int no, Model model) throws Exception {
		logger.info("승권 / 글 수정 get 방식 호출");

		model.addAttribute("board", service.readBoardCS(no));

		return "cambakMain/board/cs/boardCsModi";
	}

	@RequestMapping(value = "/cs/modi", method = RequestMethod.POST)
	public String BoardModi(UpdateCSBoardDTO dto, RedirectAttributes ra) throws Exception {
		logger.info("승권 / 글 수정 post 방식 호출");

		service.modiBoardCS(dto);

		ra.addFlashAttribute("status", "modiOk");

		return "redirect:/board/cs/detail?no=" + dto.getBoard_no();
	}

	@RequestMapping("/cs/search")
	public String BoardSearch(SearchCriteria scri, PagingCriteria cri, Model model) throws Exception {
		logger.info("승권 / 검색 결과 페이지 호출");

		PagingParam searchPP = new PagingParam();
		searchPP.setCri(cri);
		searchPP.setTotalCount(service.searchBoardCStotalCnt(scri));

		model.addAttribute("boardList", service.searchListBoardCS(scri, cri));
		model.addAttribute("searchPP", searchPP);

		return "cambakMain/board/cs/boardCsList";
	}

	/**
	  * @Method Name : handleFileUpload
	  * @작성일 : 2021. 3. 25.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 서버에 이미지 업로드
	  * @param file : view단에서 ajax로 넘어온 파일
	  * @param request
	  * @return
	  */
	@RequestMapping(value = "/cs/image", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		
		try {
			// 파일 업로드 될 서버 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploads/boardCs");
			// 파일 저장하기 위해 메서드 호출 후 경로 반환 받기
			String uploadFile = BoardCsFileUpload.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			if(!uploadFile.equals("-1")) {
				return new ResponseEntity<String>(uploadFile, HttpStatus.OK);
			} else {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}

}
