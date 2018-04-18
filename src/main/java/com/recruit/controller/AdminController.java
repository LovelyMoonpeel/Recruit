package com.recruit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.AdminPageMaker;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.BoardVO;
import com.recruit.domain.CInfoVO;
import com.recruit.domain.CsfaqVO;
import com.recruit.domain.CsqnaCriteria;
import com.recruit.domain.CsqnaPageMaker;
import com.recruit.domain.CsqnaReplyVO;
import com.recruit.domain.CsqnaVO;
import com.recruit.domain.PTelVO;
import com.recruit.domain.PWebSiteVO;
import com.recruit.domain.RLicenseVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.ResumeCareerVO;
import com.recruit.domain.ResumeEduVO;
import com.recruit.domain.ResumeLanguageVO;
import com.recruit.domain.ResumeVO;
import com.recruit.service.AdCompanyService;
import com.recruit.service.AdminService;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;
import com.recruit.service.CsfaqService;
import com.recruit.service.CsqnaService;
import com.recruit.service.PTelService;
import com.recruit.service.PUserService;
import com.recruit.service.PWebSiteService;
import com.recruit.service.RLicenseService;
import com.recruit.service.ResumeCareerService;
import com.recruit.service.ResumeEduService;
import com.recruit.service.ResumeLanguageService;
import com.recruit.service.ResumeService;
import com.recruit.util.MediaUtils;
import com.recruit.util.S3Util;
import com.recruit.util.UploadFileUtils;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminService aservice;

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
	private PUserService puservice;
	
	@Inject
	private PTelService Telservice;
	
	@Inject
	private PWebSiteService Webservice;
	
	@Inject
	private ResumeEduService Eduservice;
	
	@Inject
	private ResumeCareerService Careerservice;
	
	@Inject
	private RLicenseService Licenseservice;
	
	@Inject
	private ResumeLanguageService Langservice;
	
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

	@RequestMapping(value = "/pmodify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("id") String id, @ModelAttribute("cri") AdminSearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute("BoardVO", aservice.read(id));
		model.addAttribute("reslist", rservice.selectRList(id));
		
		return "/admin/A_pmodify";
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

		if(vo.getPw()==""){
			vo.setPw(aservice.readpw(vo));
		}else{
			String encPassword = passwordEncoder.encode(vo.getPw());
			vo.setPw(encPassword);
		}
		
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
//		System.out.println(qservice.listCriteria(cri));
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

		if(vo.getBpw().equals("")){
			CsqnaVO bpw = qservice.read2(vo.getBno());
			vo.setBpw(bpw.getBpw());
		}
		qservice.modify(vo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addFlashAttribute("msg", "modify");

		return "redirect:/admin/qna";
	}

	@RequestMapping(value = "/qremove", method = RequestMethod.POST)
	public String qnaremove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) throws Exception {
		qservice.remove(bno);

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

		System.out.println("test1");
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
	
	@RequestMapping(value = "/resmodify", method = RequestMethod.GET)
	public String resmodifyGET(@RequestParam("bno") int bno, Model model) throws Exception {


		String id = rservice.readROne(bno).getUserid();
		model.addAttribute("ResumeVO", rservice.readROne(bno));
		model.addAttribute("PUserVO", puservice.selectPUser(id));

		model.addAttribute("PWebSiteVOlist", Webservice.selectPWebSiteList(bno));
		model.addAttribute("PTelVOlist", Telservice.selectPTelList(bno));
		model.addAttribute("RLicenselist", Licenseservice.selectRLicenseList(bno));
		model.addAttribute("RLanguagelist", Langservice.selectResumeLanguageList(bno));

		model.addAttribute("eduVOlist", Eduservice.readResumeEduList(bno));
		model.addAttribute("careerVOList", Careerservice.readResumeCareerList(bno));

		model.addAttribute("CodeVOlist", rservice.selectRCodeList());
		model.addAttribute("JobGroupVOlist", rservice.selectRGPList());
		model.addAttribute("RegionVOlist", rservice.selectRegionList());

		return "/admin/A_resmodify";
	}
	
	@RequestMapping(value = "/A_resmodify", method = RequestMethod.POST)
	public String RmodifyPOST(Integer bno, PTelVO ptvo, PWebSiteVO pwvo, ResumeLanguageVO plavo,
			RLicenseVO plivo, ResumeEduVO resumeEduVO, ResumeCareerVO resumeCareerVO, ResumeVO resume, Model model, RedirectAttributes rttr)
			throws Exception {

		String id = rservice.readROne(bno).getUserid();
		System.out.println("아이디 : "+id);
		Telservice.updateTList(bno, ptvo.getPtelvolist());
		Webservice.updateWList(bno, pwvo.getPwebsitesvolist());
		Langservice.updateLList(bno, plavo.getRlangvolist());
		Licenseservice.updateLicenseList(bno, plivo.getRlicensevolist());

		rservice.updateROne(resume);

		int resumenum = resume.getBno();
		Eduservice.changeResumeEduList(resumenum, resumeEduVO.getListEdu());
		Careerservice.changeResumeCareerList(resumenum, resumeCareerVO.getListCareer());
		rttr.addFlashAttribute("msg", "resume_mod");

		return "redirect:/admin/pmodify?id=" + id;
	}
	
	@RequestMapping(value="resremove", method = RequestMethod.POST)
	public String RremovePOST(@RequestParam("bno") int bno, RedirectAttributes rttr)throws Exception{
		String id = rservice.readROne(bno).getUserid();
		int[] bno2 = {bno};
		rservice.deleteROne(bno2);
		rttr.addFlashAttribute("msg","remove");
		return "redirect:/admin/pmodify?id="+id;
	}
	
	S3Util s3 = new S3Util();
	String bucketName = "matchingbucket";
	private String uploadPath = "matching/resume";
	private String C_uploadPath = "matching/company";
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contetnType: " + file.getContentType());
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection uCon = null;
		System.out.println("FILE NAME: " + fileName);

		try {
			HttpHeaders headers = new HttpHeaders();
			URL url;

			try {
				url = new URL(s3.getFileURL(bucketName, uploadPath + fileName));
				System.out.println(url);
				uCon = (HttpURLConnection) url.openConnection();
				in = uCon.getInputStream(); // 이미지를 불러옴
			} catch (Exception e) {
				url = new URL(s3.getFileURL(bucketName, "NoImage.png"));
				uCon = (HttpURLConnection) url.openConnection();
				in = uCon.getInputStream();
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (FileNotFoundException effe) {
			System.out.println("File Not found Exception");
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + "/NoImage.png");

			headers.setContentType(mType);

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		logger.info("delete file: " + fileName);

		try {
			s3.fileDelete(bucketName, uploadPath + fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/C_uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> C_uploadAjax(MultipartFile file) throws Exception {

		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contetnType: " + file.getContentType());
		return new ResponseEntity<>(UploadFileUtils.uploadFile(C_uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping("/C_displayFile")
	public ResponseEntity<byte[]> C_displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection uCon = null;
		System.out.println("FILE NAME: " + fileName);

		try {
			HttpHeaders headers = new HttpHeaders();
			URL url;

			try {
				url = new URL(s3.getFileURL(bucketName, C_uploadPath + fileName));
				System.out.println(url);
				uCon = (HttpURLConnection) url.openConnection();
				in = uCon.getInputStream(); // 이미지를 불러옴
			} catch (Exception e) {
				url = new URL(s3.getFileURL(bucketName, "NoImage.png"));
				uCon = (HttpURLConnection) url.openConnection();
				in = uCon.getInputStream();
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (FileNotFoundException effe) {
			System.out.println("File Not found Exception");
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + "/NoImage.png");

			headers.setContentType(mType);

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/C_deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> C_deleteFile(String fileName) {
		logger.info("delete file: " + fileName);

		try {
			s3.fileDelete(bucketName, uploadPath + fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chartGET(Model model) throws Exception{
		model.addAttribute("P_member",aservice.pcount());
		model.addAttribute("C_member", aservice.ccount());
		model.addAttribute("weekRecruit", aservice.count_recruit());
		model.addAttribute("weekJobgroup",aservice.jobgroup_recruit());
		model.addAttribute("weekJobgroup2", aservice.jobgroup2_recruit());
		model.addAttribute("weekPerson", aservice.weekPerson());
		model.addAttribute("weekCompany", aservice.weekCompany());
		return "/admin/A_chart";
	}
	
	@RequestMapping(value = "/emailAuth", method = RequestMethod.PUT)
	public ResponseEntity<String> Pemailauth(@RequestBody BoardVO vo){
		ResponseEntity<String> entity = null;
		try{
			aservice.emailauth(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
