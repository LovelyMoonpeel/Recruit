package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CRecruitVO;
import com.recruit.domain.CoordinateVO;
import com.recruit.domain.PreferenceVO;
import com.recruit.domain.ResumeVO;

@Repository
public class PreferenceDAOImpl implements PreferenceDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.PreferenceMapper";
	
	//5가지에 대한 선호도
	@Override
	public PreferenceVO selectPREFOne(String id)throws Exception{
		return session.selectOne(namespace + ".selectPREFOne", id);
	}
	
	//5가지에 대한 선호도 update
	@Override
	public void updatePREFOne(PreferenceVO prefvo)throws Exception{
		session.update(namespace + ".updatePREFOne", prefvo);
	}
	
	//공개된 이력서가 있는지 확인하는 서비스
	@Override
	public Integer selectPublicResume(String id)throws Exception{
		return session.selectOne(namespace + ".selectPublicResume", id);
	}	
	
	//해당 이력서에 대한 추천 채용공고 리스트
	@Override
	public List<CoordinateVO> selectCoordinateList(ResumeVO resume)throws Exception{
	//	System.out.println("DAO에서 받은 이력서 번호"+resume.getBno());
		return session.selectList(namespace + ".selectCoordinateList", resume);
	}
	
	/*//채용공고 번호 리스트로 채용공고 리스트 끌어오기
	@Override
	public List<CRecruitVO> selectRecomendedList(List<CoordinateVO> top10)throws Exception{
		return session.selectList(namespace + ".selectRecomendedList", top10);
	}*/
	
	//채용공고 번호 리스트로 채용공고 리스트 끌어오기
	@Override
	public CoordinateVO selectRecomendedOne(CoordinateVO top10)throws Exception{
		return session.selectOne(namespace + ".selectRecomendedOne", top10);
	}
	
	//해당 이력서 Coordinate로 가져오기
	@Override
	public CoordinateVO selectPublicResumeasCoordinateVO(Integer bno)throws Exception{
		return session.selectOne(namespace + ".selectPublicResumeasCoordinateVO", bno);
	}
}
