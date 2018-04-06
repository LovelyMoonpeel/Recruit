package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CRecruitVO;

@Repository
public class CRecruitDAOImpl implements CRecruitDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.CRecruitMapper";

	// 스크랩한 채용공고 목록 
	@Override
	public List<CRecruitVO> selectCRList(String id)throws Exception{
		return session.selectList(namespace + ".selectCRList", id);
	};

	// 스크랩한 채용공고 목록 
	@Override
	public List<CRecruitVO> selectCRList_ongoing(String id)throws Exception{
		return session.selectList(namespace + ".selectCRList_ongoing", id);
	};

	// 스크랩한 채용공고 목록 
	@Override
	public List<CRecruitVO> selectCRList_closed(String id)throws Exception{
		return session.selectList(namespace + ".selectCRList_closed", id);
	};

	//지원한 채용공고 목록
	@Override
	public List<CRecruitVO> selectAPList(String id)throws Exception{
		return session.selectList(namespace + ".selectAPList", id);
	};

	//지원한 채용공고 목록
	@Override
	public List<CRecruitVO> selectAPList_ongoing(String id)throws Exception{
		return session.selectList(namespace + ".selectAPList_ongoing", id);
	};
	
	//지원한 채용공고 목록
	@Override
	public List<CRecruitVO> selectAPList_closed(String id)throws Exception{
		return session.selectList(namespace + ".selectAPList_closed", id);
	};
	
	//스크랩한 채용공고 목록에서 선택한 채용공고 하나 확인
	@Override
	public CRecruitVO selectCROne(int bno)throws Exception{
		return session.selectOne(namespace + ".selectCROne", bno);
		//session 은 mybatis //selectOne은 DAO
	};
}
