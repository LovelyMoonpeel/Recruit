package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.PTelVO;

public interface PTelDAO {

	public void createPTel(PTelVO vo)throws Exception;
	
	public List<PTelVO> selectPTelList(Integer bno)throws Exception;
	
	public void updatePTel(PTelVO vo)throws Exception;
	
	public void deletePTel(Integer id)throws Exception;

}
