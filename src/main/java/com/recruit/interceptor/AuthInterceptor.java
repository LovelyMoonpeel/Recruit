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

//문> 현재 사용자의 세션에 login이 존재하지 않지만, 쿠키 중애서 loginCookie가 존재할 때 처리가 진행됨
public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	//문> @Inject는 밑에서 참조변수를 쓰고자 할 때 해당 참조변수를 이렇게 애노태이션 적용
	@Inject
	private UserService service;

	//문> preHandle은 요청한 URL에 대한 처리가 진행되기 전에 실행된다.만약 boolean값이 false이면 다음으로 진행하지 않는다. true일때만 다음으로 진행한다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();   //문> request객체로부터 세션객체 생성

		if (session.getAttribute("login") == null) {   //문> 이름이 login인 속성의 값을 구해서 null인지 체크한다.

			logger.info("★★★현재 사용자는 로그인 되어 있지 않습니다.★★★");

			saveDest(request);   //문> saveDest()메소드는 밑에 있음

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");   //문> 무리가 만들어 놓은 쿠키를 가져온다.
																				
			//문> 쿠키가 존재하는 경우 안에꺼 진행
			if (loginCookie != null) {
				
				//문> 아직 유효시간이 지나지 않으면서 해당 sessionId 정보를 가지고 있는 사용자 정보를 반환
				BoardVO boardVO = service.checkLoginBefore(loginCookie.getValue());   //문> loginCookie의 값을 꺼내오고(즉,저장해놓은 세션id를 꺼내오고)

				logger.info("★★★USERVO:★★★" + boardVO);

				if (boardVO != null) {
					session.setAttribute("login", boardVO);
					return true;
				}

			}

			// ☆ 추측컨데 여기는 세션이 없는 경우 로그인 페이지로 가게 해야 할 거 같은데?
			// 그래서 로그인 모달창이 나오게 해야 할 듯..
			response.sendRedirect("/rpjt/index");

			// ★ 다음에 있는 작업을 실행하지 않음
			return false;
		}

		// ★ 다음에 있는 작업을 실행함
		return true;
	}

	// ★ saveDest()메소드를 이용해서 원래 사용자가 원하는 페이지의 정보는
	// HttpSession에 'dest'라는 이름으로 저장합니다.
	private void saveDest(HttpServletRequest req) {

		String uri = req.getRequestURI();

		String query = req.getQueryString();

		if (query == null || query.equals("null")) {

			query = "";

		} else {

			query = "?" + query;

		}

		// ★ GET방식인 경우에는 URI정보 뒤의 파라미터들을 함께 보관해야 한다.
		if (req.getMethod().equals("GET")) {

			logger.info("dest: " + (uri + query));

			req.getSession().setAttribute("dest", uri + query);

		}
	}

}
