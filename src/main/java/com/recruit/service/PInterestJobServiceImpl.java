package com.recruit.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.recruit.domain.PInterestJobVO;
import com.recruit.persistence.PInterestJobDAO;

@Service
public class PInterestJobServiceImpl implements PInterestJobService{

	@Inject
	private PInterestJobDAO dao;	

	@Override
	public PInterestJobVO selectPIJOne(PInterestJobVO pijvo) throws Exception{
		return dao.selectPIJOne(pijvo);
	}
	
	@Override
	public void insertPIJOne(PInterestJobVO pijvo) throws Exception{
		dao.insertPIJOne(pijvo);
	}

	@Override
	public void deletePIJOne(PInterestJobVO pijvo) throws Exception{
		dao.deletePIJOne(pijvo);
	}

}
