package com.recruit.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.AdminPageMaker;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.AmainVO;
import com.recruit.domain.CsfaqVO;
import com.recruit.domain.CsqnaCriteria;
import com.recruit.domain.CsqnaPageMaker;
import com.recruit.domain.CsqnaVO;
import com.recruit.service.AmainService;
import com.recruit.service.CsfaqService;
import com.recruit.service.CsqnaService;
import com.recruit.service.ResumeService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AmainService aservice;

	@Inject
	private ResumeService rservice;

	@Inject
	private CsfaqService fservice;

	@Inject
	private CsqnaService qservice;

	@RequestMapping(value = "/A_main", method = RequestMethod.GET)
	public void mainGET(@ModelAttribute("cri") AdminSearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());

		// model.addAttribute("list", aservice.listCriteria(cri));
		model.addAttribute("list", aservice.listSearchCriteria(cri));

		AdminPageMaker pageMaker = new AdminPageMaker();
		pageMaker.setCri(cri);

		// pageMaker.setTotalCount(aservice.listCountCriteria(cri));
		pageMaker.setTotalCount(aservice.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/A_modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("id") String id, @ModelAttribute("cri") AdminSearchCriteria cri, Model model)
			throws Exception {
		// model.addAttribute(rservice.read(id));
		// System.out.println(id);
		// System.out.println(rservice.listAll(id));
		model.addAttribute("AmainVO", aservice.read(id));
		model.addAttribute("reslist", rservice.listAll(id));
	}

	@RequestMapping(value = "/A_modify", method = RequestMethod.POST)
	public String modifyPOST(AmainVO vo, AdminSearchCriteria cri, RedirectAttributes rttr) throws Exception {

		logger.info("modify post...........");
		logger.info(vo.toString());

		aservice.modify(vo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/admin/A_main";
	}

	@RequestMapping(value = "/premove", method = RequestMethod.POST)
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) throws Exception {
		aservice.remove(id);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/admin/A_main";
	}

	@RequestMapping(value = "/A_amodify", method = RequestMethod.GET)
	public void amodifyGET(Model model) throws Exception {
		model.addAttribute("AmainVO", aservice.aread());
	}

	@RequestMapping(value = "/A_amodify", method = RequestMethod.POST)
	public String amodifyPOST(AmainVO vo, RedirectAttributes rttr) throws Exception {

		logger.info("modify post...........");
		logger.info(vo.toString());

		aservice.amodify(vo);

		rttr.addFlashAttribute("msg", "amodify");

		return "redirect:/admin/A_main";
	}

	@RequestMapping(value = "/A_faq", method = RequestMethod.GET)
	public void faqGET(Model model) throws Exception {
		logger.info("faq..........");
		model.addAttribute("list", fservice.listAll());
	}

	@RequestMapping(value = "/A_faqreg", method = RequestMethod.GET)
	public void faqRegisterGET(Model model) throws Exception {
		logger.info("faq Register..........");
	}

	@RequestMapping(value = "/A_faqreg", method = RequestMethod.POST)
	public String faqRegisterPOST(CsfaqVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("faq Register..........");
		logger.info(vo.toString());

		fservice.regist(vo);

		rttr.addFlashAttribute("msg", "regist");

		return "redirect:/admin/A_faq";
	}

	@RequestMapping(value = "/sremove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) throws Exception {
		fservice.remove(bno);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/admin/A_faq";
	}

	@RequestMapping(value = "/A_faqmod", method = RequestMethod.GET)
	public void faqModifyGET(@RequestParam("bno") Integer bno, Model model) throws Exception {
		logger.info("faq Modify Get..........");
		model.addAttribute("CsfaqVO", fservice.read(bno));
	}

	@RequestMapping(value = "/A_faqmod", method = RequestMethod.POST)
	public String faqModifyPOST(CsfaqVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("faq Modify Post..........");
		logger.info(vo.toString());

		fservice.modify(vo);

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/admin/A_faq";
	}

	@RequestMapping(value = "/A_qna", method = RequestMethod.GET)
	public void qnaGET(@ModelAttribute("cri") CsqnaCriteria cri, Model model) throws Exception {
		logger.info("qna get..........");
		// model.addAttribute("list", qservice.listAll());
		model.addAttribute("list", qservice.listCriteria(cri));
		CsqnaPageMaker pageMaker = new CsqnaPageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(qservice.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/A_qnamod", method = RequestMethod.GET)
	public void qnaModifyGET(@RequestParam("bno") Integer bno, Model model) throws Exception {
		logger.info("qna Modify Get..........");
		model.addAttribute("CsqnaVO", qservice.modread(bno));
	}

	@RequestMapping(value = "/A_qnamod", method = RequestMethod.POST)
	public String qnaModifyPOST(CsqnaVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("qna Modify Post..........");
		logger.info(vo.toString());

		qservice.modify(vo);

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/admin/A_qna";
	}

	@RequestMapping(value = "/qremove", method = RequestMethod.POST)
	public String qnaremove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) throws Exception {
		fservice.remove(bno);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/admin/A_qna";
	}
}



//하하하하 테스트