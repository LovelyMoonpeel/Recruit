package com.recruit.controller;

import javax.inject.Inject;

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

	@RequestMapping(value = "/S_faq", method = RequestMethod.GET)
	public void faqGET(Model model) throws Exception {
		logger.info("faq..........");
		model.addAttribute("list", fservice.listAll());
	}

	@RequestMapping(value = "/S_faqread", method = RequestMethod.GET)
	public void faqreadGET(@RequestParam("bno") Integer bno, Model model) throws Exception {
		logger.info("faqread..........");
		model.addAttribute("CsfaqVO", fservice.read(bno));
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

		return "redirect:/cs/S_faq";
	}

	@RequestMapping(value = "/S_qna", method = RequestMethod.GET)
	public void qnaGET(@ModelAttribute("cri") CsqnaCriteria cri, Model model) throws Exception {
		logger.info("qna..........");
		model.addAttribute("list", qservice.listCriteria(cri));
		CsqnaPageMaker pageMaker = new CsqnaPageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(qservice.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/S_qnareg", method = RequestMethod.GET)
	public void qnaRegisterGET(Model model) throws Exception {
		logger.info("qna Register..........");
	}

	@RequestMapping(value = "/S_qnareg", method = RequestMethod.POST)
	public String qnaRegisterPOST(CsqnaVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("qna Register..........");
		logger.info(vo.toString());

		qservice.regist(vo);

		rttr.addFlashAttribute("msg", "regist");

		return "redirect:/cs/S_qna";
	}

	@RequestMapping(value = "/S_qnaread", method = RequestMethod.GET)
	public void qnareadGET(@RequestParam("bno") Integer bno, Model model) throws Exception {
		logger.info("qna read..........");
		model.addAttribute("CsqnaVO", qservice.read(bno));
	}

	@RequestMapping(value = "/qremove", method = RequestMethod.POST)
	public String qnaremove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) throws Exception {
		qservice.remove(bno);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/cs/S_qna";
	}

	@RequestMapping(value = "/S_qnamod", method = RequestMethod.GET)
	public void qnaModifyGET(@RequestParam("bno") Integer bno, Model model) throws Exception {
		logger.info("qna Modify Get..........");
		model.addAttribute("CsqnaVO", qservice.read(bno));
	}

	@RequestMapping(value = "/S_qnamod", method = RequestMethod.POST)
	public String qnaModifyPOST(CsqnaVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("qna Modify Post..........");
		logger.info(vo.toString());

		qservice.modify(vo);

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/cs/S_qna";
	}
	
	@RequestMapping(value="/S_qnaread/{bno}", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> bpw(@PathVariable("bno") Integer bno){
		ResponseEntity<String> entity = null;
		
		try{
//			String dbpw = qservice.modread(bno).getBpw();
//			String inputpw = bpw;
//			System.out.println("bpw 출력 : "+ inputpw);
			String result = qservice.modread(bno).getBpw();
//			System.out.println("비밀번호는 무엇 ? "+result);
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/S_qnaread/pwc/{bno}", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> bpwc(@PathVariable("bno") Integer bno){
		ResponseEntity<String> entity = null;
		
		try{
			String result = qservice.modread(bno).getBpw();
			System.out.println("결과 출력 : "+result);
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}