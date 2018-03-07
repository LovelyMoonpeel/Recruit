package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CRecruitVO;
import com.recruit.persistence.CRecruitDAO;

@Service
public class CRecruitServiceImpl implements CRecruitService {
	
	@Inject
	private CRecruitDAO dao;
	
	@Override
	public List<CRecruitVO> selectCRList(String id)throws Exception{
		return dao.selectCRList(id);
	};
	
	@Override
	public List<CRecruitVO> selectAPList(String id)throws Exception{
		return dao.selectAPList(id);
	};
	
	@Override
	public CRecruitVO selectCROne(int bno)throws Exception{
		return dao.selectCROne(bno);
	};
	

}
