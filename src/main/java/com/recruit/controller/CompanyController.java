package com.recruit.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.CInfoVO;
import com.recruit.domain.RecruitVO;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;

@Controller
@RequestMapping("/rpjt/*")
public class CompanyController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

	@Inject
	private CompanyService service;
	@Inject
	private CompanyAjaxService jobService;

	

	  @RequestMapping(value = "/C_modify", method = RequestMethod.GET)
	  public void modifyGET(String id, Model model) throws Exception {

	    model.addAttribute(service.CompanyInfoRead(id));
	  }
	  @RequestMapping(value = "/C_modify", method = RequestMethod.POST)
	  public String modifyPOST(CInfoVO CInfo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		  
		  
	    String establish;
	    establish = request.getParameter("establish");
	    
	    CInfo.setEstablish(establish);
	    
	
	    service.CompanyInfoModify(CInfo);

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/rpjt/C_index?id="+CInfo.getId(); 
	  }
	
	  @RequestMapping(value = "/C_manage", method = RequestMethod.GET)
	  public void manage(String id, Model model) throws Exception {
		  
		  model.addAttribute(service.CompanyInfoRead(id));
		  model.addAttribute("recruitList", service.RecruitList(id));
	  
	  }
	  @RequestMapping(value = "/C_detail", method = RequestMethod.GET)
	  public String detail(Model model) throws Exception {

	   return "rpjt/C_detail";
	  }

	  @RequestMapping(value = "/C_write", method = RequestMethod.GET)
	  public void writeGET(String id, Model model) throws Exception {

		  
	    model.addAttribute(service.CompanyInfoRead(id));
	    
	    model.addAttribute("jobgroupList", jobService.jobgroupList());
	    model.addAttribute("codeList", service.CodeList());
	    model.addAttribute("regionList", service.RegionList());
	    
	  }
	  
	  
	  @RequestMapping(value = "/C_write", method = RequestMethod.POST)
	  public String writePOST(RecruitVO writeRecruit, RedirectAttributes rttr) throws Exception {
		  logger.info("write Register..........");
		  logger.info(writeRecruit.toString());

			service.RecruitWrite(writeRecruit);

			rttr.addFlashAttribute("msg", "regist");

		  
		  return "redirect:/rpjt/C_index?id=park";
	  }

	  @RequestMapping(value = "/C_index", method = RequestMethod.GET)
	  public void read(String id, Model model) throws Exception {

	    model.addAttribute(service.CompanyInfoRead(id));
		
	  }
	  
	  @RequestMapping(value = "/test", method = RequestMethod.GET)
	  public void read(int recruitNum, Model model) throws Exception {

		  
	  
	  }

		@RequestMapping(value = "/C_recruitInfo", method = RequestMethod.GET)
		  public void readRecruit(String id, int recruitNum, Model model) throws Exception {


			
			//service.RecruitInfoRead(recruitNum);
			System.out.println("컨트롤러에서 테스트"+service.RecruitInfoRead(recruitNum));
			model.addAttribute("CInfoVO", service.CompanyInfoRead(id));
		    model.addAttribute("RecruitVO", service.RecruitInfoRead(recruitNum));
		   
		  }
		
		@RequestMapping(value = "C_recom", method = RequestMethod.GET)
		  public void readRecom(String id, Model model, RedirectAttributes rttr) throws Exception {

			  model.addAttribute(service.CompanyInfoRead(id));
			  System.out.println("컨트롤러 : " +id);
			  
			  
			  model.addAttribute("recruitList", service.RecruitList(id));
		
			  
		  }
	  
	  
	

}