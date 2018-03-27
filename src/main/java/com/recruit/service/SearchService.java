package com.recruit.service;

import java.util.List;

import com.recruit.domain.CUserVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.PUserVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.ResumeVO;
import com.recruit.domain.SpanelVO;

public interface SearchService {

	public PUserVO selectPUser(String skeyword) throws Exception;

	public List<PUserVO> selectPUserAll() throws Exception;

	public List<PUserVO> selectPUsers(String skey) throws Exception;

	public CUserVO selectCUser(String skeyword) throws Exception;

	public List<CUserVO> selectCUserAll() throws Exception;

	public List<CUserVO> selectCUsers(String skey) throws Exception;

	public List<CodeVO> CodeList(int tid) throws Exception;

	public List<SpanelVO> selectRecruits(String skey) throws Exception;

	public List<SpanelVO> selectResumes(String skey) throws Exception;

	public List<SpanelVO> selectRecruits_sel(List<String> sel_skeys) throws Exception;

	public List<SpanelVO> selectResumes_sel(List<String> sel_skeys) throws Exception;

	public List<SpanelVO> selectRecruitsAll(int snum) throws Exception;

	public List<SpanelVO> selectResumesAll(int snum) throws Exception;

	public String codeToName(String scode) throws Exception;

	public List<Integer> selectJobCode() throws Exception;
}
