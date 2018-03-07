package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.RecruitVO;
import com.recruit.domain.ResumeVO;

@Repository
public class SearchDAOImpl implements SearchDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.recruit.mapper.SearchMapper";
	
	public List<RecruitVO> selectRecruits(String skey) throws Exception {
		return session.selectList(namespace + ".selectRecruits", skey);
	}

	public List<ResumeVO> selectResumes(String skey) throws Exception {
		return session.selectList(namespace + ".selectResumes", skey);
	}
}
