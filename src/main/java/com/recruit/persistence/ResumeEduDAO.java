package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.ResumeEduVO;

public interface ResumeEduDAO {

	public void createResumeEdu(ResumeEduVO vo) throws Exception;

	public ResumeEduVO readResumeEdu(Integer bno) throws Exception;

	public void updateResumeEdu(ResumeEduVO vo) throws Exception;

	public void deleteResumeEdu(Integer bno) throws Exception;

	// r.code 03/13 추가
	public List<ResumeEduVO> readResumeEduList(Integer bno) throws Exception;

	public void deleteResumeEduList(Integer resumenum) throws Exception;
	
}
