package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.ResumeCareerVO;

public interface ResumeCareerDAO {

	public void createResumeCareer(ResumeCareerVO vo) throws Exception;

	public ResumeCareerVO readResumeCareer(Integer bno) throws Exception;

	public void updateResumeCareer(ResumeCareerVO vo) throws Exception;

	public void deleteResumeCareer(Integer bno) throws Exception;

	// r.code 03/14 추가
	public List<ResumeCareerVO> readResumeCareerList(Integer bno) throws Exception;
	
	public void deleteResumeCareerList(Integer resumenum) throws Exception;
}
