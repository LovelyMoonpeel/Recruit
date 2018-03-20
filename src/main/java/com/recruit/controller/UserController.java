package com.recruit.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.recruit.domain.BoardVO;
import com.recruit.dto.LoginDTO;
import com.recruit.service.BoardService;
import com.recruit.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService service;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		System.out.println("dto값 출력 : "+dto);
		
		BoardVO vo = service.login(dto);

		System.out.println("로그인 정보 확인 : " + vo);
		
		if (vo == null) {
			return;
		}

		model.addAttribute("boardVO", vo);
//		System.out.println(dto.isUseCookie());

		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getId(), session.getId(), sessionLimit);

		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			/*BoardVO vo = (BoardVO) obj;*/

			session.removeAttribute("login");
			session.invalidate();

			/*Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");*/

/*			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getId(), session.getId(), new Date());
			}*/
		}

		return "redirect:/personal/index";

	}

	@RequestMapping(value = "/joinperson", method = RequestMethod.POST)
	public String joinPost(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("regist post ...........");
		logger.info(board.toString());
		System.out.println("1");
		System.out.println("vfrvwwervewvew2");

		rttr.addFlashAttribute("msg", "success");
		return "redirect:/personal/index";
	}
}
