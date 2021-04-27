package com.cambak21.controller.cambakAdmin;

import java.util.Base64.Decoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.json.JsonObject;
import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.core.internal.runtime.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cambak21.controller.HomeController;
import com.cambak21.domain.RevenueMonthVO;

import com.cambak21.domain.OrderManagementOrderVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.service.cambakAdmin.adminService;
import com.cambak21.util.ChattingImageUploads;
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
   
   @PostMapping("/productInsert")
   public String productInsert(ProductsVO vo) {
	   System.out.println("product VO : " + vo.toString());
	   
	   return null;
   }
   
   /**
  * @Method Name : productDetail_imgUpload
  * @작성일 : 2021. 4. 27.
  * @작성자 : 승권
  * @변경이력 : 
  * @Method 설명 : product_detail에 사용될 이미지 업로드
  * @param vo
  * @return
  */
   @RequestMapping(value="/productDetail", method = RequestMethod.POST, produces = "text/html; charset=utf8")
   public ResponseEntity<String> productDetail_imgUpload(@RequestParam("image") MultipartFile file, HttpServletRequest request) {
	   ResponseEntity<String> entity = null;
	   
	   try {
			// 파일 업로드 될 서버 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploads/product");
			// 파일 저장하기 위해 메서드 호출 후 경로 반환 받기
			String uploadFile = ChattingImageUploads.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			if (!uploadFile.equals("-1")) {
				
				// -1이 아니라면 이미지 파일
				entity = new ResponseEntity<String>(uploadFile, HttpStatus.OK);
			} else {
				// 이미지 파일 아닌것
				// view에서 modal 띄움
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}	   
	   return entity;
   }
   
   /**
  * @Method Name : productThumnail_imgUpload
  * @작성일 : 2021. 4. 27.
  * @작성자 : 승권
  * @변경이력 : 
  * @Method 설명 : 썸네일 이미지 업로드
  * @param file
  * @param request
  * @return
  */
@RequestMapping(value="/productThumnail", method = RequestMethod.POST, produces = "text/html; charset=utf8")
   public ResponseEntity<String> productThumnail_imgUpload(@RequestParam("image") MultipartFile file, HttpServletRequest request) {
	   ResponseEntity<String> entity = null;
	   
		try {
			// 파일 업로드 될 서버 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploads/product");
			// 파일 저장하기 위해 메서드 호출 후 경로 반환 받기
			String uploadFile = ChattingImageUploads.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			if (!uploadFile.equals("-1")) {
				
				// -1이 아니라면 이미지 파일
				entity = new ResponseEntity<String>(uploadFile, HttpStatus.OK);
			} else {
				// 이미지 파일 아닌것
				// view에서 modal 띄움
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}	   
	   return entity;
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
