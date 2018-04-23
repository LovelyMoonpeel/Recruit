package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.PUserVO;

public interface PUserDAO {

	public PUserVO selectPUser(String id) throws Exception;

	public void updatePUser(PUserVO vo) throws Exception;

	public List<PUserVO> selectPUserAll() throws Exception;
	
	public List<PUserVO> selectPUsers(String skey) throws Exception;

	public int pwmodify(PUserVO vo) throws Exception;
	
	public void leavePUser(String id) throws Exception;
}
