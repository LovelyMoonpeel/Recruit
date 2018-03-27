package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.RecruitVO;
import com.recruit.domain.ResumeVO;
import com.recruit.domain.SpanelVO;

public interface SearchDAO {

	public List<RecruitVO> selectRecruits(String skey) throws Exception;

	public List<ResumeVO> selectResumes(String skey) throws Exception;

	public List<RecruitVO> selectRecruits_selJob(List<String> sel_skeys) throws Exception;

	public List<RecruitVO> selectRecruits_selRgn(List<String> sel_skeys) throws Exception;

	public List<RecruitVO> selectRecruits_selCod(List<String> sel_skeys, int[] arr) throws Exception;

	public List<ResumeVO> selectResumes_selJob(List<String> sel_skeys) throws Exception;

	public List<ResumeVO> selectResumes_selRgn(List<String> sel_skeys) throws Exception;

	public List<ResumeVO> selectResumes_selCod(List<String> sel_skeys, int[] arr) throws Exception;

	public List<RecruitVO> selectRecruitsAll() throws Exception;

	public List<ResumeVO> selectResumesAll() throws Exception;

	public List<Integer> selectJobCode() throws Exception;
}
