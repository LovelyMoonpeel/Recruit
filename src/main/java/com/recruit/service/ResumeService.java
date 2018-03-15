package com.recruit.service;

import java.util.List;

import com.recruit.domain.AdminResumeVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.PUserVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;

public interface ResumeService {

	public AdminResumeVO read(String id) throws Exception;

	public void modify(AdminResumeVO vo) throws Exception;

	public void remove(String id) throws Exception;

	public List<AdminResumeVO> listAll(String id) throws Exception;

	public Integer createROne(ResumeVO resume, PUserVO puser) throws Exception;
	
	//public int readRLastCreatedOne() throws Exception;

	public ResumeVO readROne(Integer bno) throws Exception;

	public void updateROne(ResumeVO resume) throws Exception;

	public void deleteROne(Integer bno) throws Exception;

	public List<ResumeVO> selectRList(String id) throws Exception;
	
	public List<CodeVO> selectRCodeList() throws Exception;
	   
	public List<JobGroupVO> selectRGPList() throws Exception;
	 
	public List<RegionVO> selectRegionList() throws Exception;

	//public void addRimgAttach(String fullName); dao만 만들어서 transaction처리
}