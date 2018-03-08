package com.recruit.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.recruit.domain.JobGroupVO;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;
import com.recruit.domain.RegionVO;



@RestController
@RequestMapping("/companyAjax")
public class CompanyAjax {

	@Inject
	private CompanyAjaxService service;
	@Inject
	private CompanyService jobService;
	
	
	@RequestMapping(value = "/jobGroup", method = RequestMethod.GET)
	  public ResponseEntity<List<JobGroupVO>> list() {

	    ResponseEntity<List<JobGroupVO>> entity = null;
	    try {
	    	
	      entity = new ResponseEntity<>(service.jobgroupList(), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }
	

	 
	@RequestMapping(value = "/jobGroup/{id2}", method = RequestMethod.GET)
	  public ResponseEntity<List<JobGroupVO>> list(@PathVariable("id2") int id2) {

	    ResponseEntity<List<JobGroupVO>> entity = null;
	    try {
	    	
	      entity = new ResponseEntity<>(service.SubJobGroup(id2), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }
	
	@RequestMapping(value = "/region/{id2}", method = RequestMethod.GET)
	  public ResponseEntity<List<RegionVO>> region(@PathVariable("id2") String id2) {

	    ResponseEntity<List<RegionVO>> entity = null;
	    try {
	    	
	      entity = new ResponseEntity<>(service.SubRegion(id2), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }
	
	 
	@RequestMapping(value="/fileUpload",method=RequestMethod.POST)
	public String fileUpload(String title, MultipartFile file,Model model,HttpServletRequest request) throws IllegalStateException, IOException{
	
		System.out.println("컨트롤러들어옴");
		
		String fileName = file.getOriginalFilename();
	String saveDir = request.getServletContext().getRealPath("fileUpload");
	System.out.println(saveDir);
	System.out.println(title);
	System.out.println(fileName);
	// String saveFile = saveDir+"\\"+file1.getOriginalFilename();
	 
	// 중복된 파일인 경우 덮어 쓰기가 되기 때문에 중복 방지 처리를 해 줘야 한다.
//	File fileObj
//	// = new File(saveFile);
//	// = new File(saveDir,file1.getOriginalFilename());
//	 
//	// 중복된 파일 방지 처리를 한 파일 객체를 사용 한다.
//	= DuplicateFile.getFile(saveDir, file);
//	 
//	file.transferTo(fileObj);
//	model.addAttribute("title",title);
//	model.addAttribute("file",file);
//	model.addAttribute("fileName",fileName);
//	model.addAttribute("serverFileName",fileObj.getName());
//	return "fileUpload";
	return "hi";
	}//fileUploadForm()
	 
	}
	



