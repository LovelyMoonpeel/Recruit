package com.recruit.service;

import java.util.List;

import com.recruit.domain.ResumeCareerVO;

public interface ResumeCareerService {

	public void regist(ResumeCareerVO vo) throws Exception;

	public ResumeCareerVO read(Integer bno) throws Exception;

	public void modify(ResumeCareerVO vo) throws Exception;

	public void remove(Integer bno) throws Exception;

	public void createResumeCareer(ResumeCareerVO rcvo) throws Exception;

	// r.code 03/14 추가
	public List<ResumeCareerVO> readResumeCareerList(Integer bno) throws Exception;

	// r.code 03/15 추가
	public void changeResumeCareerList(Integer resumenum, List<ResumeCareerVO> resumeCareerVOList) throws Exception;
	
	public void createResumeCareerList(Integer resumenum, List<ResumeCareerVO> resumeCareerVOList) throws Exception;
}
