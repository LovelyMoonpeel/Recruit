package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.PTelVO;
import com.recruit.persistence.PTelDAO;

@Service
public class PTelServiceImpl implements PTelService{

	@Inject
	private PTelDAO dao;	
	
	@Override
	public void regist(PTelVO vo) throws Exception {
		dao.createPTel(vo);
	}

	@Override
	public PTelVO read(Integer id) throws Exception {
		return dao.readPTel(id);
	}

	@Override
	public void modify(PTelVO vo) throws Exception {
		dao.updatePTel(vo);
	}

	@Override
	public void remove(Integer id) throws Exception {
		dao.deletePTel(id);
	}

}
