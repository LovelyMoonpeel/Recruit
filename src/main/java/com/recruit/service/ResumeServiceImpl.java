package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.AdminResumeVO;
import com.recruit.domain.ResumeVO;
import com.recruit.persistence.ResumeDAO;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Inject
	private ResumeDAO dao;

	@Override
	public AdminResumeVO read(String id) throws Exception {
		return dao.read(id);
	}

	@Override
	public void modify(AdminResumeVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(String id) throws Exception {
		dao.delete(id);
	}

	@Override
	public List<AdminResumeVO> listAll(String id) throws Exception {
		return dao.listAll(id);
	}

	@Override
	public void createROne(ResumeVO resume) throws Exception {
		dao.createROne(resume);
	}

	@Override
	public ResumeVO readROne(Integer bno) throws Exception {
		return dao.readROne(bno);
	}

	@Override
	public void updateROne(ResumeVO resume) throws Exception {
		System.out.println("dao updateROne");
		dao.updateROne(resume);
	}

	@Override
	public void deleteROne(Integer bno) throws Exception {
		System.out.println("service" + bno);
		dao.deleteROne(bno);
	}

	@Override
	public List<ResumeVO> selectRList(String id) throws Exception {

		System.out.println("ResumeServiceImpl" + id);
		return dao.selectRList(id);
	}

}