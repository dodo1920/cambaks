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
import com.cambak21.domain.ProductsVO;
import com.cambak21.service.cambakMall.prodOrderService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;

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
	
	// **************************************** 장원영 컨트롤러 **********************************************
	
	// **************************************** 김정민 컨트롤러 **********************************************
	
	// **************************************** 이영광 컨트롤러 **********************************************
	
	// **************************************** 서효원 컨트롤러 **********************************************
	
	// **************************************** 백승권 컨트롤러 ********************************************** 
	
	// **************************************** 김태훈 컨트롤러 ********************************************** 
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String BoardResellList(PagingCriteria cri,Model model) throws Exception {
		System.out.println("boardResellList 테스트");
		cri.setPage(1);
		model.addAttribute("board",service.prodBoardReadAll(cri));
		PagingParam pp = new PagingParam();
		pp.setDisplayPageNum(9);
		pp.setCri(cri);
		
		pp.setTotalCount(service.prodBoardReadAllCnt()); // 게시물 갯수
		System.out.println(pp.toString());
		model.addAttribute("pagingParam", pp);
		
		return "cambakMall/prodList";
	}
	@RequestMapping(value = "/list/{page}",method = RequestMethod.POST)
	public ResponseEntity<List<ProductsVO>> BoardResellListPOST(@PathVariable("page")  int page,PagingCriteria cri,Model model) throws Exception {
		System.out.println("boardResellList 테스트");
		System.out.println("page : "+page);
		ResponseEntity<List<ProductsVO>> entity = null;
		List<ProductsVO> listResell = service.prodBoardReadAll(cri);
		if(listResell != null) {
			entity = new ResponseEntity<List<ProductsVO>>(listResell,HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String seach(SearchCriteria scri, PagingCriteria cri, Model model) throws Exception {
		System.out.println("검색을 시작합니다....");
		System.out.println(scri.toString());
		model.addAttribute("board", service.prodBoardRead(cri,scri));
		System.out.println(cri.toString());
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.prodBoardReadCnt(scri));
		System.out.println(pp.toString());
		model.addAttribute("pagingParam", pp);  // 페이징 처리를 위한 파라메터 객체
		
		return "cambakMall/prodList";
		}
}
