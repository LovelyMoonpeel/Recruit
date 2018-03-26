package com.recruit.service;

import com.recruit.domain.PUserVO;

public interface PUserService {
	
	public PUserVO selectPUser(String id)throws Exception;
	
	public void updatePUser(PUserVO vo)throws Exception;

	public int pwmodify(PUserVO vo) throws Exception;
}
