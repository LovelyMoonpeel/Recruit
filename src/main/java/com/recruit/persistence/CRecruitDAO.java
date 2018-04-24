package com.recruit.persistence;

import java.util.List;
import com.recruit.domain.CRecruitVO;
import com.recruit.domain.PersonalCriteriaVO;

public interface CRecruitDAO {

	public List<CRecruitVO> selectCRList(PersonalCriteriaVO cri, String order_value)throws Exception;
	
	public List<CRecruitVO> selectCRList_ongoing(String id, String order_value)throws Exception;
	
	public List<CRecruitVO> selectCRList_closed(String id, String order_value)throws Exception;

	public List<CRecruitVO> selectAPList(String id, String order_value)throws Exception;
	
	public List<CRecruitVO> selectAPList_ongoing(String id, String order_value)throws Exception;
	
	public List<CRecruitVO> selectAPList_closed(String id, String order_value)throws Exception;

	public CRecruitVO selectCROne(int bno)throws Exception;

}
