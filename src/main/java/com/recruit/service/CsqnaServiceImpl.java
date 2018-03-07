package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CsqnaCriteria;
import com.recruit.domain.CsqnaVO;
import com.recruit.persistence.CsqnaDAO;

@Service
public class CsqnaServiceImpl implements CsqnaService {

	@Inject
	private CsqnaDAO dao;

	@Override
	public void regist(CsqnaVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public CsqnaVO read(Integer bno) throws Exception {
		dao.updateViewCnt(bno);
		return dao.read(bno);
	}

	@Override
	public CsqnaVO modread(Integer bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void modify(CsqnaVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<CsqnaVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public int listCountCriteria(CsqnaCriteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<CsqnaVO> listCriteria(CsqnaCriteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

}