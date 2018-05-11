package com.recruit.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.UserVO;
import com.recruit.domain.CsVO;
import com.recruit.domain.CsqnaCriteria;
import com.recruit.domain.CsqnaPageMaker;
import com.recruit.domain.CsqnaVO;
import com.recruit.domain.MessageVO;
import com.recruit.service.CsService;
import com.recruit.service.CsqnaService;
import com.recruit.service.UserService;

@Controller
@RequestMapping("/cs/*")
public class CsController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private CsService fservice;

	@Inject
	private CsqnaService qservice;
	
	@Inject
	private UserService uservice;
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faqGET(Model model) throws Exception {
		logger.info("faq..........");
		model.addAttribute("list", fservice.listAll());
		
		return "/cs/S_faq";
	}

	@RequestMapping(value = "/faqread", method = RequestMethod.GET)
	public String faqreadGET(@RequestParam("bno") Integer bno, Model model) throws Exception {


		String content = fservice.read(bno).getContent();
		String content2 = content.replace("<", "&lt;"); //HTML 태그를 문자로 인지하게 바꿈
		String content3 = content2.replace("\r\n", "<br>"); //엔터를 <br> 태그로 교체
		String content4 = content3.replace(" ","&nbsp;"); //공백을 &nbsp; 로 변환
		
		model.addAttribute("content", content4);
		model.addAttribute("CsVO", fservice.read(bno));
		
		return "/cs/S_faqread";
	}

	@RequestMapping(value = "/faqmod", method = RequestMethod.GET)
	public String faqModifyGET(@RequestParam("bno") Integer bno, Model model,HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("faq Modify Get..........");
		UserVO login = (UserVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			if(id.equals("admin")){
				model.addAttribute("CsVO", fservice.read(bno));
				return "/cs/S_faqmod";		
			}else{
				rttr.addFlashAttribute("msg", "fail");
				return "redirect:/cs/faq";
				}
		} else {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/cs/faq";
		}
	}

	@RequestMapping(value = "/S_faqmod", method = RequestMethod.POST)
	public String faqModifyPOST(CsVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("faq Modify Post..........");
		logger.info(vo.toString());

		fservice.modify(vo);

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/cs/faq";
	}
	
	@RequestMapping(value = "/faqremove", method = RequestMethod.POST)
	public String faqRemove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) throws Exception {
		fservice.remove(bno);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/cs/faq";
	}

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qnaGET(@ModelAttribute("cri") CsqnaCriteria cri, Model model) throws Exception {
		logger.info("qna..........");
		model.addAttribute("list", qservice.listCriteria(cri));
		CsqnaPageMaker pageMaker = new CsqnaPageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(qservice.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);
		
		return "/cs/S_qna";
	}

	@RequestMapping(value = "/qnareg", method = RequestMethod.GET)
	public String qnaRegisterGET(HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("qna Register..........");
		
		UserVO login = (UserVO) session.getAttribute("login");
		
		if (login != null) {
			String id = login.getId();
			//System.out.println("아이디 출력 해봅니다. : " + id);
			model.addAttribute("id", id);
			return "/cs/S_qnareg";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/qna";
		}
	}

	@RequestMapping(value = "/S_qnareg", method = RequestMethod.POST)
	public String qnaRegisterPOST(CsqnaVO vo, MessageVO msvo, RedirectAttributes rttr) throws Exception {
		logger.info("qna Register..........");
		logger.info(vo.toString());

		//qservice.regist(vo);
		msvo.setQbno(""+qservice.regist(vo));
		System.out.println("msvo으아아아ㅏ"+msvo.toString());
		
		uservice.AreadQNAmessage(msvo);
		
		System.out.println("찍어 : "+msvo);
		rttr.addFlashAttribute("msg", "regist");

		return "redirect:/cs/qna";
	}

	@RequestMapping(value = "/qnaread", method = RequestMethod.GET)
	public String qnareadGET(@RequestParam("bno") Integer bno, HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("qna read..........");
		
		UserVO login = (UserVO) session.getAttribute("login");
		String pw = "";
		if(qservice.read2(bno).getBpw() != null){
			pw = qservice.read2(bno).getBpw();			
		}
		
		if(!pw.equals("")){
			if (login != null) {
				String id = login.getId();
				String idc = qservice.read2(bno).getUser();
				if(id.equals(idc) || id.equals("admin")){
					String content = qservice.modread(bno).getContent();
					String content2 = content.replace("<", "&lt;"); //HTML 태그를 문자로 인지하게 바꿈
					String content3 = content2.replace("\r\n", "<br>"); //엔터를 <br> 태그로 교체
					String content4 = content3.replace(" ","&nbsp;"); //공백을 &nbsp; 로 변환
					
					model.addAttribute("content", content4);
					model.addAttribute("CsqnaVO", qservice.read(bno));
					session.setAttribute("idc", idc);
					return "/cs/S_qnaread";				
				}else{
					rttr.addFlashAttribute("msg", "fail");
					return "redirect:/cs/qna";
				}
			} else {
				rttr.addFlashAttribute("msg", "fail");
				return "redirect:/cs/qna";
			}	
		}else{
			String content = qservice.modread(bno).getContent();
			String idc = qservice.read2(bno).getUser();
			session.setAttribute("idc", idc);
			String content2 = content.replace("<", "&lt;"); //HTML 태그를 문자로 인지하게 바꿈
			String content3 = content2.replace("\r\n", "<br>"); //엔터를 <br> 태그로 교체
			String content4 = content3.replace(" ","&nbsp;"); //공백을 &nbsp; 로 변환
			
			model.addAttribute("content", content4);
			model.addAttribute("CsqnaVO", qservice.read(bno));
			return "/cs/S_qnaread";
		}
	}

	@RequestMapping(value = "/qremove", method = RequestMethod.POST)
	public String qnaremove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) throws Exception {
		qservice.remove(bno);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/cs/qna";
	}

	@RequestMapping(value = "/qnamod", method = RequestMethod.GET)
	public String qnaModifyGET(HttpSession session, RedirectAttributes rttr, @RequestParam("bno") Integer bno, Model model) throws Exception {
		logger.info("qna Modify Get..........");
		
		UserVO login = (UserVO) session.getAttribute("login");
		
		if (login != null) {
			String id = login.getId();
			String idc = qservice.read2(bno).getUser();
			if(id.equals(idc)||id.equals("admin")){
				model.addAttribute("CsqnaVO", qservice.read2(bno));
				return "/cs/S_qnamod";				
			}else{
				rttr.addFlashAttribute("msg", "fail");
				return "redirect:/cs/qna";
				}
		} else {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/cs/qna";
		}
	}

	@RequestMapping(value = "/S_qnamod", method = RequestMethod.POST)
	public String qnaModifyPOST(CsqnaVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("qna Modify Post..........");
		logger.info(vo.toString());

		qservice.modify(vo);

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/cs/qna";
	}
	
	@RequestMapping(value="/S_qnaread/{bno}", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> bpw(@PathVariable("bno") Integer bno, HttpSession session){
		ResponseEntity<String> entity = null;
		UserVO login = (UserVO) session.getAttribute("login");
		String result = "fail"; //반환해줄 결과값
		try{
			if(login != null){
				if(login.getId().equals(qservice.modread(bno).getUser())){
					result = qservice.modread(bno).getBpw();
				}
			}
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/S_qnaread/pwc/{bno}", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> bpwc(HttpSession session, @PathVariable("bno") Integer bno){
		ResponseEntity<String> entity = null;
		String result = "";
		try{
			UserVO login = (UserVO) session.getAttribute("login");
			if(login!=null){
				if(!login.getId().equals("admin")){
					result = qservice.modread(bno).getBpw();
				}				
			}else{
				result = qservice.modread(bno).getBpw();
			}
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//문> 이용약관
	@RequestMapping(value = "/usage", method = RequestMethod.GET)
	public String usagePersonal() throws Exception {

		return "cs/S_usage";
	}
	
	


	@RequestMapping(value = "/faqreg", method = RequestMethod.GET)
	public String faqRegisterGET(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("faq Register..........");
		
		UserVO login = (UserVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			if(id.equals("admin")){
				return "/cs/S_faqreg";		
			}else{
				rttr.addFlashAttribute("msg", "fail");
				return "redirect:/cs/faq";
				}
		} else {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/cs/faq";
		}
		
	}
	
	@RequestMapping(value = "/S_faqreg", method = RequestMethod.POST)
	public String faqRegisterPOST(CsVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("faq Register..........");
		logger.info(vo.toString());

		fservice.regist(vo);

		rttr.addFlashAttribute("msg", "regist");

		return "redirect:/cs/faq";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String noticeGET(Model model) throws Exception {
		model.addAttribute("list", fservice.noticeListAll());
		
		return "/cs/S_notice";
	}

	@RequestMapping(value = "/noticeread", method = RequestMethod.GET)
	public String noticeReadGET(@RequestParam("bno") Integer bno, Model model) throws Exception {


		String content = fservice.noticeRead(bno).getContent();
		String content2 = content.replace("<", "&lt;"); //HTML 태그를 문자로 인지하게 바꿈
		String content3 = content2.replace("\r\n", "<br>"); //엔터를 <br> 태그로 교체
		String content4 = content3.replace(" ","&nbsp;"); //공백을 &nbsp; 로 변환
		
		model.addAttribute("content", content4);
		model.addAttribute("CsVO", fservice.noticeRead(bno));
		
		return "/cs/S_noticeread";
	}

	@RequestMapping(value = "/noticemod", method = RequestMethod.GET)
	public String noticeModifyGET(@RequestParam("bno") Integer bno, Model model,HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVO login = (UserVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			if(id.equals("admin")){
				model.addAttribute("CsVO", fservice.noticeRead(bno));
				return "/cs/S_noticemod";		
			}else{
				rttr.addFlashAttribute("msg", "fail");
				return "redirect:/cs/notice";
				}
		} else {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/cs/notice";
		}
	}

	@RequestMapping(value = "/S_noticemod", method = RequestMethod.POST)
	public String noticeModifyPOST(CsVO vo, RedirectAttributes rttr) throws Exception {
		fservice.noticeUpdate(vo);

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/cs/notice";
	}
	
	@RequestMapping(value = "/noticeremove", method = RequestMethod.POST)
	public String noticeRemove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) throws Exception {
		fservice.noticeDelete(bno);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/cs/notice";
	}
	
	@RequestMapping(value = "/noticereg", method = RequestMethod.GET)
	public String noticeRegisterGET(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVO login = (UserVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			if(id.equals("admin")){
				return "/cs/S_noticereg";		
			}else{
				rttr.addFlashAttribute("msg", "fail");
				return "redirect:/cs/notice";
				}
		} else {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/cs/notice";
		}
		
	}
	
	@RequestMapping(value = "/S_noticereg", method = RequestMethod.POST)
	public String noticeRegisterPOST(CsVO vo, RedirectAttributes rttr) throws Exception {
		fservice.noticeCreate(vo);

		rttr.addFlashAttribute("msg", "regist");

		return "redirect:/cs/notice";
	}
}