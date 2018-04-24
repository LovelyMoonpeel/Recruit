package com.recruit.service;

import java.util.List;
import com.recruit.domain.CRecruitVO;
import com.recruit.domain.PersonalCriteriaVO;

public interface CRecruitService {
	
	public int countPaging(PersonalCriteriaVO cri)throws Exception;
	
	public int countPaging_ongoing(PersonalCriteriaVO cri)throws Exception;
	
	public int countPaging_closed(PersonalCriteriaVO cri)throws Exception;
	
	public int countPaging_AP(PersonalCriteriaVO cri)throws Exception;
		
	public int countPaging_AP_ongoing(PersonalCriteriaVO cri)throws Exception;
	
	public int countPaging_AP_closed(PersonalCriteriaVO cri)throws Exception;
	
	public List<CRecruitVO> selectCRList(PersonalCriteriaVO cri, String order_value)throws Exception;
	
	public List<CRecruitVO> selectCRList_ongoing(PersonalCriteriaVO cri, String order_value)throws Exception;
	
	public List<CRecruitVO> selectCRList_closed(PersonalCriteriaVO cri, String order_value)throws Exception;
	
	public List<CRecruitVO> selectAPList(PersonalCriteriaVO cri, String order_value)throws Exception;
	
	public List<CRecruitVO> selectAPList_ongoing(PersonalCriteriaVO cri, String order_value)throws Exception;
	
	public List<CRecruitVO> selectAPList_closed(PersonalCriteriaVO cri, String order_value)throws Exception;

	public CRecruitVO selectCROne(int bno)throws Exception;

}
