package com.recruit.service;

import com.recruit.domain.PApplyVO;

public interface PApplyService {
	
	public void createAPOne(PApplyVO pavo)throws Exception;
	
	public PApplyVO selectAPOne(PApplyVO pavo)throws Exception;
	
	public String readornotAPOne(PApplyVO pavo)throws Exception;
	
	public void CreadAPOne(PApplyVO pavo)throws Exception;
	
	public void deleteAPOne(PApplyVO pavo)throws Exception;
	
	public void updateAPOne(PApplyVO pavo)throws Exception;
}
