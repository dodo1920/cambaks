package com.cambak21.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

import com.cambak21.domain.CheckListVO;
import com.cambak21.service.checkList.CheckListServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   @Inject
   private CheckListServiceImpl CheckListService;
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);
      
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      model.addAttribute("serverTime", formattedDate );
      
      return "cambakMall/mallDetail";
   }

   @RequestMapping(value = "/testcambak21", method = RequestMethod.GET)
   public String cambak21home(Locale locale, Model model) {
      logger.info("백승권 / 캠박이일 홈페이지 테스트 진입");
   
      

      return "cambakMain/cambak21Board";

   }

   
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
   @RequestMapping(value = "/mall", method = RequestMethod.GET)
   public String homeheader(Locale locale, Model model) {
      logger.info("JJONG homeheader 작업중 . . . . .");
   
      return "cambakMall/mall";
   }
   
   
   @RequestMapping(value = "/boardNotice", method = RequestMethod.GET)
   public String boardNotice(Locale locale, Model model) {
      logger.info("JJONG boardNotice 작업중 . . . . .");
         
      return "boardNotice";
   }
   
   @RequestMapping(value="/checkList", method = RequestMethod.GET)
   public String checkList() {
      logger.info("JJONG ckeckList2 작업중 . . . . .");
   
      
      return "checkList2";
   }
   
   @RequestMapping(value="/ajaxCheckList/{member_id}", method=RequestMethod.GET)
   public ResponseEntity<List<CheckListVO>> lst(@PathVariable("member_id") String member_id){
      // bno에 대한 전체 글 보기
      ResponseEntity<List<CheckListVO>> entity = null;
      try {
         entity = new ResponseEntity<List<CheckListVO>>(CheckListService.getCheckList(member_id), HttpStatus.OK);
         System.out.println(entity.toString());
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 예외가 발생하면 List<ReplyVO> 는 null 이므로 ...ResponseEntity<>
      }   
      return entity;
   }
   


}

