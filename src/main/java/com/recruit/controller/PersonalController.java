package com.recruit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.PTelVO;
import com.recruit.domain.PUserVO;
import com.recruit.domain.PWebSiteVO;
import com.recruit.domain.RLicenseVO;
import com.recruit.domain.ResumeCareerVO;
import com.recruit.domain.ResumeEduVO;
import com.recruit.domain.ResumeLanguageVO;
import com.recruit.domain.ResumeVO;
import com.recruit.service.BoardService;
import com.recruit.service.CRecruitService;
import com.recruit.service.PTelService;
import com.recruit.service.PUserService;
import com.recruit.service.PWebSiteService;
import com.recruit.service.RLicenseService;
import com.recruit.service.ResumeCareerService;
import com.recruit.service.ResumeEduService;
import com.recruit.service.ResumeLanguageService;
import com.recruit.service.ResumeService;
import com.recruit.util.MediaUtils;
import com.recruit.util.UploadFileUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/personal/*")
public class PersonalController {
	// p194 앞 뒤로
	private static final Logger logger = LoggerFactory.getLogger(PersonalController.class);

	@Inject
	private BoardService boardservice;

	@Inject
	private PUserService service;

	@Inject
	private CRecruitService Cservice;

	@Inject
	private ResumeService Rservice;

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

	// 개인정보관리
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexGET(Model model) throws Exception {
		logger.info("index GET, 개인정보 확인");

		PUserVO PUser = new PUserVO();
		PUser.setId("jin3");// 이거는 로그인해서 id받아오도록 로그인 완성되면 합치면서 수정
		// ResumeVO의 가장

		model.addAttribute(service.selectPUser(PUser.getId()));

		return "personal/P_index";
	}

	// 개인정보수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String indexPOST(@RequestParam("id") String id, Model model) throws Exception {
		// 수정하는 페이지
		logger.info("index에서 넘겨받은 id" + id);
		logger.info(service.selectPUser(id).toString());
		model.addAttribute("PUserVO", service.selectPUser(id));
		return "personal/P_modify";
	}

	// 수정한거 db로 전달하는 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String indexPOST(PUserVO PUser, Model model, RedirectAttributes rttr) throws Exception {
		logger.info("index POST, 개인정보 수정");
		logger.info(PUser.toString());

		service.updatePUser(PUser);
		model.addAttribute("result", "success");
		rttr.addFlashAttribute("result", "success");

		return "redirect:/personal/index"; // redirect는 controller
	}

	// 이력서 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET(PUserVO puser, Model model) throws Exception {
		// public String writeGET(@RequestParam("id") String id, PUserVO puser,
		// Model model) throws Exception {
		System.out.println("write GET controller");
		PUserVO PUser = service.selectPUser("mely");
		System.out.println("puser" + PUser);
		model.addAttribute("PUserVO", PUser);
		// model.addAttribute("codeList", Cservice.CodeList());
		// 코드 테이블 가져오기
		return "personal/P_write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(String id, String file, PUserVO puser, PTelVO ptvo, PWebSiteVO pwvo, RLicenseVO plivo,
			ResumeLanguageVO plavo, ResumeVO resume, Model model) throws Exception {
		// public String writePOST(String id, String file, PUserVO puser,
		// ResumeLanguageVO plavo, ResumeVO resume, Model model) throws
		// Exception {
		System.out.println("write POST controller");

		// System.out.println("id값 뭐받아오냐" + id);
		System.out.println("write get에서 받아오는 puser" + puser);

		System.out.println("file: " + file);

		int bno = Rservice.createROne(resume, puser);
		// Rservice.readRLastCreatedOne(); 생성한 후 마지막으로 생성한 PK가져오기가 포함
		System.out.println("레주메 정보 : " + resume.toString());

		System.out.println(bno + "ptvolist" + ptvo.getPtelvolist().toString());
		Telservice.createTList(bno, ptvo.getPtelvolist());

		System.out.println(bno + "pwebsitesvolist" + pwvo.getPwebsitesvolist().toString());
		Webservice.createWList(bno, pwvo.getPwebsitesvolist());

		System.out.println(bno + "rlicensevolist" + plivo.getRlicensevolist().toString());
		Licenseservice.createLicenseList(bno, plivo.getRlicensevolist());

		System.out.println(bno + "rlangvolist" + plavo.getRlangvolist().toString());
		Langservice.createRLanguageList(bno, plavo.getRlangvolist());

		// Rservice.updateROne(resume);

		return "redirect:/personal/detail?bno=" + bno + "";
	}

	// 이력서 하나 읽기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String modifyGET(int bno, Model model) throws Exception {

		PUserVO PUser = new PUserVO();
		PUser.setId("jin3");// 이거는 로그인해서 id받아오도록 로그인 완성되면 합치면서 수정

		model.addAttribute("PUserVO", service.selectPUser(PUser.getId()));
		model.addAttribute("ResumeVO", Rservice.readROne(bno));

		model.addAttribute("PTellist", Telservice.selectPTelList(bno));
		model.addAttribute("RLicenselist", Licenseservice.selectRLicenseList(bno));
		model.addAttribute("RLanguagelist", Langservice.selectResumeLanguageList(bno));
		model.addAttribute("PWebSitelist", Webservice.selectPWebSiteList(bno));

		return "personal/P_detail";
	}

	// 선택한 이력서 수정하는 페이지
	@RequestMapping(value = "/Rmodify", method = RequestMethod.GET)
	public String RmodifyPOST(String id, Integer bno, Model model) throws Exception {
		// 수정하는 페이지
		System.out.println("Rmodify GET Controller");
		model.addAttribute("PUserVO", service.selectPUser("jin3"));
		model.addAttribute("ResumeVO", Rservice.readROne(bno));
		System.out.println("get bno" + bno);

		model.addAttribute("PWebSiteVOlist", Webservice.selectPWebSiteList(bno));
		model.addAttribute("PTelVOlist", Telservice.selectPTelList(bno));
		model.addAttribute("RLicenselist", Licenseservice.selectRLicenseList(bno));
		model.addAttribute("RLanguagelist", Langservice.selectResumeLanguageList(bno));

		// r.code 03/13
		model.addAttribute("bno", bno);

		List<ResumeEduVO> resumeEduVOList = Eduservice.readResumeEduList(bno);
		int num = resumeEduVOList.size();
		for (int i = 0; i < num; i++) {
			System.out.println("Personal test: " + resumeEduVOList.get(i));
		}
		model.addAttribute("eduVOlist", resumeEduVOList);

		List<ResumeCareerVO> resumeCareerVOList = Careerservice.readResumeCareerList(bno);
		num = resumeCareerVOList.size();
		for (int i = 0; i < num; i++) {
			System.out.println("Personal test: " + resumeCareerVOList.get(i));
		}
		model.addAttribute("careerVOList", resumeCareerVOList);
		// end of r.code 03/13

		return "personal/P_Rmodify";
	}

	// 수정한 이력서 db로 전달하는 페이지
	@RequestMapping(value = "/Rmodify", method = RequestMethod.POST)
	public String RmodifyPOST(String id, Integer bno, PTelVO ptvo, PWebSiteVO pwvo, ResumeLanguageVO plavo,
			RLicenseVO plivo, ResumeVO resume, ResumeEduVO resumeEduVO, ResumeCareerVO resumeCareerVO, Model model,
			RedirectAttributes rttr) throws Exception {

		System.out.println("Rmodify POST Controller");

		System.out.println(bno + " 으으으" + ptvo.getPtelvolist().toString());

		Telservice.updateTList(bno, ptvo.getPtelvolist());
		// Rmodify에 rid값 줘야함
		Webservice.updateWList(bno, pwvo.getPwebsitesvolist());

		System.out.println(bno + " 으아악" + plavo.getRlangvolist().toString());
		Langservice.updateLList(bno, plavo.getRlangvolist());

		System.out.println(bno + "라이센스 으아악" + plivo.getRlicensevolist().toString());
		Licenseservice.updateLicenseList(bno, plivo.getRlicensevolist());
		Rservice.updateROne(resume);

		// r.code 03/14
		System.out.println("r.code");
		System.out.println(resume);

		// int num = resumeEduVO.getListEdu().size();
		// System.out.println("r: " + resumeEduVO.getListEdu().get(i));

		// r.code 03/15 : update edu & career list in DB
		int resumenum = resume.getBno();
		Eduservice.changeResumeEduList(resumenum, resumeEduVO.getListEdu());
		Careerservice.changeResumeCareerList(resumenum, resumeCareerVO.getListCareer());
		// end of r.code

		logger.info("index POST, 개인정보 수정");
		// logger.info(PUser.toString());

		System.out.println(resume.toString());
		int bno1 = resume.getBno();
		System.out.println("bno" + bno1);
		Rservice.updateROne(resume);
		model.addAttribute("result", "success");

		// rttr.addFlashAttribute("result", "success");
		rttr.addFlashAttribute("bno", "success");

		return "redirect:/personal/detail?bno=" + bno + ""; // redirect는
	}

	// 이력서 관리 (리스트)
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String manageGET(Model model) throws Exception {
		System.out.println("manage GET Controller");
		String id = "jin3";
		model.addAttribute("ResumeVOList", Rservice.selectRList(id));
		model.addAttribute("PUserVO", service.selectPUser(id));

		return "personal/P_manage";
	}

	@RequestMapping(value = "/Rremove", method = RequestMethod.POST)
	public String RremovePOST(Integer bno, String id, Model model, RedirectAttributes rttr) throws Exception {
		System.out.println("Rremove POST Controller");

		Rservice.deleteROne(bno);
		// model.addAttribute(service.selectPUser(id));
		// rttr.addFlashAttribute("result", "success");
		return "redirect:/personal/manage";
	}

	// 추천채용공고
	@RequestMapping(value = "/recom", method = RequestMethod.GET)
	public String recomGET(@RequestParam("id") String id, Model model) throws Exception {
		System.out.println("recom GET Controller");

		model.addAttribute("PUserVO", service.selectPUser(id));

		return "personal/P_recom";
	}

	// 관심채용공고
	@RequestMapping(value = "/favor", method = RequestMethod.GET)
	public String favorGET(@RequestParam("id") String id, Model model) throws Exception {
		logger.info("favor GET, 관심채용공고 확인");
		System.out.println("관심채용공고 누구꺼냐" + id);

		model.addAttribute("CRecruitVOList", Cservice.selectCRList(id));
		model.addAttribute("PUserVO", service.selectPUser(id));

		return "personal/P_favor";
	}
	// 지원현황리스트

	@RequestMapping(value = "/applied", method = RequestMethod.GET)
	public String appliedGET(@RequestParam("id") String id, Model model) throws Exception {
		// private CRecruitService Cservice;
		model.addAttribute("CRecruitVOList", Cservice.selectAPList(id));
		model.addAttribute("PUserVO", service.selectPUser(id));
		return "personal/P_applied";
	}
	////// IMG UPLOAD/////////////img
	////// upload/////////////////////////////////////////////////////////////

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {

	}

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
	@RequestMapping(value = "/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("FILE NAME : " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	/*
	 * if(($'#birth').val()==''){ ($'#birth').val("0000-00-00"); }
	 */

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {

		System.out.println(fileName);
		System.out.println("deleteFile POST");

		logger.info("delete file : " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {
			System.out.println("if 문 안으로 들어왔다.");
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	@RequestMapping(value = "/example", method = RequestMethod.GET)
	public String exmapleGET(Model model) throws Exception {
		int bno = 1;
		PUserVO PUser = new PUserVO();
		PUser.setId("jin3");// 이거는 로그인해서 id받아오도록 로그인 완성되면 합치면서 수정

		model.addAttribute("PUserVO", service.selectPUser(PUser.getId()));
		model.addAttribute("ResumeVO", Rservice.readROne(bno));

		model.addAttribute("PTellist", Telservice.selectPTelList(bno));
		model.addAttribute("RLicenselist", Licenseservice.selectRLicenseList(bno));
		model.addAttribute("RLanguagelist", Langservice.selectResumeLanguageList(bno));
		model.addAttribute("PWebSitelist", Webservice.selectPWebSiteList(bno));

		return "personal/P_example";
	}
}