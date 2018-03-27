package com.recruit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.BoardVO;
import com.recruit.domain.CPersonInfoVO;
import com.recruit.domain.CompanyCriteria;
import com.recruit.domain.CompanyPageMaker;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;





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
	@RequestMapping(value = "/personList/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<CPersonInfoVO>> personList(@PathVariable("bno") int bno, Model model){
	
		ResponseEntity<List<CPersonInfoVO>> entity = null;
		
		
		try {
			entity = new ResponseEntity<>(service.PersonRecomList(bno), HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/favorList/", method = RequestMethod.GET)
	public ResponseEntity<List<CPersonInfoVO>> favList(HttpSession session, Model model){
		
		
		ResponseEntity<List<CPersonInfoVO>> entity = null;
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		
		String id = login.getId();
		try {
			entity = new ResponseEntity<>(jobService.FavorList(id), HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;	
	}
	

	@RequestMapping(value = "/favorAdd/{bno}/{id}",method = RequestMethod.GET)
	public void faverAdd(@PathVariable("bno") int bno, @PathVariable("id") String id, RedirectAttributes rttr) throws Exception{
		service.FavorPersonAdd(bno, id);
	}
	
	@RequestMapping(value ="favorDelete/{bno}/{id}",method = RequestMethod.GET)
	public void favorDelete(@PathVariable("bno") int bno, @PathVariable("id") String id, RedirectAttributes rttr)throws Exception{
		service.FavorPersonDelete(bno, id);
	}
	
	@RequestMapping(value = "/favorDeleteRestart/{bno}",method = RequestMethod.GET)
	public String faverDeleteRestart(HttpSession session, @PathVariable("bno") int bno,  RedirectAttributes rttr) throws Exception{
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		
		if (login != null) {
			
			String id = login.getId();
			System.out.println(id+""+bno);
			service.FavorPersonDelete(bno, id);
			
			rttr.addFlashAttribute("msg", "DELESUCCESS");
			
			return "/company/C_favor";

		} 
			else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
		
	
}

	@RequestMapping(value = "/recruitList/",method = RequestMethod.GET)
	public ResponseEntity<List<Object>> RecruitList(@ModelAttribute("cri") CompanyCriteria cri, int page, HttpSession session, Model model){
		
		
		cri.setPage(page);
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<Object>> entity = null;
		
		if (login != null) {
			
			
			String id = login.getId();
			
			try {
				System.out.println("cri는 = "+cri);
				System.out.println("cri.toString은 = "+cri.toString());
//				List<RecruitVO> a = service.RecruitCriteria(cri);
				List<RecruitVO> a = service.RecruitCriteria(cri,id);
				List<Object> b = new ArrayList<Object>();
				
				for(int i =0; i<a.size(); i++){
					b.add((Object)(a.get(i)));
					
				}
				
				CompanyPageMaker pageMaker = new CompanyPageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(131);
//				pageMaker.setTotalCount(service.listSearchCount(cri));
				System.out.println(pageMaker);
				b.add(pageMaker);
				
				entity = new ResponseEntity<>(b, HttpStatus.OK);

		
//				model.addAttribute("pageMaker",pageMaker);
//				
				System.out.println("출력됨 : "+entity.toString());
				
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				System.out.println("출력안됨 : "+entity.toString());
			}
			
		}
		return entity;
		
	}
	
	
	@RequestMapping(value = "/ingRecruitList/",method = RequestMethod.GET)
	public ResponseEntity<List<Object>> IngRecruitList(@ModelAttribute("cri") CompanyCriteria cri, HttpSession session,  int page, Model model){
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<Object>> entity = null;
		
		if (login != null) {
			
			cri.setPage(page);
			
			String id = login.getId();
			
			try {
				
				List<RecruitVO> a = service.IngRecruitList(cri,id);
				List<Object> b = new ArrayList<Object>();
				
				for(int i =0; i<a.size(); i++){
					b.add((Object)(a.get(i)));
					
				}
				
				CompanyPageMaker pageMaker = new CompanyPageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(131);
				b.add(pageMaker);

				entity = new ResponseEntity<>(b, HttpStatus.OK);
				
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		}
		return entity;
		
	}
	
	
	@RequestMapping(value = "/endRecruitList/",method = RequestMethod.GET)
	public ResponseEntity<List<Object>> EndRecruitList(@ModelAttribute("cri") CompanyCriteria cri, int page, HttpSession session, Model model){
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<Object>> entity = null;
		
		if (login != null) {
			
			String id = login.getId();
			cri.setPage(page);
			try {
				
				List<RecruitVO> a = service.EndRecruitList(cri,id);
				List<Object> b = new ArrayList<Object>();
				
				for(int i =0; i<a.size(); i++){
					b.add((Object)(a.get(i)));
					
				}
				
				CompanyPageMaker pageMaker = new CompanyPageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(131);
				
				b.add(pageMaker);
				

				
				entity = new ResponseEntity<>(b, HttpStatus.OK);
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		}
		return entity;
		
	}
	
	@RequestMapping(value="/searchList/",method = RequestMethod.GET)
		public ResponseEntity<List<Object>> serachList(@ModelAttribute("cri") CompanyCriteria cri, int page, String srchTxt, HttpSession session, Model model){
			
			BoardVO login = (BoardVO) session.getAttribute("login");
			ResponseEntity<List<Object>> entity = null;
			
	
			
			if (login != null) {
				
				String id = login.getId();
				cri.setPage(page);
				try {
					
					List<RecruitVO> a = service.SerachList(cri,id,srchTxt);
					List<Object> b = new ArrayList<Object>();
					
					for(int i =0; i<a.size(); i++){
						b.add((Object)(a.get(i)));
						
					}
					
					CompanyPageMaker pageMaker = new CompanyPageMaker();
					pageMaker.setCri(cri);
					pageMaker.setTotalCount(131);
					
					b.add(pageMaker);
					

					
					entity = new ResponseEntity<>(b, HttpStatus.OK);
					
				} catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				}
				
			}
			return entity;		
	}
	
	@RequestMapping(value="/ingSearchList/",method = RequestMethod.GET)
	public ResponseEntity<List<Object>> ingSerachList(@ModelAttribute("cri") CompanyCriteria cri, int page, String srchTxt, HttpSession session, Model model){
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<Object>> entity = null;
		

		
		if (login != null) {
			
			String id = login.getId();
			cri.setPage(page);
			try {
				
				List<RecruitVO> a = service.IngSerachList(cri,id,srchTxt);
				List<Object> b = new ArrayList<Object>();
				
				for(int i =0; i<a.size(); i++){
					b.add((Object)(a.get(i)));
					
				}
				
				CompanyPageMaker pageMaker = new CompanyPageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(131);
				
				b.add(pageMaker);
				

				
				entity = new ResponseEntity<>(b, HttpStatus.OK);
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		}
		return entity;		
}
	
	@RequestMapping(value="/endSearchList/",method = RequestMethod.GET)
	public ResponseEntity<List<Object>> EndSerachList(@ModelAttribute("cri") CompanyCriteria cri, int page, String srchTxt, HttpSession session, Model model){
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<Object>> entity = null;
		

		
		if (login != null) {
			
			String id = login.getId();
			cri.setPage(page);
			try {
				
				List<RecruitVO> a = service.EndSerachList(cri,id,srchTxt);
				List<Object> b = new ArrayList<Object>();
				
				for(int i =0; i<a.size(); i++){
					b.add((Object)(a.get(i)));
					
				}
				
				CompanyPageMaker pageMaker = new CompanyPageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(131);
				
				b.add(pageMaker);
				

				
				entity = new ResponseEntity<>(b, HttpStatus.OK);
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		}
		return entity;		
}
	
	
}
	 
