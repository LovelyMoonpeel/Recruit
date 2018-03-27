package com.recruit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
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

	private static final Logger logger = LoggerFactory.getLogger(SRestController.class);

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

	// A.getAllList 전체검색
	// A-1.recruit 로딩
	@RequestMapping(value = "/recruitsall/{snum}", method = RequestMethod.GET)
	public ResponseEntity<List<SpanelVO>> listRecruitAll(@PathVariable("snum") int snum) {

		System.out.println("snum: " + snum);
		ResponseEntity<List<SpanelVO>> entity = null;
		try {
			// List<SpanelVO> cList = searchService.selectRecruitsAll();
			// System.out.println(cList);
			entity = new ResponseEntity<>(searchService.selectRecruitsAll(snum), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// A-2.resume 로딩
	@RequestMapping(value = "/resumesall/{snum}", method = RequestMethod.GET)
	public ResponseEntity<List<SpanelVO>> listResumeAll(@PathVariable("snum") int snum) {

		ResponseEntity<List<SpanelVO>> entity = null;
		try {
			// List<SpanelVO> pList = searchService.selectResumesAll();
			// System.out.println(pList);
			entity = new ResponseEntity<>(searchService.selectResumesAll(snum), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// B.getList 키워드 검색
	// B-1.recruit 로딩
	@RequestMapping(value = "/recruits/{skey}", method = RequestMethod.GET)
	public ResponseEntity<List<SpanelVO>> listRecruits(@PathVariable("skey") String skey) {

		System.out.println("Skey: " + skey);
		ResponseEntity<List<SpanelVO>> entity = null;
		try {
			System.out.println(searchService.selectRecruits(skey));
			entity = new ResponseEntity<>(searchService.selectRecruits(skey), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// B-2.resume 로딩
	@RequestMapping(value = "/resumes/{skey}", method = RequestMethod.GET)
	public ResponseEntity<List<SpanelVO>> listResumes(@PathVariable("skey") String skey) {
		System.out.println("Skey: " + skey);
		ResponseEntity<List<SpanelVO>> entity = null;
		try {
			System.out.println(searchService.selectResumes(skey));
			entity = new ResponseEntity<>(searchService.selectResumes(skey), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// C.getList_sel 필터 검색
	// C-1.필터 전역변수
	private List<String> sel_scodes;

	// C-2.필터코드 저장
	@RequestMapping(value = "/sel_search", method = RequestMethod.POST)
	public ResponseEntity<String> selectSearch(@RequestBody List<String> scodes) {
		int num = scodes.size();
		for (int i = 0; i < num; i++) {
			String scode = scodes.get(i);
			System.out.println("Scode: " + scode);
			scodes.set(i, convertJob1to2(scode));
		}
		sel_scodes = scodes;
		System.out.println("Scodes 1: " + sel_scodes);
		ResponseEntity<String> entity = null;
		try {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 임시코드변경 메소드 (직무 1차 분류 > 2차 전체)
	public String convertJob1to2(String scode) {

		System.out.println("Scode: " + scode);
		try {
			List<Integer> jobcode = searchService.selectJobCode();
			// Job
			if ("J".equals(scode.substring(0, 1)) && scode.length() > 1) {
				int jnum = Integer.parseInt(scode.substring(1));
				if (jnum < jobcode.get(0))
					scode = "J" + (jobcode.get(jnum - 1));
			}
		} catch (Exception e) {
		}

		// Region
		// if ("R".equals(scode.substring(0, 1)) && scode.length() == 2)
		// scode = scode + "99";
		return scode;
	}

	// C-3.recruit 로딩
	@RequestMapping(value = "/sel_search/recruits", method = RequestMethod.GET)
	public ResponseEntity<List<SpanelVO>> listRecruits() {

		System.out.println("Scodes 2: " + sel_scodes);
		ResponseEntity<List<SpanelVO>> entity = null;
		try {
			System.out.println("controller: " + searchService.selectRecruits_sel(sel_scodes));
			entity = new ResponseEntity<>(searchService.selectRecruits_sel(sel_scodes), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// C-4.resume 로딩
	@RequestMapping(value = "/sel_search/resumes", method = RequestMethod.GET)
	public ResponseEntity<List<SpanelVO>> listResumes() {

		System.out.println("Scodes 2: " + sel_scodes);
		ResponseEntity<List<SpanelVO>> entity = null;
		try {
			System.out.println("controller: " + searchService.selectResumes_sel(sel_scodes));
			entity = new ResponseEntity<>(searchService.selectResumes_sel(sel_scodes), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// D.code list 받기
	// D-1.job1 code
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

	// D-2.job2 code
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

	// D-3.region1 code
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

	// D-4.region2 code
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

	// D-5.code table
	@RequestMapping(value = "/code/{tid}", method = RequestMethod.GET)
	public ResponseEntity<List<CodeVO>> getCode(@PathVariable("tid") int tid) {

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

	@RequestMapping(value = "/scode/{scode}", method = RequestMethod.GET)
	public ResponseEntity<List<String>> getScode(@PathVariable("scode") String scode) {

		ResponseEntity<List<String>> entity = null;
		try {
			List<String> scodeList = new ArrayList<String>();
			System.out.println("scodes: " + scode);
			scodeList.add(searchService.codeToName(convertJob1to2(scode)));
			System.out.println("scodeList: " + scodeList);
			// entity = new ResponseEntity<>("scodes", HttpStatus.OK);
			entity = new ResponseEntity<>(scodeList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
