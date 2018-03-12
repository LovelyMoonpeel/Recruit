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
@RequestMapping("/rpjt/*")
public class UserController {
	
	//밑에서 boarservice를 쓰기 위해서
	@Inject
	private BoardService boardservice;

	//밑에서 service를 쓰기 위해서
	@Inject
	private UserService service;

	//
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	//무슨 역할 하는지 모름."localhost8080/rpjt/cheader"를 주소창에 넣으면 아래 내용이 출력
//	@RequestMapping(value = "/cheader", method = RequestMethod.GET)
//	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
//		System.out.println("/rpjt/cheader 테스트입니다");
//	}

	//jsp에서 <form action="/rpjt/loginPost" method="post">으로 이리로 온다.
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		//Q.뭘 받아와서 vo에 넣는거 같은데 service.logint(dto)해석 불가
		BoardVO vo = service.login(dto);

		//Q.vo가 null이면 끝낸다는 소리인가?
		if (vo == null) {
			return;
		}

		//vo안에 있는 것을 BoardVO.xxx라고 쓰고 이용할 수 있게 하는 코든
		//Model에 BoardVO객체를 추가
		model.addAttribute("boardVO", vo);

		
		System.out.println(dto.isUseCookie());
		
		//코드의 핵심은 loginCookie 값이 유지되는 시간 정보를 데이터베이스에 저장하는 것
		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getId(), session.getId(), sessionLimit);
			
			
		}
		
	}

	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			BoardVO vo = (BoardVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");  
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getId(), session.getId(), new Date());
			}
		}
		
		return "redirect:/personal/index";
	
	}


	@RequestMapping(value = "/joinperson", method = RequestMethod.POST)
	public String joinPost(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("regist post ...........");
		logger.info(board.toString());
		System.out.println("1");
		boardservice.regist(board);
		System.out.println("vfrvwwervewvew2");

		rttr.addFlashAttribute("msg", "success");
		return "redirect:/personal/index";
	}

}
  
