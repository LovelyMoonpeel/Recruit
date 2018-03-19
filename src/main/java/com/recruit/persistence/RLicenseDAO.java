package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.RLicenseVO;

public interface RLicenseDAO {
	
	public void createRLicense(RLicenseVO vo)throws Exception;
	
	public List<RLicenseVO> selectRLicenseList(Integer bno)throws Exception;
	
	public void updateRLicense(RLicenseVO vo)throws Exception;
	
	public void deleteRLicense(Integer id)throws Exception;
	
	public void deleteRLicenseList(Integer rid)throws Exception;
		
	public void createRLicenseOneoflist(Integer rid, RLicenseVO plivo)throws Exception;
	
}
