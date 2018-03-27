package com.recruit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.PApplyVO;
import com.recruit.domain.PInterestJobVO;

@Repository
public class PInterestJobDAOImpl implements PInterestJobDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.PIneterestJobMapper";

	@Override
	public PInterestJobVO selectPIJOne(PInterestJobVO pijvo) throws Exception{
		return session.selectOne(namespace+".selectPIJOne", pijvo);
	}
	
	@Override
	public void insertPIJOne(PInterestJobVO pijvo) throws Exception{
		System.out.println("그 다오 PInterestJobDAO insert: " + pijvo.getUserid() + "그리고" +pijvo.getRcbno());
		session.insert(namespace+".insertPIJOne", pijvo);
	}
	
	@Override
	public void deletePIJOne(PInterestJobVO pijvo)throws Exception{
		System.out.println("그 다오 PInterestJobDAO delete: " + pijvo.getUserid() + "그리고" +pijvo.getRcbno());
		session.delete(namespace + ".deletePIJOne", pijvo);
	}
}
