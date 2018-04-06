package com.recruit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.BoardVO;
import com.recruit.domain.PTelVO;
import com.recruit.domain.PUserVO;
import com.recruit.domain.PWebSiteVO;
import com.recruit.domain.RLicenseVO;
import com.recruit.domain.ResumeCareerVO;
import com.recruit.domain.ResumeEduVO;
import com.recruit.domain.ResumeLanguageVO;
import com.recruit.domain.ResumeVO;
import com.recruit.service.CRecruitService;
import com.recruit.service.CompanyService;
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

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/personal/*")
public class PersonalController {
	// p194 앞 뒤로
	private static final Logger logger = LoggerFactory.getLogger(PersonalController.class);

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

	@Inject
	private PasswordEncoder passwordEncoder;

	@Inject
	private CompanyService parkService;

	// 개인정보관리
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexGET(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		logger.info("index GET, 개인정보 확인");

		// j.code 세션수정03/21
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			System.out.println("아이디 출력 해봅니다. : " + id);
			model.addAttribute(service.selectPUser(id));
			return "personal/P_index";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	// 개인정보수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String indexPOST(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		// 수정하는 페이지

		// j.code 세션수정03/21
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			model.addAttribute("PUserVO", service.selectPUser(id));
			return "personal/P_modify";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	// 수정한거 db로 전달하는 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String indexPOST(PUserVO PUser, Model model) throws Exception {
		logger.info("index POST, 개인정보 수정");

		service.updatePUser(PUser);

		model.addAttribute("result", "success");

		return "redirect:/personal/index"; // redirect는 controller
	}

	// 민경
	@RequestMapping(value = "/pwmodify", method = RequestMethod.POST)
	public ResponseEntity<String> pwPOST(@RequestBody PUserVO PUser, HttpSession session, Model model)
			throws Exception {
		logger.info("index POST, 개인정보 수정");
		ResponseEntity<String> entity = null;
		BoardVO login = (BoardVO) session.getAttribute("login");

		try {
			if (passwordEncoder.matches(PUser.getPw(), login.getPw())) {
				PUser.setId(login.getId()); // 로그인한 아이디를 PUser에 setId해주기
				PUser.setPw(passwordEncoder.encode(PUser.getNpw())); // 인코드처리..여기는
				// 안되는건가요?
				// 묻기전에
				// 회원가입부분
				// 먼저
				// 살펴보기
				// PUser.setPw(PUser.getNpw()); //바꾼비밀번호를 Pw에 set해주기
				service.pwmodify(PUser);
				entity = new ResponseEntity<>("success", HttpStatus.OK);
			} else {
				System.out.println("★ 비밀번호 불일치");
				entity = new ResponseEntity<>("fail", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity; // redirect는 controller
	}

	// 이력서 관리 (리스트)
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String manageGET(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		System.out.println("manage GET Controller");

		// j.code 세션수정03/21
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			model.addAttribute("ResumeVOList", Rservice.selectRList(id));
			model.addAttribute("PUserVO", service.selectPUser(id));
			return "personal/P_manage";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}
	// 이력서 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		System.out.println("write GET controller");

		// j.code 세션수정03/21
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			model.addAttribute("ResumeVOList", Rservice.selectRList(id));
			model.addAttribute("PUserVO", service.selectPUser(id));
			model.addAttribute("CodeVOlist", Rservice.selectRCodeList());
			model.addAttribute("JobGroupVOlist", Rservice.selectRGPList());
			model.addAttribute("RegionVOlist", Rservice.selectRegionList());
			return "personal/P_write";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(String id, String file, PUserVO puser, PTelVO ptvo, PWebSiteVO pwvo, RLicenseVO plivo,
			ResumeEduVO resumeEduVO, ResumeCareerVO resumeCareerVO, ResumeLanguageVO plavo, ResumeVO resume,
			Model model) throws Exception {
		System.out.println("write POST controller");

		System.out.println("레주메" + resume);

		System.out.println("id값 뭐받아오냐" + id);
		System.out.println("write get에서 받아오는 puser" + puser.toString());

		System.out.println("file: " + file);

		int bno = Rservice.createROne(resume, puser);
		// Rservice.readRLastCreatedOne(); 생성한 후 마지막으로 생성한 PK가져오기가 포함
		System.out.println("레주메 정보 : " + resume.toString());

		Telservice.createTList(bno, ptvo.getPtelvolist());
		Webservice.createWList(bno, pwvo.getPwebsitesvolist());
		Licenseservice.createLicenseList(bno, plivo.getRlicensevolist());
		Langservice.createRLanguageList(bno, plavo.getRlangvolist());

		Eduservice.createResumeEduList(bno, resumeEduVO.getListEdu());
		Careerservice.createResumeCareerList(bno, resumeCareerVO.getListCareer());

		return "redirect:/personal/detail?bno=" + bno + "";
	}

	// 이력서 하나 읽기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String modifyGET(int bno, Model model, HttpSession session, RedirectAttributes rttr) throws Exception {

		// j.code 세션수정03/21
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			if (id.equals(Rservice.readROne(bno).getUserid())) {
				model.addAttribute("PUserVO", service.selectPUser(id));
				model.addAttribute("ResumeVO", Rservice.readROne(bno));

				model.addAttribute("PTellist", Telservice.selectPTelList(bno));
				model.addAttribute("RLicenselist", Licenseservice.selectRLicenseList(bno));
				model.addAttribute("RLanguagelist", Langservice.selectResumeLanguageList(bno));
				model.addAttribute("PWebSitelist", Webservice.selectPWebSiteList(bno));

				model.addAttribute("eduVOlist", Eduservice.readResumeEduList(bno));
				model.addAttribute("careerVOList", Careerservice.readResumeCareerList(bno));

				System.out.println("언니" + Rservice.resumeRead(bno));
				model.addAttribute("resumeRead", Rservice.resumeRead(bno));

				/* 2018.04.03_Jcode_자기소개서 유효성 추가 */
				String coverletter = Rservice.readROne(bno).getCoverletter();
				String coverletter2 = coverletter.replace("<", "&lt;"); // HTML
				// 태그를
				// 문자로
				// 인지하게
				// 바꿈
				String coverletter3 = coverletter2.replace("\r\n", "<br>"); // 엔터를
				// <br>
				// 태그로
				// 교체\r\n
				String coverletter4 = coverletter3.replace(" ", "&nbsp;"); // 공백을
				// &nbsp;
				// 로
				// 변환

				model.addAttribute("coverletter", coverletter4);
				/* 2018.04.03_Jcode_자기소개서 유효성 추가 끝 */

				return "personal/P_detail";
			} else {
				rttr.addFlashAttribute("msg", "login");
				return "redirect:/";
			}
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	// 이력서 하나 읽기
	@RequestMapping(value = "/detail_nonavi", method = RequestMethod.GET)
	public String detail_nonaviGET(int bno, Model model, HttpSession session, RedirectAttributes rttr)
			throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			// Apply
			if (true) {// Apply id랑 일치하는지 확인하는 서비스 필요
				model.addAttribute("PUserVO", service.selectPUser(id));
				model.addAttribute("ResumeVO", Rservice.readROne(bno));

				model.addAttribute("PTellist", Telservice.selectPTelList(bno));
				model.addAttribute("RLicenselist", Licenseservice.selectRLicenseList(bno));
				model.addAttribute("RLanguagelist", Langservice.selectResumeLanguageList(bno));
				model.addAttribute("PWebSitelist", Webservice.selectPWebSiteList(bno));

				model.addAttribute("eduVOlist", Eduservice.readResumeEduList(bno));
				model.addAttribute("careerVOList", Careerservice.readResumeCareerList(bno));

				model.addAttribute("resumeRead", Rservice.resumeRead(bno));

				if (login.getCname() != null) {
					model.addAttribute("FavorCompareList", parkService.FavorCompareList(id));
				}
				return "personal/P_detail_nonavi";
			} else {
				rttr.addFlashAttribute("msg", "login");
				return "redirect:/";
			}
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	// 선택한 이력서 수정하는 페이지
	@RequestMapping(value = "/Rmodify", method = RequestMethod.GET)
	public String RmodifyGET(PUserVO puser, Integer bno, Model model, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		// 수정하는 페이지
		System.out.println("Rmodify GET Controller");

		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			puser.setId(id);
			puser.setPname(login.getPname());

			model.addAttribute("ResumeVO", Rservice.readROne(bno));
			model.addAttribute("PUserVO", service.selectPUser(id));

			model.addAttribute("PWebSiteVOlist", Webservice.selectPWebSiteList(bno));
			model.addAttribute("PTelVOlist", Telservice.selectPTelList(bno));
			model.addAttribute("RLicenselist", Licenseservice.selectRLicenseList(bno));
			model.addAttribute("RLanguagelist", Langservice.selectResumeLanguageList(bno));

			// r.code 03/13
			model.addAttribute("eduVOlist", Eduservice.readResumeEduList(bno));
			model.addAttribute("careerVOList", Careerservice.readResumeCareerList(bno));
			// end of r.code 03/13

			model.addAttribute("CodeVOlist", Rservice.selectRCodeList());
			model.addAttribute("JobGroupVOlist", Rservice.selectRGPList());
			model.addAttribute("RegionVOlist", Rservice.selectRegionList());

			return "personal/P_Rmodify";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	// 수정한 이력서 db로 전달하는 페이지
	@RequestMapping(value = "/Rmodify", method = RequestMethod.POST)
	public String RmodifyPOST(String id, Integer bno, PTelVO ptvo, PWebSiteVO pwvo, ResumeLanguageVO plavo,
			RLicenseVO plivo, ResumeEduVO resumeEduVO, ResumeCareerVO resumeCareerVO, ResumeVO resume, Model model)
					throws Exception {
		System.out.println("Rmodify POST Controller");
		System.out.println("이미지" + resume.getImg());
		System.out.println("번호" + resume.getBno());
		// System.out.println("받아오는거"+file.getName());

		// resume.setImg(file.getName());
		Telservice.updateTList(bno, ptvo.getPtelvolist());
		// Rmodify에 rid값 줘야함
		Webservice.updateWList(bno, pwvo.getPwebsitesvolist());
		Langservice.updateLList(bno, plavo.getRlangvolist());
		Licenseservice.updateLicenseList(bno, plivo.getRlicensevolist());

		Rservice.updateROne(resume);

		// r.code 03/15 : update edu & career list in DB
		int resumenum = resume.getBno();
		System.out.println("resumenum : " + resumenum);
		Eduservice.changeResumeEduList(resumenum, resumeEduVO.getListEdu());
		Careerservice.changeResumeCareerList(resumenum, resumeCareerVO.getListCareer());

		return "redirect:/personal/detail?bno=" + bno + "";
	}

	// 추천채용공고
	@RequestMapping(value = "/recom", method = RequestMethod.GET)
	public String recomGET(HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		System.out.println("recom GET Controller");

		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();

			model.addAttribute("CRecruitVOList", Cservice.selectCRList(id));
			model.addAttribute("PUserVO", service.selectPUser(id));

			return "personal/P_recom";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	// 관심채용공고
	@RequestMapping(value = "/favor", method = RequestMethod.GET)
	public String favorGET(HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();

			model.addAttribute("CRecruitVOList", Cservice.selectCRList(id));
			model.addAttribute("PUserVO", service.selectPUser(id));

			return "personal/P_favor";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}
	// 관심채용공고
	@RequestMapping(value = "/favor_ongoing", method = RequestMethod.GET)
	public String favor_ongoingGET(HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();

			model.addAttribute("CRecruitVOList", Cservice.selectCRList_ongoing(id));
			model.addAttribute("PUserVO", service.selectPUser(id));

			return "personal/P_favor";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}
	// 관심채용공고
	@RequestMapping(value = "/favor_closed", method = RequestMethod.GET)
	public String favor_closedGET(HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();

			model.addAttribute("CRecruitVOList", Cservice.selectCRList_closed(id));
			model.addAttribute("PUserVO", service.selectPUser(id));

			return "personal/P_favor";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	// 지원현황리스트
	@RequestMapping(value = "/applied", method = RequestMethod.GET)
	public String appliedGET(HttpSession session, RedirectAttributes rttr, Model model) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();

			model.addAttribute("CRecruitVOList", Cservice.selectAPList(id));
			model.addAttribute("PUserVO", service.selectPUser(id));

			return "personal/P_applied";

		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	// 지원현황리스트
	@RequestMapping(value = "/applied_ongoing", method = RequestMethod.GET)
	public String applied_ongoingGET(HttpSession session, RedirectAttributes rttr, Model model) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();

			model.addAttribute("CRecruitVOList", Cservice.selectAPList_ongoing(id));
			model.addAttribute("PUserVO", service.selectPUser(id));

			return "personal/P_applied";

		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	// 지원현황리스트
	@RequestMapping(value = "/applied_closed", method = RequestMethod.GET)
	public String appliedGET_closed(HttpSession session, RedirectAttributes rttr, Model model) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();

			model.addAttribute("CRecruitVOList", Cservice.selectAPList_closed(id));
			model.addAttribute("PUserVO", service.selectPUser(id));

			return "personal/P_applied";

		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	/*
	 * @Resource(name = "uploadPath") private String uploadPath;
	 */

	S3Util s3 = new S3Util();
	String bucketName = "matchingbucket";
	private String uploadPath = "matching/resume";

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {

	}

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contetnType: " + file.getContentType());
		/* String uploadpath = "matching"; */

		/* String uploadPath = "matching/certificate"; */
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/uploadAjax", method = RequestMethod.POST,
	 * produces = "text/plain;charset=UTF-8") public ResponseEntity<String>
	 * uploadAjax(MultipartFile file) throws Exception {
	 * 
	 * logger.info("originalName : " + file.getOriginalFilename());
	 * logger.info("size: " + file.getSize()); logger.info("contetnType: " +
	 * file.getContentType());
	 * 
	 * return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath,
	 * file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED); }
	 */

	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpURLConnection uCon = null;
		System.out.println("FILE NAME: " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();

			String inputDirectory = "matching/resume";
			URL url;

			try {
				url = new URL(s3.getFileURL(bucketName, inputDirectory + fileName));
				System.out.println(url);
				uCon = (HttpURLConnection) url.openConnection();
				in = uCon.getInputStream(); // 이미지를 불러옴
			} catch (Exception e) {
				System.out.println("라ㅏ");
				url = new URL(s3.getFileURL(bucketName, "NoImage.png"));
				uCon = (HttpURLConnection) url.openConnection();
				in = uCon.getInputStream();
			}

			// 여기
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

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/displayFile") public ResponseEntity<byte[]>
	 * displayFile(String fileName) throws Exception { InputStream in = null;
	 * ResponseEntity<byte[]> entity = null;
	 * 
	 * logger.info("FILE NAME : " + fileName);
	 * 
	 * try { String formatName = fileName.substring(fileName.lastIndexOf(".") +
	 * 1);
	 * 
	 * MediaType mType = MediaUtils.getMediaType(formatName);
	 * 
	 * HttpHeaders headers = new HttpHeaders();
	 * 
	 * in = new FileInputStream(uploadPath + fileName);
	 * 
	 * if (mType != null) { headers.setContentType(mType); } else { fileName =
	 * fileName.substring(fileName.indexOf("_") + 1);
	 * headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	 * headers.add("Content-Disposition", "attachment; filename=\"" + new
	 * String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\""); }
	 * 
	 * entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers,
	 * HttpStatus.CREATED);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); entity = new
	 * ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST); } finally { in.close(); }
	 * return entity; }
	 */

	// 파일 삭제
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

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	 * public ResponseEntity<String> deleteFile(String fileName) {
	 * 
	 * System.out.println(fileName); System.out.println("deleteFile POST");
	 * 
	 * logger.info("delete file : " + fileName);
	 * 
	 * String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
	 * 
	 * MediaType mType = MediaUtils.getMediaType(formatName);
	 * 
	 * if (mType != null) { System.out.println("if 문 안으로 들어왔다."); String front =
	 * fileName.substring(0, 12); String end = fileName.substring(14); new
	 * File(uploadPath + (front + end).replace('/',
	 * File.separatorChar)).delete(); System.out.println("if문 마지막"); }
	 * 
	 * new File(uploadPath + fileName.replace('/',
	 * File.separatorChar)).delete();
	 * 
	 * return new ResponseEntity<String>("deleted", HttpStatus.OK); }
	 */

	@RequestMapping(value = "/deleteResumeList", method = RequestMethod.GET)
	public String deleteResumeListPOST(@RequestParam("bno") int[] bno, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		System.out.println("deleteResumeList POST Controller");

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
			String id = login.getId();
			System.out.println("삭제하려는 이력서 bno뭐냐 : " + bno);
			Rservice.deleteROne(bno);
			rttr.addFlashAttribute("msg", "DELETE");
			return "redirect:/personal/manage";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/deleteOneResume", method = RequestMethod.GET)
	public String deleteOneResumeGET(@RequestParam("bno") int[] bno, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		System.out.println("deleteOneResume POST Controller");

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
			String id = login.getId();
			System.out.println("삭제하려는 이력서 bno뭐냐 : " + bno);
			Rservice.deleteROne(bno);
			rttr.addFlashAttribute("msg", "DELETE");
			return "redirect:/personal/manage";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/publicornot_change", method = RequestMethod.POST) // 소연
	public ResponseEntity<String> publicornot_change(@RequestBody ResumeVO resume) throws Exception {
		System.out.println("clipping POST CONTROLLER");

		ResponseEntity<String> entity = null;

		System.out.println("들어온 resume" + resume.toString());
		try {
			if (resume.getPublicornot().equals("공개")) {// 비공개일 때 공개로
				System.out.println("공개로 바꾸는 if문으로 들어옴");
				Rservice.updatePONOnetopublic(resume);
				entity = new ResponseEntity<String>("AS_PUBLIC", HttpStatus.OK);
			} else if (resume.getPublicornot().equals("비공개")) {// 공개일 때 비공개로
				System.out.println("비공개로 바꾸는 if문으로 들어옴");
				Rservice.updatePONOne(resume);
				entity = new ResponseEntity<String>("AS_PRIVATE", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		System.out.println("return entity : " + entity);
		return entity;
	}
}