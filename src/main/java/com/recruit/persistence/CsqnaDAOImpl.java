package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CsqnaCriteria;
import com.recruit.domain.CsqnaVO;

@Repository
public class CsqnaDAOImpl implements CsqnaDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.csqnaMapper";

	@Override
	public void create(CsqnaVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public CsqnaVO read(Integer bno) throws Exception {
		return session.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(CsqnaVO vo) throws Exception {
		System.out.println("DAO test : "+vo);
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public List<CsqnaVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		session.update(namespace + ".updateViewCnt", bno);
	}

	@Override
	public int countPaging(CsqnaCriteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<CsqnaVO> listCriteria(CsqnaCriteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

}