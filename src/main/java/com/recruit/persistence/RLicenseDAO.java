package com.recruit.persistence;

import com.recruit.domain.RLicenseVO;

public interface RLicenseDAO {
	
	public void createRLicense(RLicenseVO vo)throws Exception;
	
	public RLicenseVO readRLicense(Integer id)throws Exception;
	
	public void updateRLicense(RLicenseVO vo)throws Exception;
	
	public void deleteRLicense(Integer id)throws Exception;
	
}
