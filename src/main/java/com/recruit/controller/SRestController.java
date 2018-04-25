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
//장우팍 ajax
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

	// A.code list 받기
	// A-1.job1 code
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

	// A-2.job2 code
	@RequestMapping(value = "/jobg/{jobg2}", method = RequestMethod.GET)
	public ResponseEntity<List<JobGroupVO>> jobgroup2(@PathVariable("jobg2") int jobg2) {

		ResponseEntity<List<JobGroupVO>> entity = null;
		try {
			entity = new ResponseEntity<>(companyAjaxService.SubJobGroup(jobg2), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// A-3.region1 code
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

	// A-4.region2 code
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

	// A-5.code table
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

	// A-6.code to title for search filter
	@RequestMapping(value = "/scode/{scode}", method = RequestMethod.GET)
	public ResponseEntity<List<String>> getScode(@PathVariable("scode") String scode) {

		ResponseEntity<List<String>> entity = null;
		try {
			List<String> scodeList = new ArrayList<String>();
			System.out.println("scodes: " + scode);
			scodeList.add(searchService.codeToName(convertJob1to2(scode)));
			System.out.println("scodeList: " + scodeList);
			entity = new ResponseEntity<>(scodeList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// A-7.임시코드변경 메소드 (직무 1차 분류 > 2차 전체)
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
		return scode;
	}

	// B.필터 검색준비
	// B-1.필터 전역변수
	private List<String> getselCodes;

	// B-2.필터코드 저장
	@RequestMapping(value = "/getsel", method = RequestMethod.POST)
	public ResponseEntity<String> getSelCode(@RequestBody List<String> scodes) {
		int num = scodes.size();
		for (int i = 0; i < num; i++) {
			String scode = scodes.get(i);
			System.out.println("Scode: " + scode);
			scodes.set(i, convertJob1to2(scode));
		}
		getselCodes = scodes;
		System.out.println("getselCodes: " + getselCodes);
		ResponseEntity<String> entity = null;
		try {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// C.recruits 검색 (전체, 키워드, 필터)
	@RequestMapping(value = "/recruits/{getdoc}/{skey}/{pageSize}/{pageNum}", method = RequestMethod.GET)
	public ResponseEntity<List<SpanelVO>> getRecruits(@PathVariable("getdoc") String getdoc,
			@PathVariable("skey") String skey, @PathVariable("pageSize") int pageSize,
			@PathVariable("pageNum") int pageNum) {

		ResponseEntity<List<SpanelVO>> entity = null;
		List<SpanelVO> spanelVOList = null;
		try {
			System.out.println("pageSize: " + pageSize);
			System.out.println("pageNum: " + pageNum);

			if ("getkey".equals(getdoc)) {
				System.out.println("skey: " + skey);
				spanelVOList = searchService.getkeyRecruits(skey, pageSize, pageNum);
			} else { // getsel
				System.out.println("getselCodes: " + getselCodes);
				spanelVOList = searchService.getselRecruits(getselCodes, pageSize, pageNum);
			}
			System.out.println("spanelVOList: " + spanelVOList);
			System.out.println("spanelVOList.size: " + spanelVOList.size());
			entity = new ResponseEntity<>(spanelVOList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// D.resumes 검색 (전체, 키워드, 필터)
	@RequestMapping(value = "/resumes/{getdoc}/{skey}/{pageSize}/{pageNum}", method = RequestMethod.GET)
	public ResponseEntity<List<SpanelVO>> getResumes(@PathVariable("getdoc") String getdoc,
			@PathVariable("skey") String skey, @PathVariable("pageSize") int pageSize,
			@PathVariable("pageNum") int pageNum) {

		ResponseEntity<List<SpanelVO>> entity = null;
		List<SpanelVO> spanelVOList = null;
		try {
			System.out.println("pageSize: " + pageSize);
			System.out.println("pageNum: " + pageNum);

			if ("getkey".equals(getdoc)) {
				System.out.println("skey: " + skey);
				spanelVOList = searchService.getkeyResumes(skey, pageSize, pageNum);
			} else { // getsel
				System.out.println("getselCodes: " + getselCodes);
				spanelVOList = searchService.getselResumes(getselCodes, pageSize, pageNum);
			}
			entity = new ResponseEntity<>(spanelVOList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
