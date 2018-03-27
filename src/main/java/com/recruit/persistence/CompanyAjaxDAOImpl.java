package com.recruit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CInterestPersonVO;
import com.recruit.domain.CPersonInfoVO;
import com.recruit.domain.CompanyCriteria;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;

@Repository
public class CompanyAjaxDAOImpl implements CompanyAjaxDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace ="com.recruit.mapper.CompanyMapper";
	
	@Override
	public List<JobGroupVO> list(int id2)throws Exception{
		return session.selectList(namespace + ".ajaxSubJobgroup", id2);
	}
	
	@Override
	public List<JobGroupVO> jobgroupList() throws Exception{
		return session.selectList(namespace + ".jobgroupList");
	}
	
	
	@Override
	public List<RegionVO> SubRegion(String id2) throws Exception{
		return session.selectList(namespace + ".ajaxsubRegion", id2);
	}
	@Override
	public List<RecruitVO> RecruitList(String id, int page) throws Exception{
		System.out.println("jobDAO부분 id : "+id);
		
		if(page <= 0){
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		HashMap<String,Object> pp = new HashMap<>();
		
		pp.put("id", id);
		pp.put("page", page);
		
		return session.selectList(namespace + ".ajaxRecruitList", pp);
	}
	@Override
	public List<RecruitVO> IngRecruitList(CompanyCriteria cri,String id) throws Exception{
		
		HashMap<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("id", id);	
		paraMap.put("perPageNum", cri.getPerPageNum());
		paraMap.put("pageStart", cri.getPageStart());
		
		
		return session.selectList(namespace + ".ajaxIngRecruitList", paraMap);
	}
	@Override
	public List<RecruitVO> EndRecruitList(CompanyCriteria cri, String id) throws Exception{
		
		HashMap<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("id", id);	
		paraMap.put("perPageNum", cri.getPerPageNum());
		paraMap.put("pageStart", cri.getPageStart());
		
		return session.selectList(namespace + ".ajaxEndRecruitList", paraMap);
	}
	@Override
	public List<RecruitVO> SearchList(CompanyCriteria cri,String id, String srchTxt)throws Exception{
		
		HashMap<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("id", id);	
		paraMap.put("perPageNum", cri.getPerPageNum());
		paraMap.put("pageStart", cri.getPageStart());
		paraMap.put("srchTxt", srchTxt);
		System.out.println(id);
		System.out.println(cri.getPerPageNum());
		System.out.println(cri.getPageStart());
		System.out.println(srchTxt);
		return session.selectList(namespace + ".ajaxSearchList", paraMap);
	}
	
	@Override
	public List<RecruitVO> IngSearchList(CompanyCriteria cri,String id, String srchTxt)throws Exception{
		
		HashMap<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("id", id);	
		paraMap.put("perPageNum", cri.getPerPageNum());
		paraMap.put("pageStart", cri.getPageStart());
		paraMap.put("srchTxt", srchTxt);
		System.out.println(id);
		System.out.println(cri.getPerPageNum());
		System.out.println(cri.getPageStart());
		System.out.println(srchTxt);
		return session.selectList(namespace + ".ajaxIngSearchList", paraMap);
	}
	
	@Override
	public List<RecruitVO> EndSearchList(CompanyCriteria cri,String id, String srchTxt)throws Exception{
		
		HashMap<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("id", id);	
		paraMap.put("perPageNum", cri.getPerPageNum());
		paraMap.put("pageStart", cri.getPageStart());
		paraMap.put("srchTxt", srchTxt);
		System.out.println(id);
		System.out.println(cri.getPerPageNum());
		System.out.println(cri.getPageStart());
		System.out.println(srchTxt);
		return session.selectList(namespace + ".ajaxEndSearchList", paraMap);
	}
	
	@Override
	public List<CPersonInfoVO> PersonRecomList(int bno) throws Exception{
		return session.selectList(namespace + ".ajaxPersonRecomList", bno);
	}
	
	@Override
	public void FavorPersonAdd(int bno, String id) throws Exception{
			
		HashMap<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("bno", bno);
		paraMap.put("id", id);
		

	 session.insert(namespace + ".ajaxFavorPersonAdd" , paraMap);
	}
	
	@Override
	public void FavorPersonDelete(int bno, String id) throws Exception{	
		
		HashMap<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("bno", bno);
		paraMap.put("id", id);
			
	 session.insert(namespace + ".ajaxFavorPersonDelete" , paraMap);
	}

	@Override
	public List<RecruitVO> RecruitCriteria(CompanyCriteria cri, String id) throws Exception {
		
		HashMap<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("id", id);	
		paraMap.put("perPageNum", cri.getPerPageNum());
		paraMap.put("pageStart", cri.getPageStart());
		
		
		return session.selectList(namespace+".recruitCriteria",paraMap);
	}
	

}