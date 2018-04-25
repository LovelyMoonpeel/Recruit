package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.PUserVO;

@Repository
public class PUserDAOImpl implements PUserDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.PUserMapper";

	@Override
	public PUserVO selectPUser(String id) throws Exception {
		return session.selectOne(namespace + ".selectPUser", id);
	}

	@Override
	public void updatePUser(PUserVO vo) throws Exception {
		session.update(namespace + ".updatePUser", vo);
	}

	@Override
	public List<PUserVO> selectPUserAll() throws Exception {
		return session.selectList(namespace + ".selectPUserAll");
	}

	@Override
	public List<PUserVO> selectPUsers(String skey) throws Exception {
		System.out.println("test001");
		return session.selectList(namespace + ".selectPUsers", skey);
	}

	@Override
	public int pwmodify(PUserVO vo) throws Exception {
		return session.update(namespace + ".pwmodify", vo);
	}

	@Override
	public void leavePUser(String id) throws Exception {
		session.delete(namespace + ".leavePUser", id);
	}
}
