package com.recruit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.ResumeCareerVO;


@Repository
public class ResumeCareerDAOImpl implements ResumeCareerDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.ResumeMapper";

	@Override
	public void createResumeCareer(ResumeCareerVO vo) throws Exception {
		session.insert(namespace+".createResumeCareer", vo);
	}

	@Override
	public ResumeCareerVO readResumeCareer(Integer bno) throws Exception {
		return session.selectOne(namespace+".readResumeCareer", bno);
	}

	@Override
	public void updateResumeCareer(ResumeCareerVO vo) throws Exception {
		session.update(namespace+".updateResumeCareer", vo);
	}

	@Override
	public void deleteResumeCareer(Integer bno) throws Exception {
		session.delete(namespace+".deleteResumeCareer", bno);
	}

}
