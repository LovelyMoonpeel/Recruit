package com.recruit.service;

import java.util.List;

import com.recruit.domain.AdminResumeVO;
import com.recruit.domain.ResumeVO;

public interface ResumeService {

	public AdminResumeVO read(String id) throws Exception;

	public void modify(AdminResumeVO vo) throws Exception;

	public void remove(String id) throws Exception;

	public List<AdminResumeVO> listAll(String id) throws Exception;

	public void createROne(ResumeVO resume) throws Exception;

	public ResumeVO readROne(Integer bno) throws Exception;

	public void updateROne(ResumeVO resume) throws Exception;

	public void deleteROne(Integer bno) throws Exception;

	public List<ResumeVO> selectRList(String id) throws Exception;

	//public void addRimgAttach(String fullName);
}