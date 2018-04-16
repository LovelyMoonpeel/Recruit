package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CoordinateVO;
import com.recruit.domain.PreferenceVO;
import com.recruit.persistence.PreferenceDAO;

@Service
public class PreferenceServiceImpl implements PreferenceService {
	
	@Inject
	private PreferenceDAO dao;
	
	@Override
	public PreferenceVO selectPREFOne(String id)throws Exception{
		return dao.selectPREFOne(id);
	}
	
	@Override
	public CoordinateVO selectCodeCoordinate(int bno)throws Exception{
		return dao.selectCodeCoordinate(bno);
	}
	
}
