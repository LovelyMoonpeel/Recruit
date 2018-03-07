package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.PWebSiteVO;
import com.recruit.persistence.PWebSiteDAO;

@Service
public class PWebSiteServiceImpl implements PWebSiteService{

	@Inject
	private PWebSiteDAO dao;
	
	@Override
	public void regist(PWebSiteVO vo) throws Exception {
		dao.createPWebSite(vo);
	}

	@Override
	public PWebSiteVO read(Integer id) throws Exception {
		return dao.readPWebSite(id);
	}

	@Override
	public void modify(PWebSiteVO vo) throws Exception {
		dao.updatePWebSite(vo);
	}

	@Override
	public void remove(Integer id) throws Exception {
		dao.deletePWebSite(id);
	}

}
