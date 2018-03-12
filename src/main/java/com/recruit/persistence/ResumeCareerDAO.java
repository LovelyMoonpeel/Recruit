package com.recruit.persistence;

import com.recruit.domain.ResumeCareerVO;

public interface ResumeCareerDAO {

	public void createResumeCareer(ResumeCareerVO vo)throws Exception;
	
	public ResumeCareerVO readResumeCareer(Integer bno)throws Exception;
	
	public void updateResumeCareer(ResumeCareerVO vo)throws Exception;
	
	public void deleteResumeCareer(Integer bno)throws Exception;
}
