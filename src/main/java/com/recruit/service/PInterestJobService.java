package com.recruit.service;

import com.recruit.domain.PInterestJobVO;

public interface PInterestJobService {//안소연 사용
	
	public PInterestJobVO selectPIJOne(PInterestJobVO pijvo) throws Exception;
	
	public void insertPIJOne(PInterestJobVO pijvo) throws Exception;
	
	public void deletePIJOne(PInterestJobVO pijvo) throws Exception;
}
