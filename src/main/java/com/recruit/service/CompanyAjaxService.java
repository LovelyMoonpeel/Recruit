package com.recruit.service;

import java.util.List;

import com.recruit.domain.CInfoVO;
import com.recruit.domain.CInterestPersonVO;
import com.recruit.domain.CPersonInfoVO;
import com.recruit.domain.CompanyCriteria;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;

public interface CompanyAjaxService {

	public List<JobGroupVO> SubJobGroup(int id2) throws Exception;
	
	  
	 public List<JobGroupVO> jobgroupList() throws Exception;
	 
 
	 public List<RegionVO> SubRegion(String id2) throws Exception;
	 
	 public List<RecruitVO> RecruitList(String id, int page) throws Exception;
	 
	 public List<RecruitVO> RecruitCriteria(CompanyCriteria cri)throws Exception;	
	 
	 public List<RecruitVO> IngRecruitList(String id) throws Exception;
	 
	 public List<RecruitVO> EndRecruitList(String id) throws Exception;
	 
	 public List<CPersonInfoVO> PersonRecomList(int bno) throws Exception;
	 
	 public void FavorPersonAdd(int bno, String id) throws Exception;
	 
	 public void FavorPersonDelete(int bno, String id) throws Exception;
	 
	
}
