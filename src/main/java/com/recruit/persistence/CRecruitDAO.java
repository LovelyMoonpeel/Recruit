package com.recruit.persistence;

import java.util.List;
import com.recruit.domain.CRecruitVO;

public interface CRecruitDAO {
	
	public  List<CRecruitVO> selectCRList(String id)throws Exception;
	
	public  List<CRecruitVO> selectAPList(String id)throws Exception;
	
	public CRecruitVO selectCROne(int bno)throws Exception;
	
}
