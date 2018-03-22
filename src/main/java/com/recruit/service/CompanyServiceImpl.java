package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.CInfoVO;
import com.recruit.domain.CInterestPersonVO;
import com.recruit.domain.CPersonInfoVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
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
	 public List<RecruitVO> RecruitList(String id) throws Exception{
			
		 return dao.RecruitList(id);
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
	 public List<RecruitVO> RecomList(String id) throws Exception{
			
		 return dao.RecomList(id);
	 }
	 
	 @Transactional
	 @Override
	 public RecruitVO RecruitInfoRead(int recruitNum) throws Exception{

		 System.out.println("service넘어옴 값은 = "+recruitNum);
		 
		 System.out.println("출력값은 : " + dao.RecruitInfoRead(recruitNum));
		 
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
	 @Override
	 public List<CPersonInfoVO> FavorList(String id) throws Exception{
		 
		 return dao.FavorList(id);
		 
	 }
	 @Override
	 public List<RecruitVO> cinfoRecruitList(String id) throws Exception{
		 
		 return dao.cinfoRecruitList(id);
	 }

	@Override
	public void RecruitModify(RecruitVO recruitModify) throws Exception {
		
		dao.RecruitModify(recruitModify);
	}
	@Override
	public RecruitVO RecruitModifyRead(int bno, String id)throws Exception{
		System.out.println("출력결과는 : " +dao.RecruitModifyRead(bno,id));
		return dao.RecruitModifyRead(bno,id);
	}

	@Override
	public void RecruitRemove(int bno, String id) throws Exception {
		
		dao.RecruitRemove(bno ,id);
	}

	@Override
	public List<ResumeVO> ApplyList(int recruitNum) throws Exception {
		
		return dao.ApplyList(recruitNum);
	}

	 @Override
		public List<CInterestPersonVO> FavorCompareList(String id) throws Exception {
			
			return dao.FavorCompareList(id);
		}
	 
	 @Override
	 public List<CPersonInfoVO> CInfoRecruitList(String id)throws Exception{
		 
		 return dao.CInfoRecruitList(id);
	 }
	  

}