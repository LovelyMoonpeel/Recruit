package com.recruit.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CRecruitVO;
import com.recruit.domain.CoordinateVO;
import com.recruit.domain.PreferenceVO;
import com.recruit.domain.ResumeVO;
import com.recruit.persistence.PreferenceDAO;

@Service
public class PreferenceServiceImpl implements PreferenceService {
	
	@Inject
	private PreferenceDAO dao;
	
	//5가지에 대한 선호도
	@Override
	public PreferenceVO selectPREFOne(String id)throws Exception{
		return dao.selectPREFOne(id);
	}
	
	//5가지에 대한 선호도 update
	@Override
	public void updatePREFOne(PreferenceVO prefvo)throws Exception{
		dao.updatePREFOne(prefvo);
	}	
	
	//공개된 이력서가 있는지 확인하는 서비스
	@Override
	public Integer selectPublicResume(String id)throws Exception{
		return dao.selectPublicResume(id);
	}	
		
	//해당 이력서에 대한 추천 채용공고 번호 리스트
	@Override
	public List<CoordinateVO> selectCoordinateList(ResumeVO resume)throws Exception{
		return dao.selectCoordinateList(resume);
	}
	
	//채용공고 번호 리스트로 채용공고 리스트 끌어오기
	@Override
	public List<CRecruitVO> selectRecomendedList(List<CoordinateVO> top10)throws Exception{
		
		List<CRecruitVO> real_top10 = new ArrayList<CRecruitVO>();
		
		for(int i=0;i<top10.size()-1;i++){
			real_top10.add(dao.selectRecomendedOne(top10.get(i)));
		}
		System.out.println("PreferenceServiceImpl selectRecomendedList real_top10"+ real_top10);
		return real_top10;
	}
}
