package com.recruit.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.recruit.domain.BoardVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object boardVO = modelMap.get("boardVO");
//		System.out.println("인터셉터 들어오니 ? "+boardVO);

		
		if (boardVO != null) {

			logger.info("new login success");
			
			
			session.setAttribute(LOGIN, boardVO);
	
			if (request.getParameter("useCookie")!= null&&request.getParameter("useCookie").equals("on")) {

				logger.info("remember me................");
				BoardVO login = (BoardVO)session.getAttribute("login");
				if(login.getCname()==null){
					Cookie PloginCookie = new Cookie("PloginCookie", login.getId());
					PloginCookie.setPath("/");
					PloginCookie.setMaxAge(60 * 60 * 24 * 7); //60초*60분*24시간*7일
					response.addCookie(PloginCookie);		
					Cookie CloginCookie = new Cookie("CloginCookie", "");
					CloginCookie.setPath("/");
					CloginCookie.setMaxAge(0); //쿠키 제거
					response.addCookie(CloginCookie);
				}else{
					Cookie CloginCookie = new Cookie("CloginCookie", login.getId());
					CloginCookie.setPath("/");
					CloginCookie.setMaxAge(60 * 60 * 24 * 7); //60초*60분*24시간*7일
					response.addCookie(CloginCookie);
					Cookie PloginCookie = new Cookie("PloginCookie", "");
					PloginCookie.setPath("/");
					PloginCookie.setMaxAge(0); //쿠키 제거
					response.addCookie(PloginCookie);
				}
				//System.out.println("아이디값 출력 한번 해봅니다. "+ id);
			}else{
				//System.out.println("확인절차");
				Cookie PloginCookie = new Cookie("PloginCookie", "");
				PloginCookie.setPath("/");
				PloginCookie.setMaxAge(0); //쿠키 제거
				response.addCookie(PloginCookie);
				Cookie CloginCookie = new Cookie("CloginCookie", "");
				CloginCookie.setPath("/");
				CloginCookie.setMaxAge(0); //쿠키 제거
				response.addCookie(CloginCookie);
			}

			Object dest = session.getAttribute("dest");
			
			
			response.sendRedirect(dest != null ? (String) dest : "/");
			
			//window.location.href 이용해서 장난질 해보기
		}
		
	}

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