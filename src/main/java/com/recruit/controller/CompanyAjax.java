package com.recruit.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
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
}