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

//전체 최종 수정 3월 13일 문필
//★ servlet-context.xml에 인터셉트 설정을 추가해줘야함
public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	//★ postHandle은 요청한 URL을 처리한 다음 실행되는 작업
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		//★ request객체로부터 세션객체 생성
		HttpSession session = request.getSession();

		//★ modelAndView는 컨트롤러의 처리 결과를 보여줄 뷰와 뷰에 전달할 값을 저장하는 용도로 사용됨 
		ModelMap modelMap = modelAndView.getModelMap();
		
		Object boardVO = modelMap.get("boardVO");
		
		if (boardVO != null) {

			logger.info("new login success");
			
			//★ 세션 생성
			session.setAttribute(LOGIN, boardVO);
	
			if (request.getParameter("useCookie") != null) {

				logger.info("remember me................");
				
				//★ 사용자가'자동로그인'을 선택한 경우 쿠키를 생성하고 생성된 쿠키의 이름은 loginCookie로 지정
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				
				loginCookie.setPath("/");
				
				//★ 세션 쿠키의 경우 브라우저를 종료하면 사라지지만, 
				//작성하는 loginCookie의 경우 오랜시간 보관되기 위해서 setmaxAge()를 이용한다.
				//★ setMaxAge()는 초 단위의 시간 동안 유효하므로 , 60*60*24*7를 이용해서 일주일간 브라우저에서 보관
				loginCookie.setMaxAge(60);
								
				response.addCookie(loginCookie);
			}

			Object dest = session.getAttribute("dest");
				
			//★ 로그인 성공하면 /personal/index로 이동한다.	
			//★ 보통 response.sendRedirect("login.jsp");이런방식으로 쓴다
			//★ 요청된 JSP에서 일단 브라우저로 응답 메세지를 보냈다가 다시 서버로 재요청하는 방식
			response.sendRedirect(dest != null ? (String) dest : "/personal/index");
			
		}
				
	}

	//★ preHandle은 요청한 URL에 대한 처리가 진행되기 전에 실행된다.
	//★ 만약 boolean값이 false이면 다음으로 진행하지 않는다. true일때만 다음으로 진행한다. 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//★ 세션객체 생성
		HttpSession session = request.getSession();
		
		System.out.println(session);

		//★ LOGIN의 세션에 남아있는 정보가 있는 경우 정보를 삭제 
		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		//★ true를 리턴값으로 보내서 다음 과정이 진행되게 함
		//★ 다음 과정은 요청한 url을 처리
		return true;
	}

}
