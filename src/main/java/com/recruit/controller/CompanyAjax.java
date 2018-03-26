package com.recruit.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.BoardVO;
import com.recruit.domain.CPersonInfoVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.PApplyVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;
import com.recruit.service.PApplyService;





@RestController
@RequestMapping("/companyAjax")
public class CompanyAjax {

	@Inject
	private CompanyAjaxService service;
	@Inject
	private CompanyService jobService;
	@Inject
	private PApplyService papService;
	
	
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
	public ResponseEntity<List<RecruitVO>> RecruitList(HttpSession session, Model model){
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<RecruitVO>> entity = null;
		
		if (login != null) {
			
			
			String id = login.getId();
			
			try {
				entity = new ResponseEntity<>(service.RecruitList(id), HttpStatus.OK);
				System.out.println("컨트롤러 제네릭 : "+entity.toString());
				
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		}
		return entity;
		
	}
	
	@RequestMapping(value = "/ingRecruitList/",method = RequestMethod.GET)
	public ResponseEntity<List<RecruitVO>> IngRecruitList(HttpSession session, Model model){
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<RecruitVO>> entity = null;
		
		if (login != null) {
			
			String id = login.getId();
			
			try {
				entity = new ResponseEntity<>(service.IngRecruitList(id), HttpStatus.OK);
				System.out.println(entity.getBody().get(0));
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		}
		return entity;
		
	}
	
	
	@RequestMapping(value = "/endRecruitList/",method = RequestMethod.GET)
	public ResponseEntity<List<RecruitVO>> EndRecruitList(HttpSession session, Model model){
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<RecruitVO>> entity = null;
		
		if (login != null) {
			
			String id = login.getId();
			
			try {
				entity = new ResponseEntity<>(service.EndRecruitList(id), HttpStatus.OK);
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		}
		return entity;
		
	}
	
	@RequestMapping(value = "/applycheck", method = RequestMethod.POST)//소연
	public ResponseEntity<String> applycheckPOST(@RequestBody PApplyVO pavo){
		System.out.println("아 applycheck POST CONTROLLER");
		ResponseEntity<String> entity = null;
		try{
			//실행하고 싶은 서비스 실행
			System.out.println(pavo.getPid() + "가 지원한 " + pavo.getRsno() + "번째 이력서" + pavo.getRcno() + "번 채용공고");
			System.out.println("아아"+papService.selectAPOne(pavo));
			
			//select 해서 null이면 true
			if(papService.selectAPOne(pavo)==null){//지원한 적 없을 때
				System.out.println("true if문으로 들어옴");
				entity = new ResponseEntity<String>("TRUE", HttpStatus.OK);
			}else{//지원한 적 있을 때
				System.out.println("false if문으로 들어옴");
				entity = new ResponseEntity<String>("FALSE", HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		System.out.println("return entity : " + entity);
		return entity;
	}
	
	@RequestMapping(value = "/clipping", method = RequestMethod.POST)// 소연
	public ResponseEntity<String> clippingPOST(@RequestBody int rcbno, @RequestBody String userid) throws Exception {
		System.out.println("clipping POST CONTROLLER");
		
		String cid = jobService.RecruitInfoRead2(rcbno).getCid();
		
		ResponseEntity<String> entity = null;
		
		System.out.println("rcbno : " + rcbno + "userid : " + userid);
		try{
			/*if(papService.selectIJOne(pavo)==null){//지원한 적 없을 때
				System.out.println("true if문으로 들어옴");
				entity = new ResponseEntity<String>("TRUE", HttpStatus.OK);
			}else{//지원한 적 있을 때
				System.out.println("false if문으로 들어옴");
				entity = new ResponseEntity<String>("FALSE", HttpStatus.OK);
			}*/
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		System.out.println("return entity : " + entity);
		return entity;
	}
}
	 
