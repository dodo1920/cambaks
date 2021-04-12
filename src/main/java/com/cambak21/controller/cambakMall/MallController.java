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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
	
import com.cambak21.domain.BoardVO;
import com.cambak21.domain.BuyProductVO;
import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MyBucketListVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.service.cambakMall.MyBucketListService;
import com.cambak21.service.cambakMall.prodOrderService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;

@Controller
@RequestMapping(value = "/mall/*")
public class MallController {
	@Inject
	private prodOrderService service;
	private static final Logger logger = LoggerFactory.getLogger(MallController.class);

	@Inject
	private MyBucketListService bucketService;
	// **************************************** 김도연 컨트롤러
	// **********************************************

	// **************************************** 김대기 컨트롤러
	// **********************************************
	@RequestMapping(value = "/prodOrder", method = RequestMethod.GET)
	public String order() throws Exception {
		return "cambakMall/prodOrder";
	}

	@RequestMapping(value = "/prodOrder/{member_id}", method = RequestMethod.GET)
	public ResponseEntity<List<DestinationVO>> destList(@PathVariable("member_id") String member_id) {

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
	@RequestMapping(value = "/prodOrder/select/{destination_no}", method = RequestMethod.GET)
	public ResponseEntity<DestinationVO> selectDestOne(@PathVariable("destination_no") int destination_no)
			throws Exception {
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

	@ResponseBody
	@RequestMapping(value = "/prodOrder/default/", method = RequestMethod.GET)
	public ResponseEntity<DestinationVO> defaultDest(@RequestParam("member_id") String member_id) throws Exception {
		System.out.println(member_id);
		ResponseEntity<DestinationVO> entity = null;

		entity = new ResponseEntity<DestinationVO>(service.defaultDest(member_id), HttpStatus.OK);

		return entity;
	}

	// **************************************** 박종진 컨트롤러
	// **********************************************
	@RequestMapping(value = "/destinationsList", method = RequestMethod.GET)
	public String destinationsList() throws Exception {
		return "/cambakMall/destinationsList";
	}

	@RequestMapping(value = "/destinationsList/ajax/{member_id}", method = RequestMethod.GET)
	public ResponseEntity<List<DestinationVO>> destinationsListAjax(@PathVariable("member_id") String member_id)
			throws Exception {

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
	public ResponseEntity<String> defaultModyAjax(@PathVariable("member_id") String member_id,
			@PathVariable("dstno") int dstno, HttpServletResponse response) throws Exception {

		ResponseEntity<String> entity = null;
		if (service.defaultModyAjax(member_id, dstno)) {
			System.out.println("업데이트 성공");
			entity = new ResponseEntity<String>("result", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("result", HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	@RequestMapping(value = "/destinationsList/deleteDestiny/{member_id}/{dstno}", method = RequestMethod.GET)
	public ResponseEntity<String> deleteDestiny(@PathVariable("member_id") String member_id,
			@PathVariable("dstno") int dstno, HttpServletResponse response) throws Exception {

		System.out.println("삭제 컨트롤러 입장");
		ResponseEntity<String> entity = null;
		if (service.deleteDestiny(member_id, dstno)) {
			System.out.println("삭제 성공");
			entity = new ResponseEntity<String>("result", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("result", HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	@RequestMapping(value = "/destinationsList/modiajax", method = RequestMethod.POST)
	public ResponseEntity<String> destiModyAjax(@RequestBody DestinationVO vo) throws Exception {

		ResponseEntity<String> entity = null;
		System.out.println(vo.toString());
		if (service.destiModyAjax(vo)) {
			System.out.println("업데이트 성공");
			entity = new ResponseEntity<String>("result", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("result", HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	@RequestMapping(value = "/destinationsList/insertDestiny", method = RequestMethod.POST)
	public ResponseEntity<String> insertDestiny(@RequestBody DestinationVO vo) throws Exception {

		ResponseEntity<String> entity = null;
		System.out.println(vo.toString());
		if (service.insertDestiny(vo)) {
			System.out.println("배송지 추가 성공");
			entity = new ResponseEntity<String>("result", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("result", HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// **************************************** 장원영 컨트롤러
	// **********************************************

	// **************************************** 김정민 컨트롤러
	// **********************************************

	// **************************************** 이영광 컨트롤러
	// **********************************************

	// **************************************** 서효원 컨트롤러
	// **********************************************

	// **************************************** 백승권 컨트롤러
	// **********************************************
	@RequestMapping("cart")
	public String cart() throws Exception {
		return "cambakMall/mallCart";
	}

	// 장바구니 목록
	@RequestMapping("/cart/{member_id}")
	public @ResponseBody ResponseEntity<List<MyBucketListVO>> cartList(@PathVariable("member_id") String member_id) {
		ResponseEntity<List<MyBucketListVO>> entity = null;
		try {
			entity = new ResponseEntity<List<MyBucketListVO>>(bucketService.getBucketList(member_id), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 장바구니 수량 변경
	@RequestMapping("/cart/{member_id}/{product_id}/{qty}")
	public @ResponseBody ResponseEntity<Integer> changeQty(@PathVariable("member_id") String member_id,
			@PathVariable("product_id") int product_id, @PathVariable("qty") int qty) {
		ResponseEntity<Integer> entity = null;

		try {
			entity = new ResponseEntity<Integer>(bucketService.changeQty(member_id, product_id, qty), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping("/cart/delete/{member_id}/{product_id}")
	public @ResponseBody ResponseEntity<Integer> deleteItem(@PathVariable("member_id") String member_id, @PathVariable("product_id") int product_id) {
		// 장바구니 개별아이템 삭제
		ResponseEntity<Integer> entity = null;

		try {
			bucketService.deleteItem(member_id, product_id);
			entity = new ResponseEntity<Integer>(1, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping("/cart/delete/all/{member_id}")
	public @ResponseBody ResponseEntity<Integer> deleteItemAll(@PathVariable("member_id") String member_id) {
		// 장바구니 전체 삭제
		ResponseEntity<Integer> entity = null;
		
		try {
			bucketService.deleteItemAll(member_id);
			entity = new ResponseEntity<Integer>(1, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping("/cart/order/{member_id}")
	public @ResponseBody ResponseEntity<Integer> goOrder(@PathVariable("member_id") String member_id) {
		// 장바구니에서 체크 Y인것만 주문하기
		ResponseEntity<Integer> entity = null;
		
		try {
			bucketService.goOrder(member_id);
			entity = new ResponseEntity<Integer>(1, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	// 장바구니에서 체크 OnOff
	@RequestMapping("/cart/check/{member_id}/{product_id}")
	public @ResponseBody ResponseEntity<Integer> checkOnOff(@PathVariable("member_id") String member_id, @PathVariable("product_id") int product_id) {
		ResponseEntity<Integer> entity = null;
		
		try {
			entity = new ResponseEntity<Integer>(bucketService.checkOnOff(member_id, product_id), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	// **************************************** 김태훈 컨트롤러
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String BoardResellList(PagingCriteria cri, Model model) throws Exception {
		System.out.println("boardResellList 테스트");
		cri.setPage(1);
		model.addAttribute("board", service.prodBoardReadAll(cri));
		PagingParam pp = new PagingParam();
		pp.setDisplayPageNum(9);
		pp.setCri(cri);

		pp.setTotalCount(service.prodBoardReadAllCnt()); // 게시물 갯수
		System.out.println(pp.toString());
		model.addAttribute("pagingParam", pp);

		return "cambakMall/prodList";
	}

	@RequestMapping(value = "/list/{page}", method = RequestMethod.POST)
	public ResponseEntity<List<ProductsVO>> BoardResellListPOST(@PathVariable("page") int page, PagingCriteria cri,
			Model model) throws Exception {
		System.out.println("boardResellList 테스트");
		System.out.println("page : " + page);
		ResponseEntity<List<ProductsVO>> entity = null;
		List<ProductsVO> listResell = service.prodBoardReadAll(cri);
		if (listResell != null) {
			entity = new ResponseEntity<List<ProductsVO>>(listResell, HttpStatus.OK);
		}

		return entity;
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String seach(PagingCriteria cri,@RequestParam("searchType") String searchType,@RequestParam("optionType") String optionType,@RequestParam("searchWord") String searchWord,Model model) throws Exception {
		System.out.println("search 테스트");
		SearchCriteria sri = new SearchCriteria();
		System.out.println("optionType : "+optionType+"\n searchType : "+searchType+"\n searchWord : "+searchWord+"\n page : "+cri.getPage()+"\n pageStart"+cri.getPageStart());
		sri.setOptionType(optionType);
		sri.setSearchType(searchType);
		sri.setSearchWord(searchWord);
		List<ProductsVO> searchProd = service.prodBoardSearch(cri,sri);
		System.out.println(searchProd);
		model.addAttribute("board",searchProd);
		
		return "cambakMall/prodList";
		}

	// **********************************************
}
