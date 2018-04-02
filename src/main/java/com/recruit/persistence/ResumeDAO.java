package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.AdminResumeVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;

public interface ResumeDAO {

	public AdminResumeVO read(String id) throws Exception;
	
	public void update(AdminResumeVO vo) throws Exception;
	
	public void delete(String id) throws Exception;
	
	public List<AdminResumeVO> listAll(String id) throws Exception;
	
	public void createROne(ResumeVO resume)throws Exception;
	
	public ResumeVO readROne(Integer bno) throws Exception;
	
	public int readRLastCreatedOne(String id)throws Exception;
	
	public void updateROne(ResumeVO vo)throws Exception;
	
	public void deleteROne(int bno)throws Exception;
	
	public List<ResumeVO> selectRList(String id)throws Exception;
	
	public ResumeVO resumeRead(Integer bno) throws Exception;
	
	public List<CodeVO> selectRCodeList()throws Exception;
	   
	public List<JobGroupVO> selectRGPList() throws Exception;
	   
	public List<RegionVO> selectRegionList() throws Exception;
	
	public void addRimgAttach(ResumeVO resume)throws Exception;
	
}