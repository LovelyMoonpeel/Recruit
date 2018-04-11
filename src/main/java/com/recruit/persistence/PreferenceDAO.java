package com.recruit.persistence;

import com.recruit.domain.PreferenceVO;

public interface PreferenceDAO {
	
	public PreferenceVO selectPREFOne(String id)throws Exception;
	
}
