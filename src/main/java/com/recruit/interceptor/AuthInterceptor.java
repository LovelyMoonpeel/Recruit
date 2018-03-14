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

//전체 수정 3월 13일 문필
//★ 현재 사용자의 세션에 login이 존재하지 않지만, 쿠키 중애서 loginCookie가 존재할 때 처리가 진행됨
public class AuthInterceptor extends HandlerInterceptorAdapter {
 
  private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
 
  //★ @Inject는 밑에서 참조변수를 쓰고자 할 때 해당 참조변수를 이렇게 애노태이션 적용
  @Inject
  private UserService service;
  
  //★ preHandle은 요청한 URL에 대한 처리가 진행되기 전에 실행된다.
  //★ 만약 boolean값이 false이면 다음으로 진행하지 않는다. true일때만 다음으로 진행한다. 
  @Override
  public boolean preHandle(HttpServletRequest request,
      HttpServletResponse response, Object handler) throws Exception {
    
	//★ request객체로부터 세션객체 생성
    HttpSession session = request.getSession();   

    
    if(session.getAttribute("login") == null){
    
      logger.info("current user is not logined");
      
      saveDest(request);
      
      Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
      
      //★ 현재 사용자가 HttpSession에 적당한 값이 없는 경우 loginCookie를 가지고 있는지를 체크한다.
      //만일 과거에 보관한 쿠키가 있다면 UserService 객체를 이용해서 사용자의 정보가 존재하는지를 확인한다.
      //만일 사용자의 정보가 존재한다면 HttpSession에 다시 사용자의 정보를 넣어주게 된다.
      if(loginCookie != null) { 
        
        BoardVO boardVO = service.checkLoginBefore(loginCookie.getValue());
        
        logger.info("USERVO: " + boardVO);
        
        if(boardVO != null){
          session.setAttribute("login", boardVO);
          return true;
        }
        
      }
      
      //☆ 추측컨데 여기는 세션이 없는 경우 로그인 페이지로 가게 해야 할 거 같은데?
      //그래서 로그인 모달창이 나오게 해야 할 듯..
      response.sendRedirect("/rpjt/index");
      
      //★ 다음에 있는 작업을 실행하지 않음
      return false;
    }
    
    //★ 다음에 있는 작업을 실행함
    return true;
  } 

  //★ saveDest()메소드를 이용해서 원래 사용자가 원하는 페이지의 정보는 
  //HttpSession에 'dest'라는 이름으로 저장합니다.
  private void saveDest(HttpServletRequest req) {

    String uri = req.getRequestURI();

    String query = req.getQueryString();

    if (query == null || query.equals("null")) {
      query = "";
    } else {
      query = "?" + query;
    }

    //★ GET방식인 경우에는 URI정보 뒤의 파라미터들을 함께 보관해야 한다.
    if (req.getMethod().equals("GET")) {
      logger.info("dest: " + (uri + query));
      req.getSession().setAttribute("dest", uri + query);
    }
  }

}


