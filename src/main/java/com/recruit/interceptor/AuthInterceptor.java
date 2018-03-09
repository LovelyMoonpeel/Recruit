package com.recruit.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.recruit.domain.BoardVO;
import com.recruit.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter {

  private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
 
  @Inject
  private UserService service;
  
  /* 현재 사용자가 로그인한 상태인지를 체크하고,컨트롤러를 호출하개 할 것인지를 결정한다.
   * 사용자가 로그인하지 않은 상태라면 '/rpjt/index'으로 이동하게 한다.
  */
  @Override
  public boolean preHandle(HttpServletRequest request,
      HttpServletResponse response, Object handler) throws Exception {
    
    HttpSession session = request.getSession();   

    if(session.getAttribute("login") == null){
    
      logger.info("current user is not logined");
      
      saveDest(request);
      
      Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
      
      if(loginCookie != null) { 
        
        BoardVO boardVO = service.checkLoginBefore(loginCookie.getValue());
        
        logger.info("USERVO: " + boardVO);
        
        if(boardVO != null){
          session.setAttribute("login", boardVO);
          return true;
        }
        
      }
      
      response.sendRedirect("/rpjt/index");
      return false;
    }
    
    return true;
  } 

  //saveDest()메소드를 이용해서 원래 사용자가 원하는 페이지의 정보는 HttpSession에 'dest'라는 이름으로 저장합니다.
  //GET방식인 경우에는 URI정보 뒤의 파라미터들을 함께 보관해야 한다.
  private void saveDest(HttpServletRequest req) {

    String uri = req.getRequestURI();

    String query = req.getQueryString();

    if (query == null || query.equals("null")) {
      query = "";
    } else {
      query = "?" + query;
    }

    if (req.getMethod().equals("GET")) {
      logger.info("dest: " + (uri + query));
      req.getSession().setAttribute("dest", uri + query);
    }
  }

}


