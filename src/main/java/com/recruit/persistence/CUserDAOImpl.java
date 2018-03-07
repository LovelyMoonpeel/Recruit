package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CUserVO;
import com.recruit.domain.PUserVO;

@Repository
public class CUserDAOImpl implements CUserDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.CUserMapper";

	@Override
	public CUserVO selectCUser(String id) throws Exception {
		return session.selectOne(namespace + ".selectCuser", id);
	}

	@Override
	public void updateCUser(CUserVO vo) throws Exception {
		session.update(namespace + ".updateCUser", vo);
	}

	@Override
	public List<CUserVO> selectCUserAll() throws Exception {
		return session.selectList(namespace + ".selectCUserAll");
	}

	@Override
	public List<CUserVO> selectCUsers(String skey) throws Exception {
		return session.selectList(namespace + ".selectCUsers", skey);
	}
}
