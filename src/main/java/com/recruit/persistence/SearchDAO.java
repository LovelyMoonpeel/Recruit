package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.RecruitVO;
import com.recruit.domain.ResumeVO;

public interface SearchDAO {

	public List<RecruitVO> selectRecruits(String skey) throws Exception;

	public List<ResumeVO> selectResumes(String skey) throws Exception;
}
