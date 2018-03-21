package com.recruit.service;

import java.util.List;

import com.recruit.domain.ResumeEduVO;

public interface ResumeEduService {

public void regist(ResumeEduVO vo)throws Exception;
	
	public ResumeEduVO read(Integer bno)throws Exception;
	
	public void modify(ResumeEduVO vo)throws Exception;
	
	public void remove(Integer bno)throws Exception;

	public void createResumeEdu(ResumeEduVO vo)throws Exception;
	
	// r.code 03/13 추가
		public List<ResumeEduVO> readResumeEduList(Integer bno) throws Exception;

		public void changeResumeEduList(Integer resumenum, List<ResumeEduVO> resumeEduVOList) throws Exception;
}
