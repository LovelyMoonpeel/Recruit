package com.recruit.persistence;

import com.recruit.domain.PWebSiteVO;

public interface PWebSiteDAO {

	public void createPWebSite(PWebSiteVO vo)throws Exception;
	
	public PWebSiteVO readPWebSite(Integer id)throws Exception;
	
	public void updatePWebSite(PWebSiteVO vo)throws Exception;
	
	public void deletePWebSite(Integer id)throws Exception;
}
