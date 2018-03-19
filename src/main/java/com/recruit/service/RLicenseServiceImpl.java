package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<RLicenseVO> selectRLicenseList(Integer bno) throws Exception {
		return dao.selectRLicenseList(bno);
	}

	@Override
	public void modify(RLicenseVO vo) throws Exception {
		dao.updateRLicense(vo);
	}

	@Override
	public void remove(Integer id) throws Exception {
		dao.deleteRLicense(id);
	}

	@Override
	public void createRLicense(RLicenseVO vo) throws Exception {
		dao.createRLicense(vo);		
	}
	
	@Transactional
	@Override
	public void updateLicenseList(Integer rid, List<RLicenseVO> rlicensevolist) throws Exception {
		
		dao.deleteRLicenseList(rid);
		//레주메 번호에 해당하는 모든 License를 지운다.

		if (rlicensevolist != null) {
			for (int i = 0; i < rlicensevolist.size(); i++){
				dao.createRLicense(rlicensevolist.get(i));
			}
		}
	}
}
