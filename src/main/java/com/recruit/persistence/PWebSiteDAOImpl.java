package com.recruit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.PWebSiteVO;

@Repository
public class PWebSiteDAOImpl implements PWebSiteDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.ResumeMapper";

	@Override
	public void createPWebSite(PWebSiteVO vo) throws Exception {
		session.insert(namespace+".createPWebSite", vo);
	}

	@Override
	public PWebSiteVO readPWebSite(Integer id) throws Exception {
		return session.selectOne(namespace+".readPWebSite", id);
	}

	@Override
	public void updatePWebSite(PWebSiteVO vo) throws Exception {
		session.update(namespace+".updatePWebSite", vo);
	}

	@Override
	public void deletePWebSite(Integer id) throws Exception {
		session.delete(namespace+".deletePWebSite", id);
	}
	
	
}
