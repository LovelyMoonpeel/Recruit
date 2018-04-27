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
	
	@Override
	public PApplyVO selectAPOne(PApplyVO pavo)throws Exception{
		return session.selectOne(namespace + ".selectAPOne", pavo);
	}
	
	@Override
	public String readornotAPOne(PApplyVO pavo)throws Exception{
		return session.selectOne(namespace + ".readornotAPOne", pavo);
	}
	
	@Override
	public void CreadAPOne(PApplyVO pavo)throws Exception{
		session.update(namespace + ".CreadAPOne", pavo);
	}
	
	@Override
	public void deleteAPOne(PApplyVO pavo)throws Exception{
		session.update(namespace + ".deleteAPOne", pavo);
	}
	
	@Override
	public void updateAPOne(PApplyVO pavo)throws Exception{
		session.update(namespace + ".updateAPOne", pavo);
	}
}
