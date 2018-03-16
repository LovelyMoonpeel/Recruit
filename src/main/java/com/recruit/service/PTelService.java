package com.recruit.service;

import java.util.List;

import com.recruit.domain.PTelVO;

public interface PTelService {
	
	public void createTOne(PTelVO ptvo)throws Exception;
	
	public List<PTelVO> selectPTelList(Integer bno)throws Exception;
	
	public void updateTOne(Integer ptvoid)throws Exception;
	
	public void deleteTOne(Integer id)throws Exception;
	
	public void updateTList(Integer rid, List<PTelVO> PTelVOlist) throws Exception;
	
}
