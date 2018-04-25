package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CsVO;
import com.recruit.persistence.CsDAO;

@Service
public class CsServiceImpl implements CsService {

	@Inject
	private CsDAO dao;

	@Override
	public void regist(CsVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public CsVO read(Integer bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void modify(CsVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<CsVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public void noticeCreate(CsVO vo) throws Exception{
		dao.noticeCreate(vo);
	}

	@Override
	public CsVO noticeRead(Integer bno) throws Exception{
		return dao.noticeRead(bno);
	}

	public void noticeUpdate(CsVO vo) throws Exception{
		dao.noticeUpdate(vo);
	}

	public void noticeDelete(Integer bno) throws Exception{
		dao.noticeDelete(bno);
	}

	public List<CsVO> noticeListAll() throws Exception{
		return dao.noticeListAll();
	}
}