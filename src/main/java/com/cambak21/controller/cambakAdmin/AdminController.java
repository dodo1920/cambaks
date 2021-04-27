package com.cambak21.controller.cambakAdmin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.json.JsonObject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.cambak21.controller.HomeController;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.BoardVO;
import com.cambak21.domain.OrderManagementOrderVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.dto.AdminBoardDTO;
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
//      model.addAttribute("revenue", service.getPerDayRevenue());
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
   public String revenueWeekly() throws Exception{
      
      return "/admin/revenueWeekly";
   }
   @RequestMapping(value = "/revenueMonthly", method = RequestMethod.GET)
   public String revenueMonthly() throws Exception{
      
      return "/admin/revenueMonthly";
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
   
   

   
   @RequestMapping(value = "/board_admin/ajax/{goStartDate}/{goEndDate}/{board_category}/{searchselectedCategory}/{searchboardType}/{searchTxtValue}/{page}", method = RequestMethod.GET)
   public ResponseEntity<Map<String, Object>> getRecentlyProduct(@PathVariable("goStartDate") String goStartDate, @PathVariable("goEndDate") String goEndDate, @PathVariable("board_category") String board_category, @PathVariable("searchselectedCategory") String searchselectedCategory, @PathVariable("searchboardType") String searchboardType, @PathVariable("searchTxtValue") String searchTxtValue, @PathVariable("page") int page, Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ParseException {
	   ResponseEntity<Map<String, Object>> entity = null;
	   System.out.println(goStartDate + "," + goEndDate + "," + board_category + "," + searchselectedCategory + "," + searchboardType + "," + searchTxtValue + "," + page);
//	   SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
//	   Date to = fm.parse(goStartDate);
//	   System.out.println(to);
	   AdminBoardDTO vo = new AdminBoardDTO();
	
	   Map<String, Object> para = new HashMap<String, Object>();
	   
	   List<BoardVO> Boardlst = new ArrayList<BoardVO>();
	   
	   PagingCriteria pc = new PagingCriteria();
	   pc.setPage(page);
	   PagingParam pp = new PagingParam();
	   pp.setCri(pc);
//	   pp.setTotalCount(service.getSearchTotalNoticeBoardCnt(scri));
		
	   try {
	    if(searchselectedCategory.equals("board")) {
	    	Boardlst = service.goGetBoard_admin(goStartDate, goEndDate, board_category, pc);
	    }else {
	    	
	    }
		
		para.put("Boardlst", Boardlst);
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	   
	   
	   	para.put("pagingParam", pp);
	   	
			 try { 
//				 @PathVariable("replyBoard_no") int replyBoard_no, @RequestBody ReplyBoardVO vo
				 	entity = new ResponseEntity<Map<String, Object>>(para, HttpStatus.OK);
				
				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					 e.printStackTrace();
				}
			
			return entity;
	   }
   
   
   
   
   
   
   
   
   

   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 효원@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   
   @RequestMapping(value="/orderManagement")
   public String orderManagement(PagingCriteria cri, Model model) throws Exception{
      model.addAttribute("order", service.readOrderList(cri));
      return "/admin/adminOrderManagement";
   }
   
   
   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

}
