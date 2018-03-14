package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.PTelVO;
import com.recruit.persistence.PTelDAO;

@Service
public class PTelServiceImpl implements PTelService{

	@Inject
	private PTelDAO dao;	
	
	@Override
	public void createTOne(PTelVO ptvo) throws Exception {
		dao.createTOne(ptvo);
	}

	@Override
	public List<PTelVO> selectPTelList(Integer bno) throws Exception {
		return dao.selectPTelList(bno);
	}

	@Override
	public void updateTOne(Integer ptvoid) throws Exception {
		//안소연
		dao.updateTOne(ptvoid);
	}

	@Override
	public void deleteTOne(Integer id) throws Exception {
		dao.deleteTOne(id);
	}
	
	
}
