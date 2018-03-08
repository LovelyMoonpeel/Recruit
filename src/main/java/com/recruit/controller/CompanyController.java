package com.recruit.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//import org.zerock.domain.BoardVO;
import com.recruit.domain.CInfoVO;
import com.recruit.service.CompanyService;
import com.recruit.service.CompanyAjaxService;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ImgVO;

@Controller
@RequestMapping("/rpjt/*")
public class CompanyController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

	@Inject
	private CompanyService service;
	@Inject
	private CompanyAjaxService jobService;
	@Resource(name = "uploadPath")  // servlet-context에 지정된 경로를 읽어옴 
	private String uploadPath;
	

	  @RequestMapping(value = "/C_modify", method = RequestMethod.GET)
	  public void modifyGET(String id, Model model) throws Exception {

	    model.addAttribute(service.CompanyInfoRead(id));
	  }
	  	
	  @RequestMapping(value = "/C_modify", method = RequestMethod.POST)
	  public String modifyPOST (CInfoVO CInfo,  HttpServletRequest request,Model model, RedirectAttributes rttr) throws Exception {
	  			
		  		
		  		InfoFileUpload(CInfo , request); //사진 업로드 메서드로 CInfo객체와 request를 사용하기 위해 넘김
		  		// (CInfo 객체는 파일명에 사용할 기업id값과 db에 이름을 집어 넣기 위해 보냄)
		  
				
			    
				service.CompanyInfoModify(CInfo); // text form값들 저장 
				
					    rttr.addFlashAttribute("msg", "SUCCESS");
				
					    return "redirect:/rpjt/C_index?id="+CInfo.getId(); 
			}

		        
			public void InfoFileUpload(CInfoVO CInfo, HttpServletRequest request) {
				
				 String path = uploadPath;  // 에너테이션에 연결된 저장경로를 String에 저장 
				 
				  Map returnObject = new HashMap();
				  
				  try {
						// MultipartHttpServletRequest 생성
						MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) request; //
						Iterator iter = mhsr.getFileNames();
						System.out.println(mhsr);
						MultipartFile mfile = null;
						String fieldName = "";
						List resultList = new ArrayList();

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
							
							origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글깨짐 방지
							// 파일명이 없다면
							if ("".equals(origName)) {
								continue;
							}

							// 파일 명 변경
							String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 지정
							String saveFileName = CInfo.getId() + ext; // 기업 id + 확장자로 경로에 저장 

							// 설정한 path에 파일저장
							File serverFile = new File(path + File.separator + saveFileName);
							mfile.transferTo(serverFile);
							
							Map file = new HashMap();
							file.put("origName", origName);
							file.put("sfile", serverFile);
							resultList.add(file);
						}
						
						returnObject.put("files", resultList);
						returnObject.put("params", mhsr.getParameterMap());
						
						CInfo.setImg(CInfo.getId()); // DB 이미지 저장

						} catch (UnsupportedEncodingException e) { 
							// TODO Auto-generated catch block
							e.printStackTrace();
						}catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
				
				
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
	  public String writePOST(RecruitVO writeRecruit, HttpServletRequest request) throws Exception {

		 
		  service.RecruitWrite(writeRecruit); // 채용공고등록
	  

		  return "redirect:/rpjt/C_index?id="+request.getParameter("cid"); 
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


		    	model.addAttribute(service.CompanyInfoRead(id));
		    	System.out.println(recruitNum);
		    	model.addAttribute(service.RecruitInfoRead(recruitNum));

		   
		  }
		
		@RequestMapping(value = "C_recom", method = RequestMethod.GET)
		  public void readRecom(String id, Model model, RedirectAttributes rttr) throws Exception {

			  model.addAttribute(service.CompanyInfoRead(id));
			  System.out.println("컨트롤러 : " +id);
			  
			  
			  model.addAttribute("recruitList", service.RecruitList(id));
		
			  
		  }
	  
	  
	

}