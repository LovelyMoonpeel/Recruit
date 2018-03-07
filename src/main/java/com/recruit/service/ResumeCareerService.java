package com.recruit.service;

import com.recruit.domain.ResumeCareerVO;

public interface ResumeCareerService {
	
	public void regist(ResumeCareerVO vo)throws Exception;
	
	public ResumeCareerVO read(Integer bno)throws Exception;
	
	public void modify(ResumeCareerVO vo)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
}
