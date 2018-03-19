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


//문> LoginInterceptor에서 이리로 날라옴
@Controller
@RequestMapping("/rpjt/*")
public class UserController {

	//문> Inject애노테이션은 밑에서 쓰기 위해서
	@Inject
	private BoardService boardservice;
	
	@Inject
	private UserService service;


	private static final Logger logger = LoggerFactory.getLogger(UserController.class);


	@RequestMapping(value = "/cheader", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		System.out.println("/rpjt/cheader 테스트입니다");
	}

	//문> jsp에서 <form action="/rpjt/loginPost" method="post">의 처리로 이리로 온다.
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		
		BoardVO vo = service.login(dto);   //문> 로그인이 성공하면 BoardVO객체를 반환함

		//문> 로그인 실패시
		if (vo == null) {  
			return;
		}
		
		model.addAttribute("boardVO", vo);   //문> Model에 boardVO라는 이름으로 객체를 넣었다
		
		System.out.println("★★★쿠키가 있냐?★★★"+dto.isUseCookie());   //문> dto 쿠키가 있으면 true, 없으면 false

		//문> dto 쿠키가 있으면 다음이 진행되는데 코드의 핵심은 loginCookie 값이 유지되는 시간 정보를 데이터베이스에 저장하는 것
		if (dto.isUseCookie()) {
			
			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getId(), session.getId(), sessionLimit);
			
			System.out.println("★★★if(dto.isUseCookie()) 여기 들어왔고, 끝까지 진행됨★★★"); 
			
			}

		}
		/*문> 위에서 void를 String으로 바꾸고
              return "hello" ;
	                      으로 바꾸면 로그인 실패시 여기 써 있는 곳으로 이동 */
	

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

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

	//문> 회원가입 부분
	@RequestMapping(value = "/joinPost", method = RequestMethod.POST)
	public String joinPost(BoardVO board, RedirectAttributes rttr) throws Exception {
		
		logger.info("regist post ...........");
		
		logger.info(board.toString());
		
		boardservice.regist(board);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/personal/index"; //문> @.@ 나중에 메인페이지로 가게끔 하기
	}
}
