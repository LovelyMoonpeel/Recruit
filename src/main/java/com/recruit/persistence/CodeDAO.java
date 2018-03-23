package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RegionVO;

public interface CodeDAO {

	public List<CodeVO> CodeList(int tid) throws Exception;

	public CodeVO readCode(String id) throws Exception;

	public JobGroupVO selectJobGroup(String id) throws Exception;

	public RegionVO selectRegion(String rgbid, String rgsid) throws Exception;

	public String codeToJobName(String code) throws Exception;

	public String codeToRegName(String code) throws Exception;

	public String codeToCodName(String code) throws Exception;
}
