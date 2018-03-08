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
	@Resource(name = "uploadPath")
	private String uploadPath;
	

	  @RequestMapping(value = "/C_modify", method = RequestMethod.GET)
	  public void modifyGET(String id, Model model) throws Exception {

	    model.addAttribute(service.CompanyInfoRead(id));
	  }
	  
//	  @RequestMapping(value="/fileUpload",method=RequestMethod.POST)
//		public String fileUpload(String title, MultipartFile file,Model model,HttpServletRequest request) throws IllegalStateException, IOException{
//		
//			System.out.println("컨트롤러들어옴");
//			
//			String fileName = file.getOriginalFilename();
//		String saveDir = request.getServletContext().getRealPath("fileUpload");
//		System.out.println(saveDir);
//		System.out.println(title);
//		System.out.println(fileName);
//		
//		// String saveFile = saveDir+"\\"+file1.getOriginalFilename();
//		 
//		// 중복된 파일인 경우 덮어 쓰기가 되기 때문에 중복 방지 처리를 해 줘야 한다.
////		File fileObj
////		// = new File(saveFile);
////		// = new File(saveDir,file1.getOriginalFilename());
////		 
////		// 중복된 파일 방지 처리를 한 파일 객체를 사용 한다.
////		= DuplicateFile.getFile(saveDir, file);
////		 
////		file.transferTo(fileObj);
////		model.addAttribute("title",title);
////		model.addAttribute("file",file);
////		model.addAttribute("fileName",fileName);
////		model.addAttribute("serverFileName",fileObj.getName());
////		return "fileUpload";
//		return "hi";
//		}//fileUploadForm()
	  
		 
		
		
	  @RequestMapping(value = "/C_modify", method = RequestMethod.POST)
	  public String modifyPOST (CInfoVO CInfo,  HttpServletRequest request,Model model, RedirectAttributes rttr) throws Exception {

		  String path = "/Users/hyeonghoon/sts-bundle/img";
		  Map returnObject = new HashMap();
		  System.out.println(CInfo.getId());
//		  System.out.println(iter.getOriginalFilename(););
		  try {
				// MultipartHttpServletRequest 생성
				MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) request;
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
					
					origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지
					// 파일명이 없다면
					if ("".equals(origName)) {
						continue;
					}

					// 파일 명 변경(uuid로 암호화)
					String ext = origName.substring(origName.lastIndexOf('.')); // 확장자
					String saveFileName = CInfo.getId() + ext;

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
				
				CInfo.setImg(CInfo.getId());
			    service.CompanyInfoModify(CInfo);
				//
					    rttr.addFlashAttribute("msg", "SUCCESS");
				//
					    return "redirect:/rpjt/C_index?id="+CInfo.getId(); 
			}

		        //uuid생성
			public static String getUuid() {
				return "21";
			}
//		CInfo.setImg(request.getParameter("file"));
//		  String a = request.getParameter("file");
//		  byte[] i = a.getBytes();
//		  
//
	//	  File target = new File(uploadPath, a);
////		  
//		  FileCopyUtils.copy(i, target);
//		  
//		  return a;
		  
		
//		  model.addAttribute("savedName", a);
		  
//	    service.CompanyInfoModify(CInfo);
//
//	    rttr.addFlashAttribute("msg", "SUCCESS");
//
//	    return "redirect:/rpjt/C_index?id="+CInfo.getId(); 
//	  }
	  
	  private String uploadFile(String originalName, byte[] fileData)throws Exception{
		  
		  
		  String savedName = originalName;
		  
		  File target = new File(uploadPath, savedName);
		  
		  FileCopyUtils.copy(fileData, target);
		  
		  return savedName;
	  }
	  
	  //파일전달
