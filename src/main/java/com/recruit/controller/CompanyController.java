package com.recruit.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.recruit.domain.BoardVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.CInfoVO;
import com.recruit.domain.RecruitVO;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;


@Controller
@RequestMapping("/company/*")
public class CompanyController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

	@Inject
	private CompanyService service;
	@Inject
	private CompanyAjaxService ajaxService;

	@Resource(name = "uploadPath") // servlet-context에 지정된 경로를 읽어옴
	private String uploadPath;

	@RequestMapping(value = "/C_index", method = RequestMethod.GET) // 기업 메인 화면
	public String read(HttpSession session, Model model, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
	
	BoardVO login = (BoardVO) session.getAttribute("login");
		
	if (login != null) {
			String id = login.getId();
			model.addAttribute(service.CompanyInfoRead(id));
			return "/company/C_index";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
		 		
	}
	

	@RequestMapping(value = "/C_modify", method = RequestMethod.GET) // 기업정보 수정
																		// GET
	public String modifyGET(HttpSession session, HttpServletRequest request, RedirectAttributes rttr, Model model) throws Exception {
		
		
		BoardVO login = (BoardVO) session.getAttribute("login");
			
		
		if (login != null) {
				String id = login.getId();
				model.addAttribute(service.CompanyInfoRead(id));
				return "/company/C_modify";
			} else {
				rttr.addFlashAttribute("msg", "login");
				return "redirect:/cs/S_faq";
			}
		
	}

	@RequestMapping(value = "/C_modify", method = RequestMethod.POST) // 기업정보 수정
																		// POST
	public String modifyPOST(CInfoVO CInfo, HttpSession session, HttpServletRequest request, Model model, RedirectAttributes rttr)
			throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
			
		
		if (login != null) {
				String id = login.getId();
				CInfo.setId(id);
				InfoFileUpload(CInfo, request, id);
				System.out.println("시작 CINFO : "+CInfo);
				service.CompanyInfoModify(CInfo);
				System.out.println("끝난 CINFO : "+CInfo);
				rttr.addFlashAttribute("msg", "SUCCESS");

				return "redirect:/company/C_index";
			} else {
				rttr.addFlashAttribute("msg", "login");
				return "redirect:/cs/S_faq";
			}
		

	}

	public void InfoFileUpload(CInfoVO CInfo, HttpServletRequest request, String id) { // 사진
																			// 업로드
																			// 메서드
		String path = uploadPath; // 에너테이션에 연결된 저장경로를 String에 저장

		// Map returnObject = new HashMap();

		try {
			// MultipartHttpServletRequest 생성
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) request; //
			Iterator iter = mhsr.getFileNames();

			System.out.println("mhsr은 = " + mhsr);
			MultipartFile mfile = null;
			String fieldName = "";
			// List resultList = new ArrayList();

			// 디레토리가 없다면 생성
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}

			// 값이 나올때까지
			while (iter.hasNext()) {

				fieldName = (String) iter.next(); // 내용을 가져와서
				mfile = mhsr.getFile(fieldName);

				System.out.println(mfile);

				String origName;

				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); // 한글깨짐
																								// 방지
				// 파일명이 없다면

				if ("".equals(origName)) {
					continue;
				}

				// 파일 명 변경
				String ext = origName.substring(origName.lastIndexOf('.')); // 확장자
																			// 지정
				String saveFileName = origName; // 기업 id + 확장자로 경로에 저장

				String imgName = id + ext;
				
				

				System.out.println("이미지 파일명은 = "+imgName);
				
				CInfo.setImg(imgName); // DB 이미지 저장
				
				
				
				System.out.println("CInfo 파일명은 = "+ CInfo.getImg());

				// 설정한 path에 파일저장
				File serverFile = new File(path + File.separator + imgName);
				System.out.println("서버파일은 = " + serverFile);
				mfile.transferTo(serverFile);

				// Map file = new HashMap();
				// file.put("origName", origName);
				// file.put("sfile", serverFile);
				// resultList.add(file);

				
			}

			// returnObject.put("files", resultList);
			// returnObject.put("params", mhsr.getParameterMap());

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/C_write", method = RequestMethod.GET) // 채용공고 작성
	public String writeGET(HttpSession session,  Model model, RedirectAttributes rttr ) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
			
		
		if (login != null) {
				String id = login.getId();
				
				model.addAttribute(service.CompanyInfoRead(id));
				model.addAttribute("jobgroupList", ajaxService.jobgroupList());
				model.addAttribute("codeList", service.CodeList());
				model.addAttribute("regionList", service.RegionList());


				return "/company/C_write";
			} else {
				rttr.addFlashAttribute("msg", "login");
				return "redirect:/cs/S_faq";
			}
		

	}

	@RequestMapping(value = "/C_write", method = RequestMethod.POST) // 채용공고 작성
	public String writePOST(RecruitVO writeRecruit, HttpSession session, RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		
		String id = login.getId();
		logger.info("write Register..........");
		

		writeRecruit.setCid(id);
		
		logger.info(writeRecruit.toString());

		service.RecruitWrite(writeRecruit);

		rttr.addFlashAttribute("msg", "regist");

		return "redirect:/company/C_manage";
	}

	@RequestMapping(value = "/C_manage", method = RequestMethod.GET) // 채용공고 관리
	public String manage(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		
		if (login != null) {
			String id = login.getId();
			
			model.addAttribute(service.CompanyInfoRead(id));
			
			return "/company/C_manage";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
		

	}

	@RequestMapping(value = "/C_recruitInfo", method = RequestMethod.GET)
	public String readRecruit(int recruitNum,HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		
		if (login != null) {
			
			String id = login.getId();
			
			String adddesc = service.RecruitInfoRead2(recruitNum).getAdddesc();
			String adddesc2 = adddesc.replace("\r\n", "<br>");
			String jobdesc = service.RecruitInfoRead2(recruitNum).getJobdesc();
			String jobdesc2 = jobdesc.replace("\r\n", "<br>");

			model.addAttribute("adddesc", adddesc2);
			model.addAttribute("jobdesc", jobdesc2);
			
			model.addAttribute("CInfoVO", service.CompanyInfoRead(id));
			model.addAttribute("RecruitVO", service.RecruitInfoRead(recruitNum));
			model.addAttribute("ApplyList", service.ApplyList(recruitNum));


			return "/company/C_recruitInfo";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
		
	}
	
	
	@RequestMapping(value = "/C_recruitModify", method = RequestMethod.GET) // 채용공고
	public String C_recruitModfiy(HttpSession session, RedirectAttributes rttr, int bno, Model model) throws Exception { // 채용공고 수정
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		
		if (login != null) {
			String id = login.getId();
			model.addAttribute(service.CompanyInfoRead(id));
			System.out.println("아이디입니당." + id);
			System.out.println("bno값입니당." + bno);
			model.addAttribute("jobgroupList", ajaxService.jobgroupList());
			model.addAttribute("codeList", service.CodeList());
			model.addAttribute("regionList", service.RegionList());

			model.addAttribute("RecruitVO", service.RecruitModifyRead(bno, id));
				return "/company/C_recruitModify";
			} else {
				rttr.addFlashAttribute("msg", "login");
				return "redirect:/cs/S_faq";
			}
			 		
		}
		

	@RequestMapping(value = "/C_recruitModify", method = RequestMethod.POST) // 채용공고
																				// 수정
	public String C_recruitModfiy2(RecruitVO recruitModify, RedirectAttributes rttr) throws Exception {

		service.RecruitModify(recruitModify);

		rttr.addFlashAttribute("msg", "MODISUCCESS");

		return "redirect:/company/C_recruitInfo?recruitNum="+recruitModify.getBno();

	}
	
	@RequestMapping(value = "/C_recruitRemove", method = RequestMethod.GET) // 채용공고
																			// 삭제
		public String remove(@RequestParam("bno") int bno, HttpSession session, RedirectAttributes rttr)throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		
		if (login != null) {
			
			String id = login.getId();
			
			service.RecruitRemove(bno, id);

			rttr.addFlashAttribute("msg", "DELESUCCESS");

			return "redirect:/company/C_manage";

		} 
			else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
	
		
	}

	
	@RequestMapping(value = "C_recom", method = RequestMethod.GET)
	public String readRecom(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		
		if (login != null) {
			
			String id = login.getId();
			
			model.addAttribute(service.CompanyInfoRead(id));
			System.out.println("컨트롤러 : " + id);

			model.addAttribute("recruitList", service.RecruitList(id));
			model.addAttribute("FavorCompareList", service.FavorCompareList(id));

			return "/company/C_recom";

		} 
			else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
		
		
	}

	@RequestMapping(value = "C_favor", method = RequestMethod.GET) // 관심인재 리스트
	public String readfavor(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		
		if (login != null) {
			
			String id = login.getId();
			
			model.addAttribute(service.CompanyInfoRead(id));
			

			return "/company/C_favor";

		} 
			else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
		

	}


	@RequestMapping(value = "C_info", method = RequestMethod.GET) // 개인이 보는 기업정보
																	// 페이
	public void C_info(int recruitNum, Model model, RedirectAttributes rttr) throws Exception {

		String id = service.RecruitInfoRead2(recruitNum).getCid();
		System.out.println("컨트롤러 아이디 값은 : " + id);

		model.addAttribute(service.CompanyInfoRead(id));
		model.addAttribute("RecruitList", service.CInfoRecruitList(id));

	}

	@RequestMapping(value = "/C_recruitMent", method = RequestMethod.GET) // 개인이
																			// 보는
																			// 채용공고
																			// 정보
	public void readRecruitMent(int recruitNum, Model model) throws Exception {

		String id = service.RecruitInfoRead2(recruitNum).getCid();
		System.out.println("컨트롤러 아이디 값은 : " + id);

		model.addAttribute("CInfoVO", service.CompanyInfoRead(id));
		model.addAttribute("RecruitVO", service.RecruitInfoRead(recruitNum));
		model.addAttribute("ApplyList", service.ApplyList(recruitNum));

	}

}