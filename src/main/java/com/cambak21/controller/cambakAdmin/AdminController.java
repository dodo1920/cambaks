package com.cambak21.controller.cambakAdmin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import com.cambak21.domain.ProductAnalysisVO;
import com.cambak21.domain.RevenueEachWeekVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.service.cambakAdmin.adminService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;


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
	
	@RequestMapping(value = "revenue/selectEveryWeekly", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> everyEachWeek(@RequestParam("revenueWeekly") int revenueWeekly, RevenueEachWeekVO vo){
		
//		ResponseEntity<List<RevenueEachWeekVO>> entity = null;
		ResponseEntity<Map<String, Object>> entity = null;
		List lst = new ArrayList();
		
		for (int i = 1; i < revenueWeekly; i++ ) {
			try {
				if(service.selectEachWeek(i) == null) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
					String today = getWeekOfYear(sdf.format(new Date()), i);
					System.out.println("$$$$$$$$$$$$$$$$$" + today);
					String startDate = getMondayDate(today);
					System.out.println("@@@@@@@@@@@@@@@@@" + startDate);

				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
//		try {
//			entity = new ResponseEntity<List<RevenueEachWeekVO>>(service.selectEachWeek(revenueWeekly), HttpStatus.OK);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		Map<String, Object> para = new HashMap<String, Object>();
//		try {
//			System.out.println(service.selectEachWeek(revenueWeekly).toString());
//			para.put("revenue", service.selectEachWeek(revenueWeekly));
//			para.put("revenue1", service.selectEachWeekRefund(revenueWeekly));
//			entity = new ResponseEntity<Map<String, Object>>(para, HttpStatus.OK);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
		return entity;
	}
	
	


	private String getWeekOfYear(String date, int i) {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",	Locale.KOREA);

		String[] dates = date.split("-");
		int year = Integer.parseInt(dates[0]);
		int month = Integer.parseInt(dates[1]);
		int day = Integer.parseInt(dates[2]);
		day = day -7 * (i-1);
		calendar.set(year, month - 1, day);
		Date weekago = calendar.getTime();
		return formatter.format(weekago);
		}
	
	private String getMondayDate(String today) {
		
		System.out.println("##############" + today);
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",	Locale.KOREA);

		String[] dates = today.split("-");
		int year = Integer.parseInt(dates[0]);
		int month = Integer.parseInt(dates[1]);
		int day = Integer.parseInt(dates[2]);
		
//		calendar.set(2021, 01, 27);
//		calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
//		
//		System.out.println("@@@@@@@@@@#@#@" + formatter.format(calendar.getTime()));
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, day);
		System.out.println(format.format(cal.getTime()));
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		System.out.println("무야호" + format.format(cal.getTime()));
		
		
		return formatter.format(cal.getTime());
	}
	
	@RequestMapping(value = "/productAnalysis", method = RequestMethod.GET)
	public String productAnalysis() {
		
		return "/admin/productAnalysis";
	}
	
	@RequestMapping(value = "productAnalysis/perDate", method = RequestMethod.GET)
	public ResponseEntity<List<ProductAnalysisVO>> productAnalysisPerDate(@RequestParam("dateVal") int dateVal) {
		
		ResponseEntity<List<ProductAnalysisVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<ProductAnalysisVO>>(service.productAnalysis(dateVal), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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


   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   @GetMapping("/prodRegister")
   public String productInsert() {
      logger.info("adminIndex호출");
      
      return "/admin/productRegister";
   }

   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 종진@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

   
   
   @RequestMapping(value = "/board_admin", method = RequestMethod.GET)
   public String board_admin_option() throws Exception{
      
      return "/admin/board_admin";
   }
   
   
   
   

   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 효원@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   
   @RequestMapping(value="/orderManagement")
   public String orderManagement(PagingCriteria cri, Model model) throws Exception{
      model.addAttribute("order", service.readOrderList(cri));
      return "/admin/adminOrderManagement";
   }
   
   
   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

}
