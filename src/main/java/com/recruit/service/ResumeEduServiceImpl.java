package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.ResumeEduVO;
import com.recruit.domain.ResumeVO;
import com.recruit.persistence.ResumeEduDAO;

@Service
public class ResumeEduServiceImpl implements ResumeEduService{

	@Inject
	private ResumeEduDAO dao;
	
	@Override
	public void regist(ResumeEduVO vo) throws Exception {
		dao.createResumeEdu(vo);
	}

	@Override
	public ResumeEduVO read(Integer bno) throws Exception {
		return dao.readResumeEdu(bno);
	}

	@Override
	public void modify(ResumeEduVO vo) throws Exception {
		dao.updateResumeEdu(vo);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteResumeEdu(bno);
	}


}
