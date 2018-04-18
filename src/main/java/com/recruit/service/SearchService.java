package com.recruit.service;

import java.util.List;

import com.recruit.domain.CUserVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.PUserVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.SpanelVO;

public interface SearchService {

	public PUserVO selectPUser(String skeyword) throws Exception;

	public List<PUserVO> selectPUserAll() throws Exception;

	public List<PUserVO> selectPUsers(String skey) throws Exception;

	public CUserVO selectCUser(String skeyword) throws Exception;

	public List<CUserVO> selectCUserAll() throws Exception;

	public List<CUserVO> selectCUsers(String skey) throws Exception;

	public List<CodeVO> CodeList(int tid) throws Exception;

	public List<SpanelVO> getkeyRecruits(String skey, int pageSize, int pageNum) throws Exception;

	public List<SpanelVO> getkeyResumes(String skey, int pageSize, int pageNum) throws Exception;

	public List<SpanelVO> getselRecruits(List<String> sel_skeys, int pageSize, int pageNum) throws Exception;

	public List<SpanelVO> getselResumes(List<String> sel_skeys, int pageSize, int pageNum) throws Exception;

	public String codeToName(String scode) throws Exception;

	public List<Integer> selectJobCode() throws Exception;

	public List<SpanelVO> getCInforList(List<RecruitVO> recruitVOList) throws Exception;
}
