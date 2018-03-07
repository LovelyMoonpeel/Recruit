package com.recruit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.RLicenseVO;

@Repository
public class RLicenseDAOImpl implements RLicenseDAO{
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.ResumeMapper";

	@Override
	public void createRLicense(RLicenseVO vo) throws Exception {
		session.insert(namespace+".createRLicense", vo);
	}

	@Override
	public RLicenseVO readRLicense(Integer id) throws Exception {
		return session.selectOne(namespace+".readRLicense", id);
	}

	@Override
	public void updateRLicense(RLicenseVO vo) throws Exception {
		session.update(namespace+".updateRLicense", vo);
	}

	@Override
	public void deleteRLicense(Integer id) throws Exception {
		session.delete(namespace+".deleteRLicense", id);
	}

}
