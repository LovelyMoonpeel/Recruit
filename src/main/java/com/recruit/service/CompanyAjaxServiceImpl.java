package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.CPersonInfoVO;

import com.recruit.domain.CompanyCriteria;

import com.recruit.domain.CompanySearchCriteria;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RecruitQnAVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
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
	 public List<JobGroupVO> subJobgroupList() throws Exception{
		return dao.subJobgroupList();
	}

	 @Override
	 public List<JobGroupVO> jobgroupList() throws Exception{
		 
		 return dao.jobgroupList();
	 }
	 @Override
	 public int jobGroupCount() throws Exception{
		 
		 return dao.jobGroupCount();
	 }
	 
	 @Override
	 public int regionCount() throws Exception{
		 
		 return dao.regionCount();
	 }
	 
	 @Override
	 public int appListCount(int bno) throws Exception{
		 
		 return dao.appListCount(bno);
	 }
	 
	 @Override
	 public List<RegionVO> subRegionList() throws Exception{
		 
		 return dao.subRegionList();
	 }
	 

	 @Override
	 public List<RegionVO> SubRegion(String id2) throws Exception{
		 
		 return dao.SubRegion(id2);
	 }
	 @Override
	 public void ChangeState(int bno,int state)throws Exception{
		
		 dao.ChangeState(bno,state);
	 }
	 @Override
	 public List<RecruitVO> RecruitList(String id, int page) throws Exception{

		 return dao.RecruitList(id, page);
	 }
	 @Override
	 public List<RecruitVO> RecruitCriteria(CompanySearchCriteria cri, String id)throws Exception{
		 return dao.RecruitCriteria(cri,id);
	 }
	 @Override
	 public List<RecruitVO> IngRecruitList(CompanySearchCriteria cri, String id) throws Exception{
		
		 return dao.IngRecruitList(cri, id);
	 }
	 @Override
	 public List<RecruitVO> EndRecruitList(CompanySearchCriteria cri, String id) throws Exception{
		
		 return dao.EndRecruitList(cri, id);
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
	 @Override // 관심인재 페이지네이션용 카운터
	 public int FavorListCount(String id) throws Exception{
		 return dao.FavorListCount(id);
	 }
	 @Override
	 public void endRecruit(int bno, String id) throws Exception{
		 dao.endRecruit(bno, id);
	 }
	 
	
	 @Override
	 public void QnaQuestion(RecruitQnAVO QnA)throws Exception{		
		 dao.QnaQuestion(QnA);	
	 }
	 @Override
	 public void QnaAnswer(RecruitQnAVO QnA)throws Exception{
		 
		 dao.QnaAnswer(QnA);
	 }
	 
	 @Override
		public void RecruitReRegister(String id, int bno, int day)throws Exception{
			dao.RecruitReRegister(id,bno,day);
	}
	
	 @Override
	public int recruitCriteriaCount(CompanySearchCriteria cri, String id) throws Exception {
		
		return dao.recruitCriteriaCount(cri,id);
	}

	@Override
	public int ajaxIngRecruitListCount(CompanySearchCriteria cri, String id) throws Exception {
		
		return dao.ajaxIngRecruitListCount(cri,id);
	}

	@Override
	public int ajaxEndRecruitListCount(CompanySearchCriteria cri, String id) throws Exception {
		
		return dao.ajaxEndRecruitListCount(cri,id);
	}
	 
	
}