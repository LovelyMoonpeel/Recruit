package com.recruit.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.recruit.domain.CInfoVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.persistence.CompanyDAO;


@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Inject
	private CompanyDAO dao;
	
	@Override
	  public CInfoVO CompanyInfoRead(String id) throws Exception {
	 
		return dao.CompanyInfoRead(id);
	  }
	
	 @Override
	  public void CompanyInfoModify(CInfoVO CInfo) throws Exception {
	    dao.CompanyInfoUpdate(CInfo);
	  }
	 @Override
	 public List<CodeVO> CodeList() throws Exception{
		 
		 return dao.CodeList();
	 }
	 @Override
	 public List<RegionVO> RegionList() throws Exception{
		 
		 return dao.RegionList();
	 }
	 
	 @Override
	 public void RecruitWrite(RecruitVO recruitWrtie) throws Exception{
		 dao.RecruitWrite(recruitWrtie);
			
		 
	 }
	 @Override
	 public List<RecruitVO> RecruitList(String id) throws Exception{
//		 System.out.println("Service의 id : "+id);
			
		 return dao.RecruitList(id);
	 }
	 @Override
	 public RecruitVO RecruitInfoRead(int recruitNum) throws Exception{
//		 System.out.println("service넘어옴 값은 = "+recruitNum);
		 dao.updateViewCnt(recruitNum);
		 
		 return dao.RecruitInfoRead(recruitNum);
	 }
	 @Override
	 public RecruitVO RecruitInfoRead2(int recruitNum) throws Exception{
		 return dao.RecruitInfoRead(recruitNum);
	 }

	 @Override
	 public RecruitVO RecruitInfoRead3(int recruitNum) throws Exception{
		 return dao.RecruitInfoRead3(recruitNum);
	 } 
	 
}