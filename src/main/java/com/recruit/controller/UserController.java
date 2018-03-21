package com.recruit.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.BoardVO;
import com.recruit.dto.JoinDTO;
import com.recruit.dto.LoginDTO;
import com.recruit.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService service;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
//		System.out.println("dto값 출력 : " + dto);
		BoardVO vo = service.login(dto);
//		System.out.println("로그인 정보 확인 : " + vo);
		if (vo == null) {
			//loginPost로 날라감
			return;
		}
		
		if(vo.getAuthCode()!= null){
			return;
		}
		
//		System.out.println("이름값 출력 테스트"+vo.getCname());
		if(dto.getIndex().equals("per")){
			if(vo.getCname()!=null){
				return;
			}
		}else{
			if(vo.getCname()==null){
				return;
			}
		}
		
//		if(vo.getCname()==null){ //개인회원으로 로그인시 로그인 실패
//			return;
//		}

		model.addAttribute("boardVO", vo); 

		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getId(), session.getId(), sessionLimit);
			
		}
		
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr)
			throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {

			session.removeAttribute("login");

			session.invalidate();

		}
		rttr.addFlashAttribute("msg", "logout");
		return "redirect:/cs/S_faq";
	}

	
	@RequestMapping(value = "/joinPost", method = RequestMethod.POST)
	public String joinPost(BoardVO board, RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(board.toString());
		
		if(board.getCname()==null){
			service.pregist(board);
			rttr.addFlashAttribute("msg", "authmsg");
		}else{
			service.cregist(board);
			rttr.addFlashAttribute("msg", "authmsg");
		}
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/cs/S_faq";
	}
	
	@RequestMapping(value = "/idoverlap", method = RequestMethod.POST)
	public ResponseEntity<String> Idoverlap(@RequestBody BoardVO board) throws Exception {
		ResponseEntity<String> entity = null;
		
		try{
			String id = board.getId();
			if(service.idoverlap(id)==null){
				entity = new ResponseEntity<String>("success", HttpStatus.OK);				
			}else{
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String email, Model model) throws Exception { // 이메일인증
		service.userAuth(email);
		model.addAttribute("email", email);

		return "/user/emailConfirm";
	}
	
}
