package com.recruit.service;

import java.util.List;

import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RegionVO;

public interface CompanyAjaxService {
	
	public List<JobGroupVO> SubJobGroup(int id2) throws Exception;
	
	public List<JobGroupVO> jobgroupList() throws Exception;
	
	public List<RegionVO> SubRegion(String id2) throws Exception;
}
