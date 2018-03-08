package com.recruit.service;

import com.recruit.domain.PWebSiteVO;
import com.recruit.domain.ResumeVO;

public interface PWebSiteService {
	
	public void regist(PWebSiteVO vo)throws Exception;
	
	public PWebSiteVO read(Integer id)throws Exception;
	
	public void modify(PWebSiteVO vo)throws Exception;
	
	public void remove(Integer id)throws Exception;

	
}
