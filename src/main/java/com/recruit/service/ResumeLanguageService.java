package com.recruit.service;

import com.recruit.domain.ResumeLanguageVO;

public interface ResumeLanguageService {
	
	public void regist(ResumeLanguageVO vo)throws Exception;
	
	public ResumeLanguageVO read(Integer id)throws Exception;
	
	public void modify(ResumeLanguageVO vo)throws Exception;
	
	public void remove(Integer id)throws Exception;
	
}
