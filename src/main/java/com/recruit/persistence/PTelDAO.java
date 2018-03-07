package com.recruit.persistence;

import com.recruit.domain.PTelVO;

public interface PTelDAO {

	public void createPTel(PTelVO vo)throws Exception;
	
	public PTelVO readPTel(Integer id)throws Exception;
	
	public void updatePTel(PTelVO vo)throws Exception;
	
	public void deletePTel(Integer id)throws Exception;

}
