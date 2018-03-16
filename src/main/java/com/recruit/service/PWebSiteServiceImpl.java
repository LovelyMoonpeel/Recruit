package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.PTelVO;
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
	
	@Transactional
	@Override
	public void updateWList(Integer rid, List<PWebSiteVO> pwebsitesvolist) throws Exception {

		dao.deleteWList(rid);
		//레주메 번호에 해당하는 모든 Web을 지운다.
		
		if (pwebsitesvolist != null) {
			for (int i = 0; i < pwebsitesvolist.size(); i++)
				dao.createPWebSite(pwebsitesvolist.get(i));
		}
	}
}
