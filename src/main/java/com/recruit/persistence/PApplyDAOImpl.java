package com.recruit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.PApplyVO;

@Repository
public class PApplyDAOImpl implements PApplyDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.PApplyMapper";

	@Override
	public void createAPOne(PApplyVO pavo) throws Exception {
		session.insert(namespace+".createAPOne", pavo);
	}
	
}
