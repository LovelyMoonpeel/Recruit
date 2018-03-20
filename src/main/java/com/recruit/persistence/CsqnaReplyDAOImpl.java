package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CsqnaReplyVO;

@Repository
public class CsqnaReplyDAOImpl implements CsqnaReplyDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.recruit.mapper.CsqnareplyMapper";
	
	@Override
	public List<CsqnaReplyVO> list(Integer bno) throws Exception{
		return session.selectList(namespace+".list", bno);
	}
	
	@Override
	public void create(CsqnaReplyVO vo) throws Exception{
		session.insert(namespace+".create", vo);
	}
	
	@Override
	public void update(CsqnaReplyVO vo) throws Exception{
		session.update(namespace+".update", vo);
	}
	
	@Override
	public void delete(Integer rno) throws Exception{
		session.delete(namespace+".delete", rno);
	}
	
	@Override
	public void updateReply(Integer bno) throws Exception{
		session.update(namespace+".updateReply", bno);
	}
	
	@Override
	public void deleteReply(Integer bno) throws Exception{
		session.update(namespace+".deleteReply", bno);
	}
	
	public CsqnaReplyVO read(Integer rno) throws Exception{
		return session.selectOne(namespace+".read", rno);
	}
}
