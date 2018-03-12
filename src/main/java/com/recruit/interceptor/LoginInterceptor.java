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

//LoginInterceptor의 설정은 /loginPost의 동작에서 이뤄져야 하니깐 servlet-context.xml에 설정 추가
public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	//UserController에서 'userVO'라는 이름으로 객체를 담아둔 상태이므로, 이 상태를 체크해서 HttpSession에 저장
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object boardVO = modelMap.get("boardVO");
		

		
		if (boardVO != null) {

			logger.info("new login success");
			
			
			session.setAttribute(LOGIN, boardVO);
	
			//쿠키를 생성하고, HttpSevletResponse에 같이 담아서 전송하도록 코드를 수정
			//사용자가'자동로그인'을 선택한 경우 쿠키를 생성하고 생성된 쿠키의 이름은 loginCookie로 지정한다.
			//생성된 loginCookie에는 값으로 현재 세션의 아이디 값을 보관한다.
			//세션 아이디는 세션 쿠키의 값을 말한다.
			//세션 쿠키의 경우 브라우저를 종료하면 사라지지만, 작성하는 loginCookie의 경우 오랜시간 보관되기 위해서 setmaxAge()를 이용한다.
			//setMaxAge()는 초 단위의 시간 동안 유효하므로 , 60*60*24*7를 이용해서 일주일간 브라우저에서 보관
			if (request.getParameter("useCookie") != null) {

				logger.info("remember me................");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
			}

			Object dest = session.getAttribute("dest");
			
			
			
			//로그인 성공하면 /personal/index로 이동한다.	
			response.sendRedirect(dest != null ? (String) dest : "/personal/index");
			
		}
		
	}

	//기존 HttpSession에 남아있는 정보가 있는 경우 정보를 삭제
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}

		return true;
	}

}
