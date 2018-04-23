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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.BoardVO;
import com.recruit.dto.LoginDTO;
import com.recruit.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService service;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	
	@RequestMapping(value = "/loginPost", method = RequestMethod.GET)
	public void loginGET(Model model) throws Exception{
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(@RequestParam("location") String location ,HttpServletRequest request, LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		BoardVO vo = service.login(dto);
		
		if (vo == null) {
			rttr.addFlashAttribute("msg", "login_fail");
			return "redirect:/user/loginPost";
		}
		
		if(vo.getAuthCode()!= null){
			rttr.addFlashAttribute("msg", "email");
			return "redirect:/user/loginPost";
		}
		
		if(dto.getIndex().equals("per")){
			if(vo.getCname()!=null){
				rttr.addFlashAttribute("msg", "company");
				return "redirect:/user/loginPost";
			}
		}else{
			if(vo.getCname()==null){
				rttr.addFlashAttribute("msg", "personal");
				return "redirect:/user/loginPost";
			}
		}
		
		
		model.addAttribute("boardVO", vo); 

		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getId(), session.getId(), sessionLimit);
			
		}
		
		session.setAttribute("location", location);
		return "/search/S_index";
		
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
		return "redirect:/";
	}

	//문> 기업회원 탈퇴
	@RequestMapping(value = "/leave", method = RequestMethod.GET)
	public String leave(HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr)
			throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {

			session.removeAttribute("login");

			session.invalidate();

		}
		rttr.addFlashAttribute("msg", "leave");
		return "redirect:/";
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
		rttr.addFlashAttribute("msg", "join");

		return "redirect:/";
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
	
	@RequestMapping(value = "/emailoverlap", method = RequestMethod.POST)
	public ResponseEntity<String> Emailoverlap(@RequestBody BoardVO board) throws Exception {
		ResponseEntity<String> entity = null;
		
		try{
			String email = board.getEmail();
			if(service.emailoverlap(email)==null){
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
	
	@RequestMapping(value = "/IDsearch", method = RequestMethod.GET)
	public String IDsearchGET(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		BoardVO login = (BoardVO) session.getAttribute("login");
		if(login!=null){
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/";
		}
		return "/user/IDsearch";
	}
	
	
	@RequestMapping(value = "/IDsearch", method = RequestMethod.POST)
	public ResponseEntity<String> IDsearchPOST(@RequestBody LoginDTO dto, Model model) throws Exception {
		ResponseEntity<String> entity = null;
		try{
			if(dto.getCname()==null){
				if(service.pread(dto)!=null){
					service.pRead(dto);
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}
			}else{
				if(service.cread(dto)!=null){
					service.cRead(dto);
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/PWsearch", method = RequestMethod.GET)
	public String PWsearchGET(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		BoardVO login = (BoardVO) session.getAttribute("login");
		if(login!=null){
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/";
			}
		return "/user/PWsearch";
	}
	
	@RequestMapping(value = "/PWsearch", method = RequestMethod.POST)
	public ResponseEntity<String> PWsearchPOST(@RequestBody LoginDTO dto, Model model) throws Exception {
		ResponseEntity<String> entity = null;
		try{
			if(dto.getCname()==null){
				if(service.getppw(dto)!=null){
					service.ppwchk(dto);
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("fail", HttpStatus.OK);
				}
			}else{
				if(service.getcpw(dto)!=null){
					service.cpwchk(dto);
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("fail", HttpStatus.OK);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
