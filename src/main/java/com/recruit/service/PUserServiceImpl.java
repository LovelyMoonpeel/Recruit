package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.PUserVO;
import com.recruit.persistence.PUserDAO;

@Service
public class PUserServiceImpl implements PUserService {
	
	@Inject
	private PUserDAO dao;
	
	public PUserVO selectPUser(String id)throws Exception{
		return dao.selectPUser(id);
	}
	
	public void updatePUser(PUserVO vo)throws Exception{
		dao.updatePUser(vo);
	}

	@Override
	public int pwmodify(PUserVO vo) throws Exception {
		return dao.pwmodify(vo);
	}

	@Override
	public void leavePUser(String id) throws Exception {
		dao.leavePUser(id);
	}
}
