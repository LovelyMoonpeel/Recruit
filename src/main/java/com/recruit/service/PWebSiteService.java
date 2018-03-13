package com.recruit.service;

import java.util.List;

import com.recruit.domain.PWebSiteVO;

public interface PWebSiteService {
	
	public void regist(PWebSiteVO vo)throws Exception;
	
	public List<PWebSiteVO> selectPWebSiteList(Integer rid)throws Exception;
	
	public void modify(PWebSiteVO vo)throws Exception;
	
	public void remove(Integer id)throws Exception;

	public void createPWebSite(PWebSiteVO vo)throws Exception;

	
}
