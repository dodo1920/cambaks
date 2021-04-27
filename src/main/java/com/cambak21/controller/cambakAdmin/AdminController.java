package com.cambak21.controller.cambakAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.inject.Inject;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.controller.HomeController;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.OrderManagementOrderVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.dto.UpdateAdminMemberDTO;
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
   
	@RequestMapping("/memberList")
	public String memberList(@RequestParam(value="page", required = false, defaultValue = "1") int pageNo, Model model, PagingCriteria cri) {
		logger.info("memberList호출");
		
		cri.setPage(pageNo);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		
		try {
			pp.setTotalCount(service.getTotMemberCnt());
			System.out.println(pp);
			model.addAttribute("paging", pp);
			model.addAttribute("members", service.getMember(cri));
		} catch (Exception e) {
			model.addAttribute("noMembers");
			e.printStackTrace();
		}
		
		return "/admin/memberList";
	}
	
	@RequestMapping(value="/deleteMember/{member_id}", method = RequestMethod.GET)
	public ResponseEntity<String> deleteMember(@PathVariable("member_id") String member_id) {
		logger.info("회원 탈퇴시키기");
		
		ResponseEntity<String> entity = null;
		
		System.out.println(member_id);
		
		try {
			if(service.deleteMember(member_id)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		};
		
		return entity;
	}
	
	@RequestMapping(value="/modifyMember", method = RequestMethod.POST)
	public ResponseEntity<String> getMember(@RequestBody UpdateAdminMemberDTO dto) {
		logger.info("회원 정보 수정");

		ResponseEntity<String> entity = null;
		
		System.out.println(dto.toString());
		
		try {
			if(service.updateMember(dto)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
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
