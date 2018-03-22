package com.recruit.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.AdminPageMaker;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.BoardVO;
import com.recruit.domain.CInfoVO;
import com.recruit.domain.CsfaqVO;
import com.recruit.domain.CsqnaCriteria;
import com.recruit.domain.CsqnaPageMaker;
import com.recruit.domain.CsqnaVO;
import com.recruit.domain.RecruitVO;
import com.recruit.service.AdCompanyService;
import com.recruit.service.AmainService;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;
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

	@Inject
	private AdCompanyService cservice;

	@Inject
	private CompanyService pservice;

	@Inject
	private CompanyAjaxService jobService;
	
    @Inject
    private PasswordEncoder passwordEncoder;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainGET(@ModelAttribute("cri") AdminSearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());

		model.addAttribute("list", aservice.listSearchCriteria(cri));

		AdminPageMaker pageMaker = new AdminPageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(aservice.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		
		return "/admin/A_main";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("id") String id, @ModelAttribute("cri") AdminSearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute("BoardVO", aservice.read(id));
		model.addAttribute("reslist", rservice.listAll(id));
		
		return "/admin/A_modify";
	}

	@RequestMapping(value = "/A_modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO vo, AdminSearchCriteria cri, RedirectAttributes rttr) throws Exception {

		logger.info("modify post...........");
		logger.info(vo.toString());

		if(vo.getPw()==""){
			vo.setPw(aservice.readpw(vo));
		}else{
			String encPassword = passwordEncoder.encode(vo.getPw());
			vo.setPw(encPassword);
		}
		
		
		aservice.modify(vo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/admin/main";
	}

	@RequestMapping(value = "/premove", method = RequestMethod.POST)
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) throws Exception {
		aservice.remove(id);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/admin/main";
	}

	@RequestMapping(value = "/amodify", method = RequestMethod.GET)
	public String amodifyGET(Model model) throws Exception {
		model.addAttribute("BoardVO", aservice.aread());
		return "/admin/A_amodify";
	}

	@RequestMapping(value = "/A_amodify", method = RequestMethod.POST)
	public String amodifyPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {

		logger.info("modify post...........");
		logger.info(vo.toString());

		aservice.amodify(vo);

		rttr.addFlashAttribute("msg", "amodify");

		return "redirect:/admin/main";
	}

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faqGET(Model model) throws Exception {
		logger.info("faq..........");
		model.addAttribute("list", fservice.listAll());
		
		return "/admin/A_faq";
	}

	@RequestMapping(value = "/faqreg", method = RequestMethod.GET)
	public String faqRegisterGET(Model model) throws Exception {
		logger.info("faq Register..........");
		
		return "/admin/A_faqreg";
	}

	@RequestMapping(value = "/A_faqreg", method = RequestMethod.POST)
	public String faqRegisterPOST(CsfaqVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("faq Register..........");
		logger.info(vo.toString());

		fservice.regist(vo);

		rttr.addFlashAttribute("msg", "regist");

		return "redirect:/admin/faq";
	}

	@RequestMapping(value = "/sremove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) throws Exception {
		fservice.remove(bno);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/admin/faq";
	}

	@RequestMapping(value = "/faqmod", method = RequestMethod.GET)
	public String faqModifyGET(@RequestParam("bno") Integer bno, Model model) throws Exception {
		logger.info("faq Modify Get..........");
		model.addAttribute("CsfaqVO", fservice.read(bno));
		
		return "/admin/A_faqmod";
	}

	@RequestMapping(value = "/A_faqmod", method = RequestMethod.POST)
	public String faqModifyPOST(CsfaqVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("faq Modify Post..........");
		logger.info(vo.toString());

		fservice.modify(vo);

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/admin/faq";
	}

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qnaGET(@ModelAttribute("cri") CsqnaCriteria cri, Model model) throws Exception {
		logger.info("qna get..........");
		model.addAttribute("list", qservice.listCriteria(cri));
		CsqnaPageMaker pageMaker = new CsqnaPageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(qservice.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);
		
		return "/admin/A_qna";
	}

	@RequestMapping(value = "/qnamod", method = RequestMethod.GET)
	public String qnaModifyGET(@RequestParam("bno") Integer bno, @ModelAttribute("cri") CsqnaCriteria cri, Model model)
			throws Exception {
		logger.info("qna Modify Get..........");
		model.addAttribute("CsqnaVO", qservice.modread(bno));
		
		return "/admin/A_qnamod";
	}

	@RequestMapping(value = "/A_qnamod", method = RequestMethod.POST)
	public String qnaModifyPOST(CsqnaVO vo, CsqnaCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("qna Modify Post..........");
		logger.info(vo.toString());

		qservice.modify(vo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/admin/qna";
	}

	@RequestMapping(value = "/qremove", method = RequestMethod.POST)
	public String qnaremove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) throws Exception {
		fservice.remove(bno);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/admin/qna";
	}

	@RequestMapping(value = "/company", method = RequestMethod.GET)
	public String companyGET(@ModelAttribute("cri") AdminSearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());

		model.addAttribute("list", cservice.listSearchCriteria(cri));

		AdminPageMaker pageMaker = new AdminPageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(cservice.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		
		return "/admin/A_company";
	}

	@RequestMapping(value = "/cmodify", method = RequestMethod.GET)
	public String cmodifyGET(@RequestParam("id") String id, @ModelAttribute("cri") AdminSearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute("BoardVO", cservice.read(id));
		model.addAttribute("recruitList", pservice.RecruitList(id));
		model.addAttribute("CInfoVO", pservice.CompanyInfoRead(id));
		
		return "/admin/A_cmodify";
	}

	@RequestMapping(value = "/A_cmodify", method = RequestMethod.POST)
	public String cmodifyPOST(BoardVO vo, CInfoVO cinfo, AdminSearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		logger.info("cmodify post...........");
		logger.info(vo.toString());

		if(vo.getPw()==""){
			vo.setPw(aservice.readpw(vo));
		}else{
			String encPassword = passwordEncoder.encode(vo.getPw());
			vo.setPw(encPassword);
		}
		
		// System.out.println("controller test1");
		cservice.modify(vo);
		pservice.CompanyInfoModify(cinfo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "modify");

		// System.out.println("controller test2");
		return "redirect:/admin/company";
	}

	@RequestMapping(value = "/rmodify", method = RequestMethod.GET)
	public String rmodifyGET(@RequestParam("id") String id, @RequestParam("bno") int bno,
			@ModelAttribute("cri") AdminSearchCriteria cri, Model model) throws Exception {
		model.addAttribute("BoardVO", cservice.read(id));
		model.addAttribute("CInfoVO", pservice.CompanyInfoRead(id));
		model.addAttribute("recruitList", pservice.RecruitList(id));
		model.addAttribute("jobgroupList", jobService.jobgroupList());
		model.addAttribute("codeList", pservice.CodeList());
		model.addAttribute("regionList", pservice.RegionList());
		model.addAttribute("RecruitVO", pservice.RecruitInfoRead3(bno));

		return "/admin/A_rmodify";
	}

	@RequestMapping(value = "/A_rmodify", method = RequestMethod.POST)
	public String rmodifyPOST(CInfoVO cinfo, RecruitVO recvo, AdminSearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		logger.info("cmodify post...........");

		// System.out.println("controller test1");
		cservice.modify(recvo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/admin/company";
	}

	@RequestMapping(value = "/rremove", method = RequestMethod.POST)
	public String rremove(@RequestParam("id") String id, @RequestParam("bno") int bno, RedirectAttributes rttr)
			throws Exception {
		cservice.remove(bno);

		rttr.addAttribute("id", id);
		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/admin/cmodify";
	}

	@RequestMapping(value = "/cremove", method = RequestMethod.POST)
	public String cremove(@RequestParam("id") String id, RedirectAttributes rttr) throws Exception {
		aservice.remove(id);

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/admin/company";
	}
	
}
