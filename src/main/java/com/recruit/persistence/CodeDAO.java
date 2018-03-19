package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RegionVO;

public interface CodeDAO {

	public List<CodeVO> CodeList(int tid) throws Exception;

	public CodeVO readCode(int id) throws Exception;

	public JobGroupVO selectJobGroup(int id) throws Exception;

	public RegionVO selectRegion(String rgbid, int rgsid) throws Exception;
}
