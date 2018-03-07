package com.recruit.persistence;

import com.recruit.domain.ResumeEduVO;

public interface ResumeEduDAO {
	
	public void createResumeEdu(ResumeEduVO vo)throws Exception;
	
	public ResumeEduVO readResumeEdu(Integer bno)throws Exception;
	
	public void updateResumeEdu(ResumeEduVO vo)throws Exception;
	
	public void deleteResumeEdu(Integer bno)throws Exception;
	
}
