package com.recruit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.PreferenceVO;

@Repository
public class PreferenceDAOImpl implements PreferenceDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.PreferenceMapper";

	@Override
	public PreferenceVO selectPREFOne(String id)throws Exception{
		return session.selectOne(namespace + ".selectPREFOne", id);
	}
}
