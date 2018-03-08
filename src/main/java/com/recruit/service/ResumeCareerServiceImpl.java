package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.ResumeCareerVO;
import com.recruit.domain.ResumeVO;
import com.recruit.persistence.ResumeCareerDAO;

@Service
public class ResumeCareerServiceImpl implements ResumeCareerService{

	@Inject
	private ResumeCareerDAO dao;
	
	@Override
	public void regist(ResumeCareerVO vo) throws Exception {
		dao.createResumeCareer(vo);
	}

	@Override
	public ResumeCareerVO read(Integer bno) throws Exception {
		return dao.readResumeCareer(bno);
	}

	@Override
	public void modify(ResumeCareerVO vo) throws Exception {
		dao.updateResumeCareer(vo);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteResumeCareer(bno);
	}


}
