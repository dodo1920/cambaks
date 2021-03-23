package com.cambak21.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.MemberVO;
import com.cambak21.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	 private static Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	 
	 @Inject
     private UserService service;
	   
	 @Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	         throws Exception {
	      HttpSession ses = request.getSession();
	      
	      if (ses.getAttribute("loginMember") == null) {
	         // 로그인 하지 않음
	         logger.info("현재 유저는 login 하지 않았다....");
	         
	         Cookie loginCook = WebUtils.getCookie(request, "ssid");
	         
	         if(loginCook != null) {
	        	 // 로그인 쿠키가 있다면 (자동 로그인을 체크하고 7일 이내에 로그인 했던 유저)
	        	MemberVO vo = service.checkUserWithSesKey(loginCook.getValue());
	            logger.info("자동 로그인을 체크하고 7일 이내에 로그인 했던 유저 : " + vo);
	         
	            if(vo != null) {
	            	// 여기서 id, pwd 확인 없이 세션만으로 로그인 처리 해주기!!!
	            	ses.setAttribute("loginMember", vo);
	            	return true;
	            }
	         
	         }
	         
	         writeDest(request, ses);
	         response.sendRedirect("/user/login"); // /user/login URI를 GET방식으로 호출 (login.jsp 이동)
	         return false; // 컨트롤러 작동 금지
	      }
	      
	      return true; // 로그인 했다면, 컨트롤러 정상 작동 되도록
	   }
	
	
	 private void writeDest(HttpServletRequest request, HttpSession ses) {
		  String uri = request.getRequestURI(); // 요청된 주소를 얻어옴 
		  String queryStr = request.getQueryString(); // 쿼리 스트링 얻어옴 ( 물음표 빠진 상태로 채워줘야 한다.)
		  
		  if(queryStr == null || queryStr.equals("null")) {
			  // 쿼리스트링이 없을 때
			  queryStr = "";
		  }	else {
			  queryStr = "?" + queryStr;
		  }
		  
		  if(request.getMethod().toUpperCase().equals("GET")) {
			  logger.info("최종 목적지 : " + (uri + queryStr));
			  ses.setAttribute("dest", uri + queryStr);
			  
		  }
		  
	   }
	 
	 
	
	
}
