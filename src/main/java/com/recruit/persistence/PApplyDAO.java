package com.recruit.persistence;

import com.recruit.domain.PApplyVO;

public interface PApplyDAO {
	
	public void createAPOne(PApplyVO pavo)throws Exception;
	
	public PApplyVO selectAPOne(PApplyVO pavo)throws Exception;
}
