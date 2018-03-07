package com.recruit.service;

import com.recruit.domain.ResumeEduVO;

public interface ResumeEduService {

public void regist(ResumeEduVO vo)throws Exception;
	
	public ResumeEduVO read(Integer bno)throws Exception;
	
	public void modify(ResumeEduVO vo)throws Exception;
	
	public void remove(Integer bno)throws Exception;
}
