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
import com.cambak21.dto.AdminProductListDTO;
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
	// 페이징 있는 전체 게시글 목록 출력
		@RequestMapping(value = "/prodList", method = RequestMethod.GET)
		public String productList(Model model, PagingCriteria cri) throws Exception  {
			logger.info("productList호출, 페이징을 이용한 전체 리스트 출력");
			// 검색한 결과의 총 게시글 수
			model.addAttribute("boardList", service.prodList(cri));// 게시물 데이터
			
			PagingParam pp = new PagingParam();
			pp.setCri(cri);
			pp.setTotalCount(service.getTotalProdListCnt());// 게시물 총 개수를 가져와서 세팅

			System.out.println(pp.toString());
			model.addAttribute("pagingParam", pp); // 페이징 처리를 위한 파라메터 객체
			System.out.println("model:" + model.toString());
			return "/admin/productList";
		}
		

		// 검색어 입력
		@RequestMapping(value="/searchProdList", method = RequestMethod.GET)
		public String searchProductList(PagingCriteria cri, SearchCriteria scri, AdminProductListDTO dto, Model model, @RequestParam("product_show") String aa) throws Exception {
			
			System.out.println("aaaaaaaaaaaaaa: " + aa);
			System.out.println("productListDTO: " + dto.toString());
			System.out.println("scri: " + scri.toString());
			System.out.println("검색을 시작합니다.");
			PagingParam pp = new PagingParam();
			pp.setCri(cri);
			// 검색한 결과의 총 게시글 수
			pp.setTotalCount(service.getTotalSearchProdListCnt(scri, dto));
			System.out.println("controller pp : " + pp.toString());
			
			model.addAttribute("boardList", service.goSearchProdList(scri, cri, dto)); // 게시물 데이터
			model.addAttribute("SearchCriteria", scri);
			model.addAttribute("pagingParam", pp);
			
			System.out.println("controller model : " + model.toString());

			return "/admin/productList";
			
		}
		
		// 상품 메인 카테고리 목록 ajax로 가져오는 부분
		@RequestMapping(value="getMainCategories", method=RequestMethod.GET)
		public @ResponseBody Map<String, Object> selectMainCategories() throws Exception {
			logger.info("/admin_product게시판의 getMainCategories-GET방식 호출");
		    Map<String, Object> result = new HashMap<String, Object>();
		    result.put("mainCategories", service.getMainCategories());
		    return result;
			
		} 
	
		// 상품 미들 카테고리 목록 ajax로 가져오는 부분
		@RequestMapping(value="getMiddleCategories", method=RequestMethod.GET)
		public @ResponseBody Map<String, Object> selectMiddleCategories(@RequestParam("mainCategory_id") int mainCategory_id) throws Exception {
			logger.info("/admin_product게시판의 getMainCategories-GET방식 호출");
				  Map<String, Object> result = new HashMap<String, Object>();
				  result.put("middleCategories", service.getMiddleCategories(mainCategory_id));
				  return result;
					
				} 

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
