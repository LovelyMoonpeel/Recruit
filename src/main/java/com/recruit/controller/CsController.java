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

import com.recruit.domain.BoardVO;
import com.recruit.domain.CsfaqVO;
import com.recruit.domain.CsqnaCriteria;
import com.recruit.domain.CsqnaPageMaker;
import com.recruit.domain.CsqnaVO;
import com.recruit.service.CsfaqService;
import com.recruit.service.CsqnaService;

@Controller
@RequestMapping("/cs/*")
public class CsController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private CsfaqService fservice;

	@Inject
	private CsqnaService qservice;
	
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
		model.addAttribute("CsfaqVO", fservice.read(bno));
		
		return "/cs/S_faqread";
	}

	@RequestMapping(value = "/S_faqmod", method = RequestMethod.GET)
	public void faqModifyGET(@RequestParam("bno") Integer bno, Model model) throws Exception {
		logger.info("faq Modify Get..........");
		model.addAttribute("CsfaqVO", fservice.read(bno));
	}

	@RequestMapping(value = "/S_faqmod", method = RequestMethod.POST)
	public String faqModifyPOST(CsfaqVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("faq Modify Post..........");
		logger.info(vo.toString());

		fservice.modify(vo);

		rttr.addFlashAttribute("msg", "modify");

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
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		
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
	public String qnaRegisterPOST(CsqnaVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("qna Register..........");
		logger.info(vo.toString());

		qservice.regist(vo);

		rttr.addFlashAttribute("msg", "regist");

		return "redirect:/cs/qna";
	}

	@RequestMapping(value = "/qnaread", method = RequestMethod.GET)
	public String qnareadGET(@RequestParam("bno") Integer bno, HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("qna read..........");
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		String pw = "";
		pw = qservice.read2(bno).getBpw();
		
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
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		
		if (login != null) {
			String id = login.getId();
			String idc = qservice.read2(bno).getUser();
			if(id.equals(idc)){
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
		BoardVO login = (BoardVO) session.getAttribute("login");
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
			BoardVO login = (BoardVO) session.getAttribute("login");
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

}