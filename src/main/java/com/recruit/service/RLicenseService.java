package com.recruit.service;

import com.recruit.domain.RLicenseVO;

public interface RLicenseService {
	
	public void regist(RLicenseVO vo)throws Exception;
	
	public RLicenseVO read(Integer id)throws Exception;
	
	public void modify(RLicenseVO vo)throws Exception;
	
	public void remove(Integer id)throws Exception;

	public void createRLicense(RLicenseVO rlvo)throws Exception;


}
