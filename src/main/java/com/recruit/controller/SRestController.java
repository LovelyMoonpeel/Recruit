package com.recruit.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.recruit.domain.CUserVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.PUserVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
import com.recruit.domain.SpanelVO;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;
import com.recruit.service.SearchService;

@RestController
@RequestMapping("/sresult")
public class SRestController {

	@Inject
	private SearchService searchService;

	@Inject
	private CompanyService companyService;

	@Inject
	private CompanyAjaxService companyAjaxService;

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String sayHello() throws Exception {
		return "Hello Spring";
	}

	@RequestMapping(value = "/pusers", method = RequestMethod.GET)
	public ResponseEntity<List<PUserVO>> listPUserAll() {

		ResponseEntity<List<PUserVO>> entity = null;
		try {
			entity = new ResponseEntity<>(searchService.selectPUserAll(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/pusers/{skey}", method = RequestMethod.GET)
	public ResponseEntity<List<PUserVO>> listPUser(@PathVariable("skey") String skey) {

		System.out.println("Skey: " + skey);
		ResponseEntity<List<PUserVO>> entity = null;
		try {
			entity = new ResponseEntity<>(searchService.selectPUsers(skey), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/cusers", method = RequestMethod.GET)
	public ResponseEntity<List<CUserVO>> listCUserAll() {

		ResponseEntity<List<CUserVO>> entity = null;
		try {
			List<CUserVO> cList = searchService.selectCUserAll();
			System.out.println(cList);
			entity = new ResponseEntity<>(searchService.selectCUserAll(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/cusers/{skey}", method = RequestMethod.GET)
	public ResponseEntity<List<CUserVO>> listCUser(@PathVariable("skey") String skey) {

		System.out.println("Skey: " + skey);
		ResponseEntity<List<CUserVO>> entity = null;
		try {
			entity = new ResponseEntity<>(searchService.selectCUsers(skey), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/jobg", method = RequestMethod.GET)
	public ResponseEntity<List<JobGroupVO>> jobgroup() {

		ResponseEntity<List<JobGroupVO>> entity = null;
		try {
			entity = new ResponseEntity<>(companyAjaxService.jobgroupList(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/jobg/{jobg2}", method = RequestMethod.GET)
	public ResponseEntity<List<JobGroupVO>> jobgroup2(@PathVariable("jobg2") String jobg2) {

		int job2 = Integer.parseInt(jobg2);

		ResponseEntity<List<JobGroupVO>> entity = null;
		try {
			entity = new ResponseEntity<>(companyAjaxService.SubJobGroup(job2), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/region", method = RequestMethod.GET)
	public ResponseEntity<List<RegionVO>> region() {

		ResponseEntity<List<RegionVO>> entity = null;
		try {
			entity = new ResponseEntity<>(companyService.RegionList(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/region/{reg2}", method = RequestMethod.GET)
	public ResponseEntity<List<RegionVO>> region2(@PathVariable("reg2") String reg2) {

		ResponseEntity<List<RegionVO>> entity = null;
		try {
			entity = new ResponseEntity<>(companyAjaxService.SubRegion(reg2), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/code/{tid}", method = RequestMethod.GET)
	public ResponseEntity<List<CodeVO>> getcode(@PathVariable("tid") int tid) {

		ResponseEntity<List<CodeVO>> entity = null;
		try {
			System.out.println("code2: ");
			System.out.println(searchService.CodeList(tid));
			entity = new ResponseEntity<>(searchService.CodeList(tid), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/recruits/{skey}", method = RequestMethod.GET)
	public ResponseEntity<List<RecruitVO>> listRecruits(@PathVariable("skey") String skey) {

		System.out.println("Skey: " + skey);
		ResponseEntity<List<RecruitVO>> entity = null;
		try {
			System.out.println(searchService.selectRecruits(skey));
			entity = new ResponseEntity<>(searchService.selectRecruits(skey), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/resumes/{skey}", method = RequestMethod.GET)
	public ResponseEntity<List<ResumeVO>> listResumes(@PathVariable("skey") String skey) {

		System.out.println("Skey: " + skey);
		ResponseEntity<List<ResumeVO>> entity = null;
		try {
			System.out.println(searchService.selectResumes(skey));
			entity = new ResponseEntity<>(searchService.selectResumes(skey), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	private List<String> sel_skeys;

	@RequestMapping(value = "/sel_search", method = RequestMethod.POST)
	public ResponseEntity<String> selectSearch(@RequestBody List<String> skeys) {

		sel_skeys = skeys;
		System.out.println("Skeys 1: " + sel_skeys);
		ResponseEntity<String> entity = null;
		try {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/sel_search/recruits", method = RequestMethod.GET)
	public ResponseEntity<List<RecruitVO>> listRecruits() {

		System.out.println("Skeys 2: " + sel_skeys);
		ResponseEntity<List<RecruitVO>> entity = null;
		try {
			System.out.println("controller: " + searchService.selectRecruits_sel(sel_skeys));
			entity = new ResponseEntity<>(searchService.selectRecruits_sel(sel_skeys), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/sel_search/resumes", method = RequestMethod.GET)
	public ResponseEntity<List<SpanelVO>> listResumes() {

		System.out.println("Skeys 2: " + sel_skeys);
		ResponseEntity<List<SpanelVO>> entity = null;
		try {
			System.out.println("controller: " + searchService.selectResumes_sel(sel_skeys));
			entity = new ResponseEntity<>(searchService.selectResumes_sel(sel_skeys), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
