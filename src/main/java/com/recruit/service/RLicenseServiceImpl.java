package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.RLicenseVO;
import com.recruit.persistence.RLicenseDAO;

@Service
public class RLicenseServiceImpl implements RLicenseService{

	@Inject
	private RLicenseDAO dao;
	
	@Override
	public void regist(RLicenseVO vo) throws Exception {
		dao.createRLicense(vo);
	}

	@Override
	public RLicenseVO read(Integer id) throws Exception {
		return dao.readRLicense(id);
	}

	@Override
	public void modify(RLicenseVO vo) throws Exception {
		dao.updateRLicense(vo);
	}

	@Override
	public void remove(Integer id) throws Exception {
		dao.deleteRLicense(id);
	}

}
