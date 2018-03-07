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

/*
LoginInterceptor는 '/loginPost'로 접근하도록 설정하는 것을 목적으로 작성됨
*/
public class LoginInterceptor extends HandlerInterceptorAdapter {

	//636 start
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	//636 end
	
	//636 start
	/*
	postHandle()에서는 UserController에서 'userVO'라는 이름으로 객체를 담아둔 상태이므로,
	이 상태를 체크해서 HttpSesssion에 저장한다.
	만들어진 쿠키는 반드시 HttpServletResponse에 담겨서 전동됨
	*/
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object boardVO = modelMap.get("boardVO");
		
		if (boardVO != null) {

			logger.info("new login success");
			session.setAttribute(LOGIN, boardVO);
			//response.sendRedirect("/"); 646쪽 하면서 주석처리
			
			//658 start
			/*
			 '자동 로그인'을 선택한 경우 쿠키를 생성하고 생성된 쿠키의 이름은 loginCookie로 지정 생성된
			 loginCookie에는 값(value)으로 현재 세션의 아이디 값을 보관 세션 아이디는 세션 쿠키의 값을 의미
			 */
			/*
			 이 코드를 이용해서 로그인 하면 게시물의 여러 페이지에서 매번 브라우저에 'loginCookie'가 전달되는 것을
			 개발자 도구를 이용해서 확인이 가능
			 */
			if (request.getParameter("useCookie") != null) {

				logger.info("remember me................");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				/*
				 세션쿠키의 경우 브라우저를 종료하면 사라지고, 그렇기 때문에 매번 브라우저를 새로 실행하고 접속하면 새롭게 만들어진다. 
				 반면, loginCookie의 경우 로그인 할 때 브라우저를 이용해서 보관함 오랜 시간 보관되기위해 setMaxAge()를 이용 
				 setMaxAge()는 초 단위의 시간 동안 유효 60 * 60 * 24 * 7를 통해 일주일간 브라우저에 보관
				 */
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
			}
			//658 end
			
			//646 start
			Object dest = session.getAttribute("dest");

			response.sendRedirect(dest != null ? (String) dest : "/rpjt/index");
			//646 end0
		}
	}
	//636 end

	//636 start
	/*
	preHandle()에서는 기존 HttpSession에 남아있는 정보가 있는 경우에는 정보를 삭제함
	*/
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
	//636 end
}
