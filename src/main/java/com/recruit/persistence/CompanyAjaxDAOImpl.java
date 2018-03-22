package com.recruit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CInterestPersonVO;
import com.recruit.domain.CPersonInfoVO;
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
		return session.selectList(namespace + ".ajaxubRegion", id2);
	}
	@Override
	public List<RecruitVO> RecruitList(String id) throws Exception{
		System.out.println("jobDAO부분 id : "+id);
		return session.selectList(namespace + ".ajaxRecruitList", id);
	}
	@Override
	public List<RecruitVO> IngRecruitList(String id) throws Exception{
		System.out.println("jobDAO부분 id : "+id);
		return session.selectList(namespace + ".ajaxIngRecruitList", id);
	}
	@Override
	public List<RecruitVO> EndRecruitList(String id) throws Exception{
		System.out.println("jobDAO부분 id : "+id);
		return session.selectList(namespace + ".ajaxEndRecruitList", id);
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
	

}