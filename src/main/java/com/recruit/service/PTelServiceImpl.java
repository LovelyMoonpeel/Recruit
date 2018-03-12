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
	public void regist(PTelVO vo) throws Exception {
		dao.createPTel(vo);
	}

	@Override
	public List<PTelVO> selectPTelList(Integer bno) throws Exception {
		return dao.selectPTelList(bno);
	}

	@Override
	public void modify(PTelVO vo) throws Exception {
		dao.updatePTel(vo);
	}

	@Override
	public void remove(Integer id) throws Exception {
		dao.deletePTel(id);
	}

	@Override
	public void createPTel(PTelVO vo) throws Exception {
		dao.createPTel(vo);
	}



}
