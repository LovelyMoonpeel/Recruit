package com.recruit.service;

import java.util.List;
import com.recruit.domain.CInfoVO;
import com.recruit.domain.CInterestPersonVO;
import com.recruit.domain.CPersonInfoVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
import com.recruit.domain.RecruitVO;



public interface CompanyService {

	  public CInfoVO CompanyInfoRead(String id) throws Exception;

	  public void CompanyInfoModify(CInfoVO CInfo) throws Exception;
	  
	  public List<CodeVO> CodeList() throws Exception;
	  
	  public List<RegionVO> RegionList() throws Exception;
	  
	  public void RecruitWrite(RecruitVO recruitWrtie) throws Exception;
	 
	  public List<RecruitVO> RecruitList(String id) throws Exception; // 여러곳에서 사용함
	  
	  public List<RecruitVO> RecomList(String id) throws Exception;
	  
	  public RecruitVO RecruitInfoRead(int recruitNum) throws Exception;
	  
	  public RecruitVO RecruitInfoRead2(int recruitNum) throws Exception;
	  
	  public RecruitVO RecruitInfoRead3(int recruitNum) throws Exception;

	  public List<CPersonInfoVO> FavorList(String id) throws Exception;
	  
	  public List<RecruitVO> cinfoRecruitList(String id) throws Exception;
	  
	  public void RecruitModify(RecruitVO recruitModify) throws Exception;
	
	  public RecruitVO RecruitModifyRead(int bno, String id)throws Exception;
	  
	  public void RecruitReRegister(String id, int bno, int day)throws Exception;
	  
	  public void RecruitRemove(int bno, String id)throws Exception;
	  
	  public List<ResumeVO> ApplyList(int recruitNum)throws Exception;
	  
	  public List<CInterestPersonVO> FavorCompareList(String id)throws Exception;
	  
	  public List<CPersonInfoVO> CInfoRecruitList(String id)throws Exception;
	  
	  public void C_RecruitExtension(String id, int bno)throws Exception;
}
