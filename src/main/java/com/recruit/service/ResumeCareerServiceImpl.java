package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.ResumeCareerVO;
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

	@Override
	public void createResumeCareer(ResumeCareerVO vo) throws Exception {
		dao.createResumeCareer(vo);
	}
	
	// r.code 03/14 추가
	@Override
	public List<ResumeCareerVO> readResumeCareerList(Integer bno) throws Exception {
		return dao.readResumeCareerList(bno);
	}

	// r.code 03/15 추가
	@Override
	public void changeResumeCareerList(Integer resumenum, List<ResumeCareerVO> resumeCareerVOList) throws Exception {

		dao.deleteResumeCareerList(resumenum);
		System.out.println("resumeCareerVOList: " + resumeCareerVOList);
		if (resumeCareerVOList != null) {
			int num = resumeCareerVOList.size();
			for (int i = 0; i < num; i++)
				dao.createResumeCareer(resumeCareerVOList.get(i));
		}
	}
}
