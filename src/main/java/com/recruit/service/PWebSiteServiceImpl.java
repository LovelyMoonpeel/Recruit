package com.recruit.service;

import java.util.List;

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
	public List<PWebSiteVO> selectPWebSiteList(Integer rid) throws Exception {
		return dao.selectPWebSiteList(rid);
	}

	@Override
	public void modify(PWebSiteVO vo) throws Exception {
		dao.updatePWebSite(vo);
	}

	@Override
	public void remove(Integer id) throws Exception {
		dao.deletePWebSite(id);
	}

	@Override
	public void createPWebSite(PWebSiteVO vo) throws Exception{
		dao.createPWebSite(vo);
	}


}
