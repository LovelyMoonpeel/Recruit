package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.PTelVO;
import com.recruit.domain.PUserVO;

@Repository
public class PTelDAOImpl implements PTelDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.ResumeMapper";

	@Override
	public void createPTel(PTelVO ptvo) throws Exception {
		session.insert(namespace+".createPTel", ptvo);
	}

	@Override
	public List<PTelVO> selectPTelList(Integer bno) throws Exception {
		return session.selectList(namespace+".selectPTelList", bno);
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
