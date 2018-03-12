package com.recruit.service;

import java.util.List;

import com.recruit.domain.ResumeLanguageVO;

public interface ResumeLanguageService {
	
	public void regist(ResumeLanguageVO vo)throws Exception;
	
	public List<ResumeLanguageVO> selectResumeLanguage(Integer rid)throws Exception;
	
	public void modify(ResumeLanguageVO vo)throws Exception;
	
	public void remove(Integer id)throws Exception;

	public void createResumeLanguage(ResumeLanguageVO rlangVO)throws Exception;

	
}
