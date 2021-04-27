package com.cambak21.controller.cambakAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.json.JsonObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cambak21.controller.HomeController;
import com.cambak21.domain.RevenueMonthVO;

import com.cambak21.domain.OrderManagementOrderVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.service.cambakAdmin.adminService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;
import com.mysql.cj.xdevapi.JsonArray;
import com.mysql.cj.xdevapi.JsonValue;

import twitter4j.JSONArray;
import twitter4j.JSONObject;


@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	
	@Inject
	private adminService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String adminIndex() {
		logger.info("adminIndex호출");
		
		return "/admin/index";
	}
	

	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 대기@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value = "/revenue", method = RequestMethod.GET)
	public String revenue() throws Exception{
		
		return "/admin/revenue";
	}
	@RequestMapping(value = "/revenue/perDate", method = RequestMethod.GET)
	public ResponseEntity<List<RevenueVO>> revenueIndex(@RequestParam("dateVal") int dateVal) {
//		model.addAttribute("revenue", service.getPerDayRevenue());
		System.out.println(dateVal);
		ResponseEntity<List<RevenueVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<RevenueVO>>(service.getPerDayRevenue(dateVal), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<RevenueVO>>(HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
		return entity;
	}
	 
	@RequestMapping(value = "revenue/selectDate", method = RequestMethod.GET)
	public ResponseEntity<List<RevenueVO>> selectDate(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, Model model) {
		
		
		
		ResponseEntity<List<RevenueVO>> entity = null;
		try {
			entity = new ResponseEntity<List<RevenueVO>>(service.selectDate(startDate, endDate), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<RevenueVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	@RequestMapping(value = "/revenueWeekly", method = RequestMethod.GET)
	public String revenueWeekly(Model model) throws Exception{
		
		model.addAttribute("thisWeekRevenue", service.thisWeekRevenue());
		
		model.addAttribute("prevWeekRevenue", service.prevWeekRevenue());
		model.addAttribute("thisWeekRefund", service.thisWeekRefund());
		model.addAttribute("prevWeekRefund", service.prevWeekRefund());
		
		return "/admin/revenueWeekly";
	}
	@RequestMapping(value = "revenue/selectWeekly", method = RequestMethod.GET)
	public ResponseEntity<List<RevenueWeeklyVO>> selectWeekly(@RequestParam("revenueWeekly") int revenueWeekly, Model model) {
				
		ResponseEntity<List<RevenueWeeklyVO>> entity = null;
		try {
			entity = new ResponseEntity<List<RevenueWeeklyVO>>(service.selectWeekly(revenueWeekly), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<RevenueWeeklyVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	@RequestMapping(value = "/revenueMonthly", method = RequestMethod.GET)
	public String revenueMonthly(Model model) throws Exception{
		
		
		model.addAttribute("thisMonthRevenue", service.thisMonthRevenue());
		
		model.addAttribute("prevMonthRevenue", service.prevMonthRevenue());
		model.addAttribute("thisMonthRefund", service.thisMonthRefund());
		model.addAttribute("prevMonthRefund", service.prevMonthRefund());
		
		return "/admin/revenueMonthly";
	}
	
	@RequestMapping(value = "revenue/selectMonthly", method = RequestMethod.GET)
	public ResponseEntity<List<RevenueMonthVO>> selectMonthly(@RequestParam("revenueMonthly") int revenueMonthly, Model model) {
				
		ResponseEntity<List<RevenueMonthVO>> entity = null;
		try {
			entity = new ResponseEntity<List<RevenueMonthVO>>(service.selectMonthly(revenueMonthly), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<RevenueMonthVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	

	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 도연@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String memberList(Model model) {
		logger.info("memberList호출");
		
		try {
			model.addAttribute("members",service.getMember());
		} catch (Exception e) {
			model.addAttribute("noMembers");
			e.printStackTrace();
		}
		
		return "/admin/memberList";
	}


	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 정민@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// 페이징 있는 전체 게시글 목록 출력
	@RequestMapping(value = "/prodList", method = RequestMethod.GET)
	public String productList(Model model, PagingCriteria cri) throws Exception  {
		System.out.println(cri.toString());
		logger.info("productList호출, 페이징을 이용한 전체 리스트 출력");
		// 검색한 결과의 총 게시글 수
		model.addAttribute("boardList", service.prodList(cri));// 게시물 데이터
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.getTotalProdListCnt());// 게시물 총 개수를 가져와서 세팅

		System.out.println(pp.toString());
		model.addAttribute("pagingParam", pp); // 페이징 처리를 위한 파라메터 객체
		System.out.println(model.toString());
		return "/admin/productList";
	}
	

	// 검색어 입력
	@RequestMapping(value="/searchProdList", method = RequestMethod.GET)
	public String searchProductList(PagingCriteria cri, SearchCriteria scri, Model model) throws Exception {
		
		System.out.println("검색을 시작합니다.");
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		// 검색한 결과의 총 게시글 수
		pp.setTotalCount(service.getTotalSearchProdListCnt(scri));
		System.out.println(pp.toString());
		
		model.addAttribute("boardList", service.goSearchProdList(scri, cri)); // 게시물 데이터
		model.addAttribute("SearchCriteria", scri);
		model.addAttribute("pagingParam", pp);
		
		System.out.println("boardList : " + service.goSearchProdList(scri, cri).toString());

		return "/admin/productList";
		
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@GetMapping("/prodRegister")
	public String productInsert() {
		logger.info("adminIndex호출");
		
		return "/admin/productRegister";
	}

	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 종진@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	
	
	@RequestMapping(value = "/board_admin_option", method = RequestMethod.GET)
	public String board_admin_option() throws Exception{
		return "/admin/board_admin_option";
	}
	
	
	
	

	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 효원@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	@RequestMapping(value="/orderManagement")
	public String orderManagement(PagingCriteria cri, Model model) throws Exception{
		model.addAttribute("order", service.readOrderList(cri));
		return "/admin/adminOrderManagement";
	}
	
	@RequestMapping(value="/orderManagement/search")
	public String orderManagementSearch(OrderManagementOrderVO vo, PagingCriteria cri, Model model) throws Exception{
		System.out.println(vo.toString());
		return "";
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	
}

