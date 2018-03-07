package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;

@Repository
public class JobGroupDAOImpl implements JobGroupDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace ="com.recruit.mapper.CompanyMapper";
	
	@Override
	public List<JobGroupVO> list(int id2)throws Exception{
		return session.selectList(namespace + ".list", id2);
	}
	
	@Override
	public List<JobGroupVO> jobgroupList() throws Exception{
		return session.selectList(namespace + ".jobgroupList");
	}
	
	
	@Override
	public List<RegionVO> SubRegion(String id2) throws Exception{
		return session.selectList(namespace + ".subRegion", id2);
	}
	@Override
	public List<RecruitVO> RecruitList1(String id) throws Exception{
		System.out.println("jobDAO부분 id : "+id);
		return session.selectList(namespace + ".recruitListt", id);
	}
}