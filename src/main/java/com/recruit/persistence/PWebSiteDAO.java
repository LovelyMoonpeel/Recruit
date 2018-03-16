package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.PWebSiteVO;

public interface PWebSiteDAO {

	public void createPWebSite(PWebSiteVO vo)throws Exception;
	
	public List<PWebSiteVO> selectPWebSiteList(Integer rid)throws Exception;
	
	public void updatePWebSite(PWebSiteVO vo)throws Exception;
	
	public void deletePWebSite(Integer id)throws Exception;
	
	public void deleteWList(Integer rid)throws Exception;
}
