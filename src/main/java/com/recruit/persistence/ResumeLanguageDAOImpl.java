package com.recruit.persistence;

import java.util.List;

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
	public List<ResumeLanguageVO> selectResumeLanguageList(Integer rid) throws Exception {
		return session.selectList(namespace+".selectResumeLanguageList", rid);
	}

	@Override
	public void updateResumeLanguage(ResumeLanguageVO vo) throws Exception {
		session.update(namespace+".updateResumeLanguage", vo);
	}

	@Override
	public void deleteResumeLanguage(Integer id) throws Exception {
		session.delete(namespace+".deleteResumeLanguage", id);
	}

	@Override
	public void createResumeLanguage(ResumeLanguageVO vo) throws Exception {
		session.insert(namespace+".createResumeLanguage", vo);
	}
	
	@Override
	public void deleteRLangList(Integer rid) throws Exception {
		session.delete(namespace+".deleteRLangList", rid);
	}
	
	@Override
	public void createRLanguageList(Integer rid, ResumeLanguageVO plavo) throws Exception {
		plavo.setRid(rid);
		session.insert(namespace+".createResumeLanguage", plavo);
	}
}
