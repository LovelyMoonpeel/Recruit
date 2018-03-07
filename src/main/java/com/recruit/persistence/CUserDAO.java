package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.CUserVO;
import com.recruit.domain.PUserVO;

public interface CUserDAO {

	public CUserVO selectCUser(String id) throws Exception;

	public void updateCUser(CUserVO vo) throws Exception;
	
	public List<CUserVO> selectCUserAll() throws Exception;
	
	public List<CUserVO> selectCUsers(String skey) throws Exception;
}
