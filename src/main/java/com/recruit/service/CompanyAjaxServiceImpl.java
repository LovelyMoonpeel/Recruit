package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RegionVO;
import com.recruit.persistence.JobGroupDAO;

@Service
public class CompanyAjaxServiceImpl implements CompanyAjaxService {

	@Inject
	private JobGroupDAO dao;

	@Override
	public List<JobGroupVO> SubJobGroup(int id2) throws Exception {
		return dao.list(id2);
	}

	@Override
	public List<JobGroupVO> jobgroupList() throws Exception {
		return dao.jobgroupList();
	}

	@Override
	public List<RegionVO> SubRegion(String id2) throws Exception {
		return dao.SubRegion(id2);
	}
}