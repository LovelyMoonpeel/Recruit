package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.ResumeLanguageVO;

public interface ResumeLanguageDAO {
	
	public void createResumeLanguage(ResumeLanguageVO vo)throws Exception;
	
	public List<ResumeLanguageVO> selectResumeLanguageList(Integer rid)throws Exception;
	
	public void updateResumeLanguage(ResumeLanguageVO vo)throws Exception;
	
	public void deleteResumeLanguage(Integer id)throws Exception;
	
}
