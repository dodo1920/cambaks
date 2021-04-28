package com.cambak21.controller.cambakMall;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MyBucketListVO;
import com.cambak21.domain.MyNonUserBucketVO;
import com.cambak21.domain.OrderCompleteInfoSessionVO;
import com.cambak21.domain.PayInfoVO;
import com.cambak21.domain.PaymentsInfoVO;
import com.cambak21.domain.ProdInfoVO;
import com.cambak21.domain.ProductDetailListVO;
import com.cambak21.domain.ProductDetailOrderVO;
import com.cambak21.domain.ProductDetailParamVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.service.cambakMall.MyBucketListService;
import com.cambak21.service.cambakMall.ProdListService;
import com.cambak21.service.cambakMall.prodDetailService;
import com.cambak21.service.cambakMall.prodOrderService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.PagingStringCriteria;
import com.cambak21.util.ProdListPagingCriteria;
import com.cambak21.util.SearchCriteria;

@Controller
@RequestMapping(value = "/mall/*")
public class MallController {
	@Inject
	private prodOrderService service;
	private static final Logger logger = LoggerFactory.getLogger(MallController.class);

	@Inject
	private MyBucketListService bucketService;
	
	@Inject
	private ProdListService pListService;
	
	@Inject
	private prodDetailService prodDetailService;
	
	// **************************************** 김도연 컨트롤러
	// **********************************************

	// **************************************** 장원영 컨트롤러
	// **********************************************

	@RequestMapping(value = "/prodOrder", method = RequestMethod.GET)
	public String order(@SessionAttribute("loginMember") MemberVO vo, Model model) throws Exception {
//	      System.out.println(vo.toString());
		 List<ProdInfoVO> prodOrderInfo = service.prodOrderInfo(vo.getMember_id());
		// 장바구니에서 주문하기 눌렀을 때 상품정보 가져오기
		
		// 토탈Price 합치기
		int totPrice = 0;
		for (int i = 0; i < prodOrderInfo.size(); i++) {
			totPrice += prodOrderInfo.get(i).getBuyProduct_totPrice();
		}
		
		model.addAttribute("prodInfo", prodOrderInfo);
		model.addAttribute("totPrice", totPrice);
		
	    return "cambakMall/prodOrder";
	}
	
