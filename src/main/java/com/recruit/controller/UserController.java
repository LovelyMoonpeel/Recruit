package com.recruit.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.recruit.domain.BoardVO;
import com.recruit.dto.LoginDTO;
import com.recruit.service.UserService;

@Controller
@RequestMapping("/rpjt/*")
public class UserController {
	//635 start
	@Inject
	private UserService service;

	@RequestMapping(value = "/cheader", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		BoardVO vo = service.login(dto);

		if (vo == null) {
			return;
		}

		model.addAttribute("boardVO", vo);

		//635 end

		//666 start
		/*
		 * 사용자가 '자동 로그인'을 선택한 경우 필요한 기능 추가 코드의 핵심은 loginCookie값이 유지되는 시간 정보를
		 * 데이터베이스애 저장하는 것
		 */
		System.out.println(dto.isUseCookie());
		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getId(), session.getId(), sessionLimit);
		}
	}
	//666 end

	//673 start
	/*
	 * 로그아웃의 처리는 HttpSession인 경우 login과 같이 저장된 정보를 삭제하고, invalidate()를 주는 작업과
	 * 쿠키의 유효시간을 변경하는 작업으로 이루어진다.
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			BoardVO vo = (BoardVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");  //logout.jsp는 별다른 내용없이 '/'과 같은 경로로 이동하는 코드만 작성한다.
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getId(), session.getId(), new Date());
			}
		}
	}
	//673 end

}
  
