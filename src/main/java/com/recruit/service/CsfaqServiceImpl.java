package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CsfaqVO;
import com.recruit.persistence.CsfaqDAO;

@Service
public class CsfaqServiceImpl implements CsfaqService {

	@Inject
	private CsfaqDAO dao;

	@Override
	public void regist(CsfaqVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public CsfaqVO read(Integer bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void modify(CsfaqVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<CsfaqVO> listAll() throws Exception {
		return dao.listAll();
	}

}