package com.recruit.service;

import java.util.List;
import com.recruit.domain.CRecruitVO;

public interface CRecruitService {
	
	public List<CRecruitVO> selectCRList(String id)throws Exception;
	
	public List<CRecruitVO> selectAPList(String id)throws Exception;

	public CRecruitVO selectCROne(int bno)throws Exception;

}
