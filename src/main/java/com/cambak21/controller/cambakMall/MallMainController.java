package com.cambak21.controller.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.mallMainTopCountDTO;
import com.cambak21.service.boardCampingTip.CampingTipBoardService;
import com.cambak21.service.cambakMall.MainService;
import com.cambak21.util.PagingParam;


@Controller
@RequestMapping(value = "/mall/main/*")
public class MallMainController {
	
	@Inject
	private MainService service;

	private static final Logger logger = LoggerFactory.getLogger(MallController.class);
	  
	   /**
	    * @Method Name : homeheader
	    * @작성일 : 2021. 3. 12.
	    * @작성자 : 박종진
	    * @변경이력 : 캠박몰 메인 컨트롤러 - 맵핑 추가
	    * @Method 설명 : 캠박몰 메인 URI 설정
	    * @param locale
	    * @param model
	    * @return
	    */
	
	   @RequestMapping(value = "", method = RequestMethod.GET)
	   public String homeheader(Locale locale, Model model) {
		    Map<String, Object> para = new HashMap<String, Object>();
		
	      for(int i = 1; i < 9; i++) {
	    	  
	    	  List<ProductsVO> lst;
			try {
				lst = service.getNewProduct4(i);
				para.put("NewProduct" + Integer.toString(i), lst);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	      }
	        try {
	        	
	        	List<mallMainTopCountDTO> topSelling;
	        	List<mallMainTopCountDTO> topSellingAvg;
	        	topSelling = service.getTopSelling();
	        	
	        	for(int i = 0; i < topSelling.size(); i++) {
	        		topSelling.get(i).setStar(service.getStar(topSelling.get(i).getProduct_id()));
	        	}
	        	
	        	
	        	 
	           	para.put("topSelling", service.getTopSelling());
	        	para.put("total", service.getTotalCount());
	        	para.put("topReview", service.getTopReview());
	        	para.put("countReviews", service.countReviews());
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
			model.addAttribute("para", para);
			
	
	      
	      
	   
	      return "cambakMall/mall";
	   }
	   
	      

}
