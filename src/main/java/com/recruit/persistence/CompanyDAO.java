package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.CInfoVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.ImgVO;

public interface CompanyDAO {

	public CInfoVO CompanyInfoRead(String id)throws Exception;
	
	public void CompanyInfoUpdate(CInfoVO CInfo) throws Exception;
	
	public List<CodeVO> CodeList() throws Exception;
	
	public List<RegionVO> RegionList() throws Exception;
	
	public void RecruitWrite(RecruitVO recruitWrtie) throws Exception;
	
	public List<RecruitVO> RecruitList(String id) throws Exception;
	
	public RecruitVO RecruitInfoRead(int recruitNum) throws Exception;
	
	public void updateViewCnt(int recruitNum) throws Exception;
	
	public RecruitVO RecruitInfoRead3(int recruitNum) throws Exception;

	public List<ResumeVO> FavorList(String id) throws Exception;
	
}
