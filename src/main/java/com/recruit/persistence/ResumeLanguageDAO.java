package com.recruit.persistence;

import com.recruit.domain.ResumeLanguageVO;

public interface ResumeLanguageDAO {
	
	public void createResumeLanguage(ResumeLanguageVO vo)throws Exception;
	
	public ResumeLanguageVO readResumeLanguage(Integer id)throws Exception;
	
	public void updateResumeLanguage(ResumeLanguageVO vo)throws Exception;
	
	public void deleteResumeLanguage(Integer id)throws Exception;
	
}
