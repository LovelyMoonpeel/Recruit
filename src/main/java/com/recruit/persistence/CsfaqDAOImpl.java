package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CsfaqVO;

@Repository
public class CsfaqDAOImpl implements CsfaqDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.csfaqMapper";

	@Override
	public void create(CsfaqVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public CsfaqVO read(Integer bno) throws Exception {
		return session.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(CsfaqVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public List<CsfaqVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

}