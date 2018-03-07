package com.recruit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.PTelVO;

@Repository
public class PTelDAOImpl implements PTelDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.ResumeMapper";

	@Override
	public void createPTel(PTelVO vo) throws Exception {
		session.insert(namespace+".createPTel", vo);
	}

	@Override
	public PTelVO readPTel(Integer id) throws Exception {
		
		return session.selectOne(namespace+".readPTel", id);
	}

	@Override
	public void updatePTel(PTelVO vo) throws Exception {
		session.update(namespace+".updatePTel", vo);
	}

	@Override
	public void deletePTel(Integer id) throws Exception {
		session.delete(namespace+".deletePTel", id);
	}
	

}
