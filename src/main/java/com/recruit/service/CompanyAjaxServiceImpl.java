package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CInterestPersonVO;
import com.recruit.domain.CPersonInfoVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
import com.recruit.persistence.CompanyAjaxDAO;

@Service
public class CompanyAjaxServiceImpl implements CompanyAjaxService{

	@Inject
	private CompanyAjaxDAO dao;
	
	
	@Override
	public List<JobGroupVO> SubJobGroup(int id2) throws Exception{
		
		return dao.list(id2);
	}

	 @Override
	 public List<JobGroupVO> jobgroupList() throws Exception{
		 
		 return dao.jobgroupList();
	 }
	 

	 @Override
	 public List<RegionVO> SubRegion(String id2) throws Exception{
		 
		 return dao.SubRegion(id2);
	 }
	 @Override
	 public List<RecruitVO> RecruitList1(String id) throws Exception{
		 System.out.println(id);
		 return dao.RecruitList1(id);
	 }

	 @Override
	 public List<CPersonInfoVO> PersonRecomList(int bno) throws Exception{
	 	return dao.PersonRecomList(bno);
	 }
	 
	 @Override
	 public void FavorPersonAdd(int bno, String id) throws Exception{
		 dao.FavorPersonAdd(bno, id);
	 }
	 @Override
	 public void FavorPersonDelete(int bno, String id) throws Exception{
		 dao.FavorPersonDelete(bno, id);
	 }
	 
	
}