package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CsVO;

@Repository
public class CsDAOImpl implements CsDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.csMapper";

	@Override
	public void create(CsVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public CsVO read(Integer bno) throws Exception {
		return session.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(CsVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public List<CsVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public void noticeCreate(CsVO vo) throws Exception{
		session.insert(namespace+".noticeCreate", vo);
	}

	@Override
	public CsVO noticeRead(Integer bno) throws Exception{
		return session.selectOne(namespace+".noticeRead", bno);
	}

	@Override
	public void noticeUpdate(CsVO vo) throws Exception{
		session.update(namespace+".noticeUpdate", vo);
	}

	@Override
	public void noticeDelete(Integer bno) throws Exception{
		session.delete(namespace+".noticeDelete", bno);
	}

	@Override
	public List<CsVO> noticeListAll() throws Exception{
		return session.selectList(namespace+".noticeListAll");
	}
}