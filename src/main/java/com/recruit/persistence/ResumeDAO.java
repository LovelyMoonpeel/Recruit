package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.AdminResumeVO;
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
	
	public void deleteROne(Integer bno)throws Exception;
	
	public List<ResumeVO> selectRList(String id)throws Exception;
	
	public void addRimgAttach(ResumeVO resume)throws Exception;
	
}