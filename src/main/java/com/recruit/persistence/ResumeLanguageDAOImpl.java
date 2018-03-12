package com.recruit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.ResumeLanguageVO;

@Repository
public class ResumeLanguageDAOImpl implements ResumeLanguageDAO{
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.ResumeMapper";

	@Override
	public void createResumeLanguage(ResumeLanguageVO vo) throws Exception {
		session.insert(namespace+".createResumeLanguage", vo);
	}

	@Override
	public ResumeLanguageVO readResumeLanguage(Integer id) throws Exception {
		return session.selectOne(namespace+".readResumeLanguage", id);
	}

	@Override
	public void updateResumeLanguage(ResumeLanguageVO vo) throws Exception {
		session.update(namespace+".updateResumeLanguage", vo);
	}

	@Override
	public void deleteResumeLanguage(Integer id) throws Exception {
		session.delete(namespace+".deleteResumeLanguage", id);
	}

	
}
