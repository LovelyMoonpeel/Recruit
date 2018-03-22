package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.BoardVO;
import com.recruit.persistence.AmainDAO;

@Service
public class AmainServiceImpl implements AmainService {

	@Inject
	private AmainDAO dao;

	@Override
	public BoardVO read(String id) throws Exception {
		return dao.read(id);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(String id) throws Exception {
		dao.delete(id);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(AdminCriteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(AdminCriteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(AdminSearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(AdminSearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public BoardVO aread() throws Exception {
		return dao.aread();
	}

	@Override
	public void amodify(BoardVO vo) throws Exception {
		dao.aupdate(vo);
	}
	
	@Override
	public String readpw(BoardVO vo) throws Exception{
		return dao.readpw(vo);
	}

}