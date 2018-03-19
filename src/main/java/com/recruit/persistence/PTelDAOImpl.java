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
	public void createTOne(PTelVO ptvo) throws Exception {
		session.insert(namespace+".createTOne", ptvo);
	}
	
	@Override//write 페이지에서 쓴다.
	public void createTOneoflist(Integer bno, PTelVO ptvo) throws Exception {
		ptvo.setRid(bno);
		session.insert(namespace+".createTOne", ptvo);
	}

	@Override
	public List<PTelVO> selectPTelList(Integer bno) throws Exception {
		return session.selectList(namespace+".selectPTelList", bno);
	}

	@Override
	public void updateTOne(Integer ptvoid) throws Exception {
		session.update(namespace+".updateTOne", ptvoid);
	}

	@Override
	public void deleteTOne(Integer id) throws Exception {
		session.delete(namespace+".deleteTOne", id);
	}
	
	@Override
	public void deleteTList(Integer rid) throws Exception {
		session.delete(namespace+".deleteTList", rid);
	}

}