	@RequestMapping(value = "/prodOrder/payInfo", method = RequestMethod.POST)
	public ResponseEntity<Integer> pcheckForm(PayInfoVO vo) throws Exception {
		System.out.println(vo.toString());
		ResponseEntity<Integer> entity = null;
		if (service.payInfo(vo) == 1) {
			entity = new ResponseEntity<Integer>(service.payInfoNo(), HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/orderFin", method = RequestMethod.POST)
	public String orderFin(@SessionAttribute("loginMember") MemberVO memberVo, PaymentsInfoVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(cal.YEAR);
		int tmpMonth = cal.get(cal.MONTH) + 1;
		int date = cal.get(cal.DATE);
		
		int serialNo = service.readSerialNo() + 1;
		String month;
		
		if (tmpMonth < 10) month = "0" + String.valueOf(tmpMonth);
		else month = String.valueOf(tmpMonth);
		
		String tmpPaymentNo = String.valueOf(year) + month + String.valueOf(date) + String.valueOf(serialNo);
		int payment_no = Integer.parseInt(tmpPaymentNo);
		
		OrderCompleteInfoSessionVO successVO = new OrderCompleteInfoSessionVO();
		successVO.setPayment_no(payment_no);
		successVO.setTotPrice(vo.getTotPriceNum());
		
		session.removeAttribute("orderInfo");
		session.setAttribute("orderInfo", successVO);
		
		vo.setGrade_name(memberVo.getGrade_name());
		if (service.payInfoSave(vo, payment_no, serialNo)) {
			return "redirect: /mall/orderFinally";
		} else {
			return "redirect: /mall/main/";
		}
		
	}
	
	@RequestMapping(value = "/orderFinally", method = RequestMethod.GET)
	public String orderFinally(HttpSession session, Model model) throws Exception {
		OrderCompleteInfoSessionVO vo = (OrderCompleteInfoSessionVO)session.getAttribute("orderInfo");
		model.addAttribute("orderInfo", service.orderCompleteInfo(vo));
		
		return "cambakMall/orderFin";
	}

	// **************************************** 김대기 컨트롤러
	// **********************************************
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
	
	@RequestMapping(value = "/destinationsList/register", method = RequestMethod.GET)
	public String destinationsresister() throws Exception {
		

		return "/cambakMall/RegisterDestination";
	}
	
	@RequestMapping(value = "/destinationsList/modify", method = RequestMethod.GET)
	public String destinationsmodify(Model model, HttpServletRequest request) throws Exception {
//		model.addAttribute("mody", "mody");
		return "/cambakMall/RegisterDestination";
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

	@RequestMapping(value = "/destinationsList/GetModifydst/{member_id}/{dstno}", method = RequestMethod.GET)
	public ResponseEntity<DestinationVO> GetModifydst(@PathVariable("member_id") String member_id,
			@PathVariable("dstno") int dstno, HttpServletResponse response, HttpServletRequest request) throws Exception {
	
		ResponseEntity<DestinationVO> entity = null;
		HttpSession ses = request.getSession();
		MemberVO vo = (MemberVO) ses.getAttribute("loginMember");
		System.out.println(vo.toString());
	
			try {
				System.out.println("정상 경로로 접근");
				entity = new ResponseEntity<DestinationVO>(service.GetModifydst(dstno), HttpStatus.OK);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				entity = new ResponseEntity<DestinationVO>(HttpStatus.BAD_REQUEST);
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
	public String insertDestiny(DestinationVO vo, RedirectAttributes rttr) throws Exception {
		
		if(vo.getDestination_no() == 0){
			
			if (service.insertDestiny(vo)) {
				
				return "redirect:/mall/destinationsList/register?result=success";
			}else {
				
				return "redirect:/mall/destinationsList/register?result=fail";
			}

			
			
		}else {
			if (service.destiModyAjax(vo)) {
				
				return "redirect:/mall/destinationsList/register?result=modisuccess";
			}else {
				return "redirect:/mall/destinationsList/register?result=fail";
			}
			
			
		}
		

	}
//
//	@RequestMapping(value = "user/register", method = RequestMethod.POST)
//	public String resisterNotice(BoardVO vo, RedirectAttributes rttr) throws Exception{
//		logger.info("종진 / 공지사항 작성 하고 결과 알려주기");
//	
//			if(service.insertNotice(vo)) {
//				rttr.addFlashAttribute("writeresult", "success");
//			}
//			
//		return "redirect:/board/notice/listCri";
//	}
//	

	// **************************************** 김정민 컨트롤러
	// **********************************************

	// **************************************** 이영광 컨트롤러
	// **********************************************

	// **************************************** 서효원 컨트롤러
	@RequestMapping(value = "/categories", method = RequestMethod.GET)
	public String prodList(ProductDetailParamVO vo, PagingStringCriteria scri, Model model) throws Exception {
		
		ProductDetailOrderVO detail = new ProductDetailOrderVO();
		ProdListPagingCriteria cri = new ProdListPagingCriteria();
		
		// 카테고리 정보가 비어 있을 경우 0, 0 - 전체상품 페이지로 설정
		if (vo.getMainCategory_id() == "" || vo.getMiddleCategory_id() == "" || vo.getMainCategory_id() == null || vo.getMiddleCategory_id() == null) {
			detail.setMainCategory_id(0);
			detail.setMiddleCategory_id(0);
		} else {
			detail.setMainCategory_id(Integer.parseInt(vo.getMainCategory_id()));
			detail.setMiddleCategory_id(Integer.parseInt(vo.getMiddleCategory_id()));
		}
		
		// 상품 정렬 설정
		if (vo.getProdRankOrder() == "" || vo.getProdRankOrder() == null) {
			detail.setProdRankOrder("cmRank");
		} else {
			detail.setProdRankOrder(vo.getProdRankOrder());
		}
		
		// 가격별 정렬 범위 설정
		if (vo.getPriceRangeOrder() == "" || vo.getPriceRangeOrder() == null) {
			vo.setPriceRangeOrder("all");
			detail.setPriceRangeOrder("all");
		} else {
			detail.setPriceRangeOrder(vo.getPriceRangeOrder());
		}
		
		// 가격별 정렬 가격 범위 설정
		if (vo.getPriceRangeOrder().equals("avg") || vo.getPriceRangeOrder().equals("avgInput")) {
			
			if (vo.getMaxPrice() == "" || vo.getMinPrice() == "") {
				vo.setPriceRangeOrder("all");
				detail.setPriceRangeOrder("all");
			} else {
				detail.setMaxPrice(Integer.parseInt(vo.getMaxPrice()));
				detail.setMinPrice(Integer.parseInt(vo.getMinPrice()));
			}
		}
		
		// 상품평순 정렬 여부 설정
		if (vo.getRatingSorter() == "" || vo.getRatingSorter() == null) {
			vo.setRatingSorter("false");
			detail.setRatingSorter("false");
		} else {
			detail.setRatingSorter(vo.getRatingSorter());
		}
		
		// 상품평순 정렬 범위 설정
		if (vo.getRatingSorter().equals("true")) {
			detail.setProdScore(Integer.parseInt(vo.getProdScore()));
		}
		
		// 페이지 번호 설정
		if (scri.getPage() == "" || scri.getPage() == null) {
			cri.setPage(1);
		} else {
			cri.setPage(Integer.parseInt(scri.getPage()));
		}
		
		// 페이지 당 게시물 수 설정
		if (scri.getPerPageNum() == "" || scri.getPerPageNum() == null) {
			cri.setPerPageNum(12);
		} else {
			cri.setPerPageNum(Integer.parseInt(scri.getPerPageNum()));
		}
		
		model.addAllAttributes(pListService.prodCategoryList(detail, cri));
		
		return "cambakMall/prodList";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String prodSearch(ProductDetailParamVO vo, PagingStringCriteria scri, @RequestParam("keyword") String keyword, Model model) throws Exception {
		
		ProductDetailOrderVO detail = new ProductDetailOrderVO();
		ProdListPagingCriteria cri = new ProdListPagingCriteria();
		
		// 카테고리 정보가 비어 있을 경우 0, 0 - 전체상품 페이지로 설정
		if (vo.getMainCategory_id() == "" || vo.getMiddleCategory_id() == "" || vo.getMainCategory_id() == null || vo.getMiddleCategory_id() == null) {
			detail.setMainCategory_id(0);
			detail.setMiddleCategory_id(0);
		} else {
			detail.setMainCategory_id(Integer.parseInt(vo.getMainCategory_id()));
			detail.setMiddleCategory_id(Integer.parseInt(vo.getMiddleCategory_id()));
		}
		
		// 상품 정렬 설정
		if (vo.getProdRankOrder() == "" || vo.getProdRankOrder() == null) {
			detail.setProdRankOrder("datePd");
		} else {
			detail.setProdRankOrder(vo.getProdRankOrder());
		}
		
		// 가격별 정렬 범위 설정
		if (vo.getPriceRangeOrder() == "" || vo.getPriceRangeOrder() == null) {
			vo.setPriceRangeOrder("all");
			detail.setPriceRangeOrder("all");
		} else {
			detail.setPriceRangeOrder(vo.getPriceRangeOrder());
		}
		
		// 가격별 정렬 가격 범위 설정
		if (vo.getPriceRangeOrder().equals("avg") || vo.getPriceRangeOrder().equals("avgInput")) {
			
			if (vo.getMaxPrice() == "" || vo.getMinPrice() == "") {
				detail.setPriceRangeOrder("all");
			} else {
				detail.setMaxPrice(Integer.parseInt(vo.getMaxPrice()));
				detail.setMinPrice(Integer.parseInt(vo.getMinPrice()));
			}
		}
		
		// 상품평순 정렬 여부 설정
		if (vo.getRatingSorter() == "" || vo.getRatingSorter() == null) {
			vo.setRatingSorter("false");
			detail.setRatingSorter("false");
		} else {
			detail.setRatingSorter(vo.getRatingSorter());
		}
		
		// 상품평순 정렬 범위 설정
		if (vo.getRatingSorter().equals("true")) {
			detail.setProdScore(Integer.parseInt(vo.getProdScore()));
		}
		
		// 페이지 번호 설정
		if (scri.getPage() == "" || scri.getPage() == null) {
			cri.setPage(1);
		} else {
			cri.setPage(Integer.parseInt(scri.getPage()));
		}
		
		// 페이지 당 게시물 수 설정
		if (scri.getPerPageNum() == "" || scri.getPerPageNum() == null) {
			cri.setPerPageNum(12);
		} else {
			cri.setPerPageNum(Integer.parseInt(scri.getPerPageNum()));
		}
		
		model.addAllAttributes(pListService.prodSearchList(detail, keyword, cri));
		
		return "cambakMall/prodSearch";
	}
	// **********************************************

	// **************************************** 백승권 컨트롤러
	// **********************************************
	@RequestMapping("cart")
	public String cart(HttpServletRequest request, Model model) throws Exception {
		HttpSession ses = request.getSession();
		
		MemberVO vo = (MemberVO) ses.getAttribute("loginMember");
		String ssid = (String) ses.getAttribute("ssid");
		System.out.println("member_id : " + vo.getMember_id() + ", ssid : " + ssid);
		
		List<MyNonUserBucketVO> nonUserBucketLst = bucketService.getNonUserBucketList(ssid);
		
		if(nonUserBucketLst.size() != 0) {
			List<MyBucketListVO> bucketLst = bucketService.getBucketList(vo.getMember_id());
			List<MyBucketListVO> sameBucketLst = new ArrayList<MyBucketListVO>();
			boolean result = false;
			
			for(MyNonUserBucketVO nonUserBucket : nonUserBucketLst) {
				for(MyBucketListVO bucket : bucketLst) {
					if(nonUserBucket.getProduct_id() == bucket.getProduct_id()) {
						System.out.println(nonUserBucket.getProduct_id() + "가 같습니다");
						sameBucketLst.add(bucket);
						result = false;
						break;
					} else {
//						System.out.println("동일 상품 아님");
						result = true;
					}
				}
				
				if(result) {
					System.out.println("동일 상품이 없습니다.");
					
					InsertintoBucketDTO dto = new InsertintoBucketDTO();
					dto.setMember_id(vo.getMember_id());
					dto.setProduct_id(nonUserBucket.getProduct_id());
					dto.setBucket_sellPrice(nonUserBucket.getNonUserBucket_sellPrice());
					dto.setBucket_buyQty(nonUserBucket.getNonUserBucket_buyQty());
					dto.setBucket_totBuyPrice(nonUserBucket.getNonUserBucket_totBuyPrice());
					
					if(prodDetailService.insertBucket(dto)) {
						logger.info("비회원 장바구니 상품 로그인 회원 장바구니로 insert 성공!");
					} else {
						return "errer";
					}
				} else {
					System.out.println("동일 상품 존재");
				}
			}
			
			model.addAttribute("sameBucketLst", sameBucketLst);
		}		
		
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

	// 장바구니 아이템 전체 삭제
	@RequestMapping("/cart/delete/all/{member_id}")
	public @ResponseBody ResponseEntity<Integer> deleteItem(@PathVariable("member_id") String member_id) {
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
	
	// 장바구니 개별 아이템 삭제
	@RequestMapping("/cart/delete/{member_id}/{product_id}")
	public @ResponseBody ResponseEntity<Integer> deleteItem(@PathVariable("member_id") String member_id, @PathVariable("product_id") int product_id) {
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
	
	// 장바구니 체크 OnOff
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
	
	// 주문하기
	@RequestMapping("/cart/order/{member_id}")
	public @ResponseBody ResponseEntity<Integer> goOrder(@PathVariable("member_id") String member_id) {
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
	
	// **************************************** 김도연 비회원 장바구니 컨트롤러
	@RequestMapping(value="cart/updateBucekt", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> updateBucekt(@RequestParam("status") String status, @RequestBody InsertintoBucketDTO dto) throws Exception {
		logger.info("비회원 장바구니와 회원 장바구니 겹치는 상품 상태 결정");
		
		ResponseEntity<String> entity = null;
		
		System.out.println("status : " + status + ", dto : " + dto.toString());
		
		if(status.equals("modi")) {
			logger.info("비회원 장바구니로 회원 장바구니 수량 변경");
			
			if(prodDetailService.updateBucketQty(dto)) {
				entity = new ResponseEntity<String>("modiSuccess", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("modiFail", HttpStatus.BAD_REQUEST);
			}
		} else if(status.equals("add")) {
			logger.info("비회원 장바구니와 회원 장바구니 수량 합침");
			
			if(prodDetailService.updateAddBucketQty(dto)) {
				entity = new ResponseEntity<String>("addSuccess", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("addFail", HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
	}
	
	
	@RequestMapping("cart/no")
	public String nonUserCart() throws Exception {
		logger.info("비회원 장바구니 페이지 호출");
		return "cambakMall/mallNonUserCart";
	}

	// 장바구니 목록
	@RequestMapping("/cart/no/{ssid}")
	public @ResponseBody ResponseEntity<List<MyNonUserBucketVO>> nonUserCartList(@PathVariable("ssid") String ssid) {
		logger.info("비회원 장바구니 상품 가져오기");
		
		ResponseEntity<List<MyNonUserBucketVO>> entity = null;
		try {
			entity = new ResponseEntity<List<MyNonUserBucketVO>>(bucketService.getNonUserBucketList(ssid), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	// 장바구니 수량 변경
	@RequestMapping("/cart/no/{ssid}/{product_id}/{qty}")
	public @ResponseBody ResponseEntity<Integer> changeNonUserQty(@PathVariable("ssid") String ssid, 
			@PathVariable("product_id") int product_id, @PathVariable("qty") int qty) {
		logger.info("비회원 장바구니 수량 변경");
		
		ResponseEntity<Integer> entity = null;
		
		System.out.println(ssid + ", " + product_id + ", " + qty);
		try {
			entity = new ResponseEntity<Integer>(bucketService.changeNonUserQty(ssid, product_id, qty), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	// 장바구니 아이템 전체 삭제
	@RequestMapping("/cart/no/delete/all/{ssid}")
	public @ResponseBody ResponseEntity<Integer> nonUserDeleteItemAll(@PathVariable("ssid") String ssid) {
		logger.info("비회원 장바구니 전체 상품 삭제");
		
		System.out.println(ssid);
		
		ResponseEntity<Integer> entity = null;

		try {
			bucketService.nonUserDeleteItemAll(ssid);
			entity = new ResponseEntity<Integer>(1, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	
	// 장바구니 개별 아이템 삭제
	@RequestMapping("/cart/no/delete/{ssid}/{product_id}")
	public @ResponseBody ResponseEntity<Integer> nonUserDeleteItem(@PathVariable("ssid") String ssid, @PathVariable("product_id") int product_id) {
		logger.info("비회원 장바구니 개별 상품 삭제");
		
		System.out.println(ssid);
		
		ResponseEntity<Integer> entity = null;

		try {
			bucketService.nonUserDeleteItem(ssid, product_id);
			entity = new ResponseEntity<Integer>(1, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	// 장바구니 체크 OnOff
	@RequestMapping("/cart/no/check/{ssid}/{product_id}")
	public @ResponseBody ResponseEntity<Integer> nonUserCheckOnOff(@PathVariable("ssid") String ssid, @PathVariable("product_id") int product_id) {
		logger.info("비회원 장바구니 체크 상태 바꿈");
		ResponseEntity<Integer> entity = null;
		
		try {
			entity = new ResponseEntity<Integer>(bucketService.nonUserCheckOnOff(ssid, product_id), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// **************************************** 김태훈 컨트롤러
	
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String BoardResellList(PagingCriteria cri, Model model) throws Exception {
//		System.out.println("boardResellList 테스트");
//		cri.setPage(1);
//		model.addAttribute("board", service.prodBoardReadAll(cri));
//		PagingParam pp = new PagingParam();
//		pp.setDisplayPageNum(9);
//		pp.setCri(cri);
//
//		pp.setTotalCount(service.prodBoardReadAllCnt()); // 게시물 갯수
//		System.out.println(pp.toString());
//		model.addAttribute("pagingParam", pp);
//
//		return "cambakMall/prodList";
//	}
//
//	@RequestMapping(value = "/list/{page}", method = RequestMethod.POST)
//	public ResponseEntity<List<ProductsVO>> BoardResellListPOST(@PathVariable("page") int page, PagingCriteria cri,
//			Model model) throws Exception {
//		System.out.println("boardResellList 테스트");
//		System.out.println("page : " + page);
//		ResponseEntity<List<ProductsVO>> entity = null;
//		List<ProductsVO> listResell = service.prodBoardReadAll(cri);
//		if (listResell != null) {
//			entity = new ResponseEntity<List<ProductsVO>>(listResell, HttpStatus.OK);
//		}
//
//		return entity;
//	}
//	
//	@RequestMapping(value="/search", method=RequestMethod.GET)
//	public String seach(PagingCriteria cri,@RequestParam("searchType") String searchType,@RequestParam("optionType") String optionType,@RequestParam("searchWord") String searchWord,Model model) throws Exception {
//		System.out.println("search 테스트");
//		SearchCriteria sri = new SearchCriteria();
//		System.out.println("optionType : "+optionType+"\n searchType : "+searchType+"\n searchWord : "+searchWord+"\n page : "+cri.getPage()+"\n pageStart"+cri.getPageStart());
//		sri.setOptionType(optionType);
//		sri.setSearchType(searchType);
//		sri.setSearchWord(searchWord);
//		List<ProductsVO> searchProd = service.prodBoardSearch(cri,sri);
//		System.out.println(searchProd);
//		model.addAttribute("board",searchProd);
//		
//		return "cambakMall/prodList";
//		}

	// **********************************************
}
