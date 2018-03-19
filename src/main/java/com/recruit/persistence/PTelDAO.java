package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.PTelVO;

public interface PTelDAO {

	public void createTOne(PTelVO ptvo)throws Exception;
	
	public void createTOneoflist(Integer bno, PTelVO ptvo)throws Exception;
	
	public List<PTelVO> selectPTelList(Integer bno)throws Exception;
	
	public void updateTOne(Integer ptvoid)throws Exception;
	
	public void deleteTOne(Integer id)throws Exception;
	
	public void deleteTList(Integer rid) throws Exception;
	
}
