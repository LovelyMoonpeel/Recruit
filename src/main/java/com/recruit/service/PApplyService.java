package com.recruit.service;

import com.recruit.domain.PApplyVO;

public interface PApplyService {
	
	public void createAPOne(PApplyVO pavo)throws Exception;
	
	public PApplyVO selectAPOne(PApplyVO pavo)throws Exception;
}
