package com.recruit.service;

import java.util.List;

import com.recruit.domain.CRecruitVO;
import com.recruit.domain.CoordinateVO;
import com.recruit.domain.PreferenceVO;
import com.recruit.domain.ResumeVO;

public interface PreferenceService {
	
	//5가지에 대한 선호도
	public PreferenceVO selectPREFOne(String id)throws Exception;
	
	//5가지에 대한 선호도 udpate
	public void updatePREFOne(PreferenceVO prefvo)throws Exception;
	
	//공개된 이력서가 있는지 확인하는 서비스
	public Integer selectPublicResume(String id)throws Exception;
	
	//해당 이력서에 대한 추천 채용공고 번호 리스트
	public List<CoordinateVO> selectCoordinateList(ResumeVO resume)throws Exception;
	
	//채용공고 번호 리스트로 채용공고 리스트 끌어오기
	public List<CoordinateVO> selectRecomendedList(List<CoordinateVO> top10, String id)throws Exception;
	
	//해당 이력서 Coordinate로 가져오기
	public CoordinateVO selectPublicResumeasCoordinateVO(Integer bno)throws Exception;
}
