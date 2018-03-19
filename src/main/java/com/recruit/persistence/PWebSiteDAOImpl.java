package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.PTelVO;
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
	public List<PWebSiteVO> selectPWebSiteList(Integer rid) throws Exception {
		return session.selectList(namespace+".selectPWebSiteList", rid);
	}

	@Override
	public void updatePWebSite(PWebSiteVO vo) throws Exception {
		session.update(namespace+".updatePWebSite", vo);
	}

	@Override
	public void deletePWebSite(Integer id) throws Exception {
		session.delete(namespace+".deletePWebSite", id);
	}
	
	@Override
	public void deleteWList(Integer rid)throws Exception{
		session.delete(namespace+".deleteWList", rid);
	}
	
	@Override
	public void createOneoflist(Integer bno, PWebSiteVO pwvo) throws Exception {
		pwvo.setRid(bno);
		session.insert(namespace+".createPWebSite", pwvo);
	}
	
}
