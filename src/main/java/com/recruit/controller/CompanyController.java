package com.recruit.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
	
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.BoardVO;
import com.recruit.domain.CInfoVO;
import com.recruit.domain.PApplyVO;
import com.recruit.domain.CompanyPageMaker;
import com.recruit.domain.CompanySearchCriteria;

import com.recruit.domain.RecruitVO;
import com.recruit.domain.ResumeVO;
import com.recruit.dto.LoginDTO;
import com.recruit.persistence.UserDAO;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;
import com.recruit.service.PApplyService;

import com.recruit.service.PUserService;
import com.recruit.service.ResumeService;
import com.recruit.service.UserService;
import com.recruit.util.MediaUtils;
import com.recruit.util.UploadFileUtils;


@Controller
@RequestMapping("/company/*")
public class CompanyController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

	@Inject
	private CompanyService service;
	@Inject
	private CompanyAjaxService ajaxService;
	@Inject
	private ResumeService Rservice;
	@Inject
	private PUserService Pservice;
	@Inject
	private PApplyService PAPService;

	
	// 문> 3.23 밑에 3개 추가
	@Inject
	private UserDAO dao;

	@Inject
	private JavaMailSender mailSender;
	
    @Inject
    private PasswordEncoder passwordEncoder;	
	
	@Inject
	private UserService servicePw;



	@Resource(name = "uploadPath") // servlet-context에 지정된 경로를 읽어옴
	private String uploadPath;

	@RequestMapping(value = "/C_index", method = RequestMethod.GET) // 기업 메인 화면
	public String read(HttpSession session, Model model, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		String pw = login.getPw();

		if (login != null) {
	         if (login.getCname() == null){  // 문> 3.23 지훈이 참고해서 추가, 여기 if구문은 개인회원이 기업쪽으로 못 들어오게 하는 장치, 아래 모든 requestMapping에 다 넣었음
	             rttr.addFlashAttribute("msg", "fail");
	             return "redirect:/";
	          }
			String id = login.getId();
			System.out.println(id);
			
			// 문> 서비스객체의 CompanyInfoRead를 까면 그 기능은 id를 데리고 온다.
			// 그 코드 뒤에 .getIntro()를 하면 해당 id의 Intro칼럼의 내용을 가지고 온다
			// 그래서 content에 넣는다.
			// 아래 코드들은 설명하자면 우리가 입력을 할 때는 textarea에 넣는데 입력한 것을 출력할때는 html적용이 되야 띄워쓰기, 엔터가 먹힌다. 그걸 가능하게 해주는 코드이다.
			String content = service.CompanyInfoRead(id).getIntro();
			String content2 = content.replace("<", "&lt;"); //HTML 태그를 문자로 인지하게 바꿈
			String content3 = content2.replace("\r\n", "<br>"); //엔터를 <br> 태그로 교체
			String content4 = content3.replace(" ","&nbsp;"); //공백을 &nbsp; 로 변환
			
			// 문> content4 객체를 content로 쓰겠다는거다.
			// jsp파일 보면 $content로 되어있는 것을 볼 수 있을 것이다.
			model.addAttribute("content", content4);
			
			model.addAttribute(service.CompanyInfoRead(id));
			model.addAttribute(login); // 문> 이 줄 추가
			return "/company/C_index";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}
	

	@RequestMapping(value = "/C_modify", method = RequestMethod.GET) // 기업정보 수정
																		// GET
	public String modifyGET(HttpSession session, HttpServletRequest request, RedirectAttributes rttr, Model model)
			throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
	         if (login.getCname() == null){
	             rttr.addFlashAttribute("msg", "fail");
	             return "redirect:/";
	          }
			String id = login.getId();
			model.addAttribute(service.CompanyInfoRead(id));
			model.addAttribute(login);
			return "/company/C_modify";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/C_modify", method = RequestMethod.POST) // 기업정보 수정
	public String modifyPOST(CInfoVO CInfo, HttpSession session, HttpServletRequest request, Model model,
			RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
	         if (login.getCname() == null){
	             rttr.addFlashAttribute("msg", "fail");
	             return "redirect:/";
	          }
	        
			String id = login.getId();
			CInfo.setId(id);
			InfoFileUpload(CInfo, request, id);
			System.out.println("시작 CINFO : " + CInfo);
			service.CompanyInfoModify(CInfo);
			System.out.println("끝난 CINFO : " + CInfo);
			rttr.addFlashAttribute("msg", "SUCCESS");
			return "redirect:/company/C_index";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	public void InfoFileUpload(CInfoVO CInfo, HttpServletRequest request, String id) { // 사진
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
				
				System.out.println("ext가 뭘까? = " + ext);
				
				String saveFileName = origName; // 기업 id + 확장자로 경로에 저장

				System.out.println("saveFileName가 뭘까? = " + saveFileName);
				
				String imgName = id + ext;

				System.out.println("이미지 파일명은 = " + imgName);

				CInfo.setImg(imgName); // DB 이미지 저장
				
				System.out.println("CInfo 파일명은 = " + CInfo.getImg());

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
	public String writeGET(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
	         if (login.getCname() == null){
	             rttr.addFlashAttribute("msg", "fail");
	             return "redirect:/";
	          }
			String id = login.getId();

			model.addAttribute(service.CompanyInfoRead(id));
			model.addAttribute("jobgroupList", ajaxService.jobgroupList());
			model.addAttribute("codeList", service.CodeList());
			model.addAttribute("regionList", service.RegionList());
			return "/company/C_write";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
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


	@RequestMapping(value = "/C_recruitExtension", method = RequestMethod.GET)
	public void recruitExtension(HttpSession session, int bno, Model model, RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
	         /*if (login.getCname() == null){
	             rttr.addFlashAttribute("msg", "fail");
	             return "redirect:/";
	          }*///문> 3.23 지훈이가 넣으라고 한 건데 오류가 나서 일단 주석처리
			String id = login.getId();

			System.out.println("bno랑 id 는 = " + bno + "" + id);

			service.C_RecruitExtension(id, bno);

		} else {
			rttr.addFlashAttribute("msg", "login");
		}
	}

	@RequestMapping(value = "/C_recruitInfo", method = RequestMethod.GET)
	public String readRecruit(int recruitNum, HttpSession session, Model model, RedirectAttributes rttr)
			throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
	         if (login.getCname() == null){
	             rttr.addFlashAttribute("msg", "fail");
	             return "redirect:/";
	          }

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
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/C_recruitModify", method = RequestMethod.GET) // 채용공고
	public String C_recruitModfiy(HttpSession session, RedirectAttributes rttr, int bno, Model model) throws Exception { // 채용공고
																															// 수정
		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
	         if (login.getCname() == null){
	             rttr.addFlashAttribute("msg", "fail");
	             return "redirect:/";
	          }
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
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/C_recruitModify", method = RequestMethod.POST) // 채용공고
	// 수정
	public String C_recruitModfiy2(RecruitVO recruitModify, RedirectAttributes rttr) throws Exception {

		service.RecruitModify(recruitModify);

		rttr.addFlashAttribute("msg", "MODISUCCESS");

		return "redirect:/company/C_recruitInfo?recruitNum=" + recruitModify.getBno();

	}
	@RequestMapping(value ="/C_recruitReregister", method = RequestMethod.GET)
	public String Reregister(@RequestParam("bno") int bno, @RequestParam("day") int day,  HttpSession session, RedirectAttributes rttr)throws Exception{

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
			String id = login.getId();
			service.RecruitReRegister(id, bno, day);
			rttr.addFlashAttribute("msg", "DELESUCCESS");
			return "/company/C_manage";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
	}


	@RequestMapping(value = "/C_recruitRemove", method = RequestMethod.GET) // 채용공고
	public String remove(@RequestParam("bno") int bno, HttpSession session, RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
	         if (login.getCname() == null){
	             rttr.addFlashAttribute("msg", "fail");
	             return "redirect:/";
	          }
			String id = login.getId();
			service.RecruitRemove(bno, id);
			rttr.addFlashAttribute("msg", "DELESUCCESS");
			return "redirect:/company/C_manage";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/C_manage", method = RequestMethod.GET) // 채용공고 관리
	public String manage(@ModelAttribute("cri") CompanySearchCriteria cri, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			CompanyPageMaker pageMaker = new CompanyPageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(131);

			 model.addAttribute("pageMaker", pageMaker);
			return "/company/C_manage";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
	}

	@RequestMapping(value = "C_recom", method = RequestMethod.GET)
	public String readRecom(@ModelAttribute("cri") CompanySearchCriteria cri,HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
	         if (login.getCname() == null){
	             rttr.addFlashAttribute("msg", "fail");
	             return "redirect:/";
	          }

			String id = login.getId();

			logger.info(cri.toString());
			
			model.addAttribute(service.CompanyInfoRead(id));
			System.out.println("컨트롤러 : " + id);

			model.addAttribute("recruitList", service.RecomList(cri,id));
			CompanyPageMaker pageMaker = new CompanyPageMaker();
			pageMaker.setCri(cri);
			System.out.println("페이지 메이커는 = "+pageMaker.getCri());
//			pageMaker.setTotalCount(131);
			
			 pageMaker.setTotalCount(service.listSearchCount(cri,id));

			 model.addAttribute("pageMaker", pageMaker);
			    
			model.addAttribute("FavorCompareList", service.FavorCompareList(id));

			return "/company/C_recom";

		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "C_favor", method = RequestMethod.GET) // 관심인재 리스트
	public String readfavor(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
	         if (login.getCname() == null){
	             rttr.addFlashAttribute("msg", "fail");
	             return "redirect:/";
	          }
			String id = login.getId();
			model.addAttribute(service.CompanyInfoRead(id));
			return "/company/C_favor";

		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "C_info", method = RequestMethod.GET) // 개인이 보는 기업정보
	public String C_info(HttpSession session, int recruitNum, Model model, RedirectAttributes rttr) throws Exception {
		BoardVO login = (BoardVO) session.getAttribute("login");

		String cid = service.RecruitInfoRead2(recruitNum).getCid();

		if (login != null) {
			String id = login.getId();
			System.out.println("컨트롤러 아이디 값은 : " + id);
			model.addAttribute(service.CompanyInfoRead(cid));
			model.addAttribute("RecruitList", service.CInfoRecruitList(cid));
			return "/company/C_info";

		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/C_recruitMent", method = RequestMethod.GET) // 개인이 보는 페이지 정보
	public String readRecruitMent(HttpSession session, RedirectAttributes rttr, int recruitNum, Model model) throws Exception {
		// 안소연 수정
		BoardVO login = (BoardVO) session.getAttribute("login");
		String cid = service.RecruitInfoRead2(recruitNum).getCid();
		if (login != null) {

			String id = login.getId();
			model.addAttribute("CInfoVO", service.CompanyInfoRead(cid));
			model.addAttribute("RecruitVO", service.RecruitInfoRead(recruitNum));
			model.addAttribute("ResumeVOList", Rservice.selectRList(id));
			model.addAttribute("PUserVO", Pservice.selectPUser(id));
			return "/company/C_recruitMent";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/applynow", method = RequestMethod.POST)// 소연
	public String applynowPOST(HttpSession session, ResumeVO resume, int recruitNum, Model model, RedirectAttributes rttr) throws Exception {
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		String cid = service.RecruitInfoRead2(recruitNum).getCid();
		Integer bno = resume.getBno();
		
		if (login != null) {
			String id = login.getId();

			System.out.println("넘어온 Resume정보" + Rservice.readROne(bno).toString());
			System.out.println("applynow로 넘어옴");
			
			PApplyVO pavo = new PApplyVO();
			pavo.setBno(bno);
			pavo.setRsno(bno+"");
			System.out.println("레주메에서 받아오는 유저아이디"+id);
			pavo.setPid(id);
			pavo.setRcno(recruitNum+"");
			pavo.setCoverletter(" ");
			PAPService.createAPOne(pavo);
			// applytbl update 시키면 된다.
			
			return "redirect:C_recruitMent?recruitNum="+recruitNum;
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}
	
	// 문> get은 페이지를 보여주기 위한 녀석이다. 아래 페이지를 없애면 화면이 표시 안 된다.
	@RequestMapping(value = "/C_pass", method = RequestMethod.GET) 
	public String pass1(HttpSession session, Model model, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		
		// 문> login을 데리고 와서
		BoardVO login = (BoardVO) session.getAttribute("login");
		
		// 문> login이 null이 아니면, 즉, 로그인 되어 있으면 진행
		if (login != null) {
			
			// 문> login을 조사해서 Cname이 null이면, 즉, 기업 회원이 아니면 다음을 진행
			if (login.getCname() == null){
	             rttr.addFlashAttribute("msg", "fail");
	             System.out.println("메인으로~~");
	             return "redirect:/";
	          }
			
			/*
			String id = login.getId();
			model.addAttribute(service.CompanyInfoRead(id));
			*/
			
			// 문> 이것때문에 화면을 볼 수 있다.
			return "/company/C_pass";
		} else {
			rttr.addFlashAttribute("msg", "login");
			
			// 문> 로그인 안 되어 있으면 메인으로
			return "redirect:/";
		}
		
	}
	
	
	@RequestMapping(value = "/C_pass", method = RequestMethod.POST) 
	public String pass2(String pw2, LoginDTO dto,HttpSession session, Model model, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		
		
		return "/company/C_pass";   //확인을 누른다음 보여주는 페이지
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
			System.out.println("if문 마지막");
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/deleteResumeList", method = RequestMethod.POST)
	public String deleteResumeListPOST(@RequestParam("bno") int bno, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("deleteResumeList POST Controller");

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
			String id = login.getId();
			System.out.println("삭제하려는 이력서 bno뭐냐 : "+bno);
			//Rservice.deleteROne(bno);
			rttr.addFlashAttribute("msg", "DELETE");
			return "personal/P_manage";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}
	
	
}
