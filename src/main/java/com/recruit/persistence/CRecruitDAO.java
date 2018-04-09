package com.recruit.persistence;

import java.util.List;
import com.recruit.domain.CRecruitVO;

public interface CRecruitDAO {

	public List<CRecruitVO> selectCRList(String id)throws Exception;
	
	public List<CRecruitVO> selectCRList_ongoing(String id)throws Exception;
	
	public List<CRecruitVO> selectCRList_closed(String id)throws Exception;

	public List<CRecruitVO> selectAPList(String id, String order_value)throws Exception;
	
	public List<CRecruitVO> selectAPList_ongoing(String id)throws Exception;
	
	public List<CRecruitVO> selectAPList_closed(String id)throws Exception;

	public CRecruitVO selectCROne(int bno)throws Exception;

}