//		@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
//		public @ResponseBody
//		String uploadFileHandler(@RequestParam("name") String name,
//				@RequestParam("file") MultipartFile file) {
//
//			if (!file.isEmpty()) {
//				try {
//					byte[] bytes = file.getBytes();
//
//					// Creating the directory to store file
//					String rootPath = System.getProperty("catalina.home");
//					File dir = new File(rootPath + File.separator + "tmpFiles");
//					if (!dir.exists())
//						dir.mkdirs();
//
//					// Create the file on server
//					File serverFile = new File(dir.getAbsolutePath()
//							+ File.separator + name);
//					BufferedOutputStream stream = new BufferedOutputStream(
//							new FileOutputStream(serverFile));
//					stream.write(bytes);
//					stream.close();
//
//					logger.info("Server File Location="
//							+ serverFile.getAbsolutePath());
//
//					return "You successfully uploaded file=" + name;
//				} catch (Exception e) {
//					return "You failed to upload " + name + " => " + e.getMessage();
//				}
//			} else {
//				return "You failed to upload " + name
//						+ " because the file was empty.";
//			}
//		}
//
//		/**
//		 * Upload multiple file using Spring Controller
//		 */
//		@RequestMapping(value = "/uploadMultipleFile", method = RequestMethod.POST)
//		public @ResponseBody
//		String uploadMultipleFileHandler(@RequestParam("name") String[] names,
//				@RequestParam("file") MultipartFile[] files) {
//
//			if (files.length != names.length)
//				return "Mandatory information missing";
//
//			String message = "";
//			for (int i = 0; i < files.length; i++) {
//				MultipartFile file = files[i];
//				String name = names[i];
//				try {
//					byte[] bytes = file.getBytes();
//
//					// Creating the directory to store file
//					String rootPath = System.getProperty("catalina.home");
//					File dir = new File(rootPath + File.separator + "tmpFiles");
//					if (!dir.exists())
//						dir.mkdirs();
//
//					// Create the file on server
//					File serverFile = new File(dir.getAbsolutePath()
//							+ File.separator + name);
//					BufferedOutputStream stream = new BufferedOutputStream(
//							new FileOutputStream(serverFile));
//					stream.write(bytes);
//					stream.close();
//
//					logger.info("Server File Location="
//							+ serverFile.getAbsolutePath());
//
//					message = message + "You successfully uploaded file=" + name
//							+ " ";
//				} catch (Exception e) {
//					return "You failed to upload " + name + " => " + e.getMessage();
//				}
//			}
//			return message;
//		}
	
	  
	
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
	  public String writePOST(HttpServletRequest request) throws Exception {
		  
		  RecruitVO Recruit = new RecruitVO();
		  
		  Recruit.setTitle(request.getParameter("title"));		//타이틀 
		 
		  Recruit.setCid(request.getParameter("cid"));			//아이디 	
//		  
		  String jobGroup1 = request.getParameter("jobgroupid");
		  int jobgroup = Integer.parseInt(jobGroup1);
		  Recruit.setJobgroupid(jobgroup);						//모집직종 
//		   
//		  Recruit.setRgbid(request.getParameter("rgbid"));		//근무지(시/도)
//		  
//		  String rgsid1 = request.getParameter("rgsid");		
//		  int rgsid = Integer.parseInt(rgsid1);
//		  Recruit.setRgsid(rgsid);								//근무지
//	
//		  Recruit.setJobdesc(request.getParameter("jobdesc"));  //담당업무 
//	
//		  String recruitnum1 = request.getParameter("recruitnum");
//		  int recruitnum = Integer.parseInt(recruitnum1);
//		  Recruit.setRecruitnum(recruitnum);					//모집인원 
//		  
//		  
//		  String employstatusid1 = request.getParameter("employstatusid");
//		  int employstatusid = Integer.parseInt(employstatusid1);
//		  Recruit.setEmploystatusid(employstatusid);			//근무형태
//		  
//		  String salaryid1 = request.getParameter("salaryid");
//		  int salaryid = Integer.parseInt(salaryid1);	  
//		  Recruit.setSalaryid(salaryid);						//급여사항 
//		  
//		  String edu1 = request.getParameter("edu");
//		  int edu = Integer.parseInt(edu1);
//		  Recruit.setEdu(edu);									//학력 
////		  System.out.println(edu);
//		  String exp1 = request.getParameter("exp");
//		  int exp = Integer.parseInt(exp1);
//		  Recruit.setExp(exp);									//경력 
//		  System.out.println(exp);
//		  Recruit.setAdddesc(request.getParameter("adddesc"));	//상세모집내용 
//		  System.out.println(request.getParameter("adddesc"));
		  
//		  Recruit.setPeriod(request.getParameter("period")); 	//모집기간		
//		  System.out.println( request.getParameter("period"));
		  
		  service.RecruitWrite(Recruit); // 채용공고등록
		  
		  

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