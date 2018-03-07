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


/*
AuthInterceptor는 특정 경로에 접근하는 경우
현재 사용자가 로그인한 상태의 사용자인지를 체크하는 역할을 처리하기위해 작성함
*/
public class AuthInterceptor extends HandlerInterceptorAdapter {

  //642 start
  private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
  //642 end
 
  //667 start
  /* 
  AuthInterceptor는 UserService 타입의 객체를 주입받는다.
    현재 사용자가 HttpsSession에 적당한 값이 없는 경우 loginCookie를 가지고 있는지 체크
    만일 과거에 보관한 쿠키가 있다면 UserService 객체를 이용해서 사용자의 정보가 존재하는지를 확인
    만일 사용자의 정보가 존재한다면 HttpSession에 다시 사용자의 정보를 넣어주게 된다. 
  */  
  @Inject
  private UserService service;
  
  //642 start
  /*
  AuthInterceptor는 preHandle()을 이용하여 현재 사용자가 로그인한 상태인지 체크하고,
    컨트롤러를 호출하게 할 것인지를 결정한다.
    만일 사용자가 로그인하지 않은 상태라면 로그인하는 '/user/login'으로 이동하게 한다.
  */
  @Override
  public boolean preHandle(HttpServletRequest request,
      HttpServletResponse response, Object handler) throws Exception {
    
    HttpSession session = request.getSession();   


    if(session.getAttribute("login") == null){
    
      logger.info("current user is not logined");
      
      //667 start
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
      //667 end
      
      response.sendRedirect("/rpjt/index");
      return false;
    }
    return true;
  } 
  //642 end
  
  //645 start
  /*
  AuthInterceptor는 saveDest()메소드를 이용해서 원래 사용자가 원하는 페이지의 정보는
  HttpSession애 'dest'라는 이름으로 저장한다.
  GET방식인 경우에는 URI정보 뒤의 파라미터들을 함께 보관해야 한다.
  LoginInterceptor는 로그인 성공 후의 response.sendRedirect()작업에
  'dest'정보를 사용하도록 수정
  */
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
  //645 end
  
  //642 start
  /*  
    아래 내용은 667쪽 쓰면서 주석처리됨
 
  @Override
  public boolean preHandle(HttpServletRequest request, 
  	HttpServletResponse response, Object handler) throws Exception {

    HttpSession session = request.getSession();

    if (session.getAttribute("login") == null) {

      logger.info("current user is not logined");
      
      response.sendRedirect("/user/login");
      return false;
    }
    return true;
  }
  */
  //642 end
}


