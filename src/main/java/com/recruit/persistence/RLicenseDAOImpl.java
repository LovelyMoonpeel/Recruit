package com.recruit.persistence;

import java.util.List;

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
	public List<RLicenseVO> selectRLicenseList(Integer bno) throws Exception {
		return session.selectList(namespace+".selectRLicenseList", bno);
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
