package com.recruit.service;

import java.util.List;

import com.recruit.domain.PTelVO;

public interface PTelService {
	
	public void regist(PTelVO vo)throws Exception;
	
	public List<PTelVO> selectPTelList(Integer bno)throws Exception;
	
	public void modify(PTelVO vo)throws Exception;
	
	public void remove(Integer id)throws Exception;

	public void createPTel(PTelVO vo)throws Exception;

	
}
