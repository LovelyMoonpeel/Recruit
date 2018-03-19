package com.recruit.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


//문> 컨트롤러 거치기 전에 여기 먼저 처리 됨,servlet-context.xml에 인터셉트 설정을 추가해줘야함
public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	//문> postHandle은 요청한 URL을 처리한 다음 실행되는 작업
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();   //문> request객체로부터 세션객체 생성

		ModelMap modelMap = modelAndView.getModelMap();   //문> modelAndView는 컨트롤러의 처리 결과를 보여줄 뷰와 뷰에 전달할 값을 저장하는 용도로 사용됨 
		 
		Object boardVO = modelMap.get("boardVO");
		
		if (boardVO != null) {

			logger.info("★★★로그인 성공★★★");
			
			session.setAttribute(LOGIN, boardVO);   //문> 세션 생성
			
			//문> 자동 로그인 실행
			if (request.getParameter("useCookie") != null) {

				logger.info("★★★자동 로그인 실행★★★");
			
				Cookie loginCookie = new Cookie("loginCookie", session.getId());   //문> 사용자가'자동로그인'을 선택한 경우 Cookie클래스를 이용하여 쿠키를 생성하고 생성된 쿠키의 이름은 loginCookie, 쿠키값은 session.getId()로 지정
				
				loginCookie.setPath("/");
				
				System.out.println("★★★loginCookie.getName()뭘까?★★★"+loginCookie.getName());   //문> 위에 "loginCookie" 따옴표 안에 있는 값이 출력된다.
				System.out.println("★★★loginCookie.getValue()뭘까?★★★"+loginCookie.getValue()); 
				System.out.println("★★★session.getId()뭘까?★★★"+session.getId());
				
				/*문> 세션 쿠키의 경우 브라우저를 종료하면 사라지지만, 작성하는 loginCookie의 경우 오랜시간 보관되기 위해서 setmaxAge()를 이용한다.
				setMaxAge()는 초 단위의 시간 동안 유효하므로 , 60*60*24*7를 이용해서 일주일간 브라우저에서 보관*/
				loginCookie.setMaxAge(60*60*24*7);
								
				response.addCookie(loginCookie);   //문> response 기본 객체의 addCookie() 메서드를 사용하여 쿠키를 추가한다.
			}

			Object dest = session.getAttribute("dest");   //문> 이름이 dest인 속성 값을 구해서 dest객체에 넣는다.
				
			response.sendRedirect(dest != null ? (String) dest : "/personal/index");   //문> 로그인 성공하면 /personal/index로 이동한다.,response.sendRedirect(String location);는 해당 페이지로 가라는 말
			
		}
				
	}

	//문> preHandle은 요청한 URL에 대한 처리가 진행되기 전에 실행된다. 만약 boolean값이 false이면 다음으로 진행하지 않는다. true일때만 다음으로 진행한다. 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();   //문> 세션객체 생성
		
		System.out.println("세션?"+session);

		//문> LOGIN의 세션에 남아있는 정보가 있는 경우 정보를 삭제 
		if (session.getAttribute(LOGIN) != null) {
			
			logger.info("★★★이전꺼는 삭제처리됨★★★");
			
			session.removeAttribute(LOGIN);
		}
		
		return true;   //문> true를 리턴값으로 보내서 다음 과정이 진행되게 함, 다음 과정은 요청한 url을 처리
	}

}
