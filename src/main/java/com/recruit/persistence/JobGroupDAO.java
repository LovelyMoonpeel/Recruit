package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.CInfoVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RegionVO;

public interface JobGroupDAO {

	public List<JobGroupVO> list(int id2) throws Exception;

	public List<JobGroupVO> jobgroupList() throws Exception;

	public List<RegionVO> SubRegion(String id2) throws Exception;
}