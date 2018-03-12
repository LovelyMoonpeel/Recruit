package com.recruit.service;

import com.recruit.domain.PTelVO;

public interface PTelService {
	
	public void regist(PTelVO vo)throws Exception;
	
	public PTelVO read(Integer id)throws Exception;
	
	public void modify(PTelVO vo)throws Exception;
	
	public void remove(Integer id)throws Exception;

	public void createPTel(PTelVO vo)throws Exception;

	
}
