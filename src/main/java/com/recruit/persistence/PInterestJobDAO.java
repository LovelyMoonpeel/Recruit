package com.recruit.persistence;

import com.recruit.domain.PInterestJobVO;

public interface PInterestJobDAO {
	
	public PInterestJobVO selectPIJOne(PInterestJobVO pijvo) throws Exception;
	
	public void insertPIJOne(PInterestJobVO pijvo) throws Exception;
	
	public void deletePIJOne(PInterestJobVO pijvo) throws Exception;
}
