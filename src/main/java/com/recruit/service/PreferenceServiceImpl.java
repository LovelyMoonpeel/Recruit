package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.PreferenceVO;
import com.recruit.persistence.PreferenceDAO;

@Service
public class PreferenceServiceImpl implements PreferenceService {
	
	@Inject
	private PreferenceDAO dao;
	
	public PreferenceVO selectPREFOne(String id)throws Exception{
		return dao.selectPREFOne(id);
	}
}
