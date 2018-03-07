package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.ResumeLanguageVO;
import com.recruit.persistence.ResumeLanguageDAO;

@Service
public class ResumeLanguageServiceImpl implements ResumeLanguageService{

	@Inject
	private ResumeLanguageDAO dao;
	
	@Override
	public void regist(ResumeLanguageVO vo) throws Exception {
		dao.createResumeLanguage(vo);
	}

	@Override
	public ResumeLanguageVO read(Integer id) throws Exception {
		return dao.readResumeLanguage(id);
	}

	@Override
	public void modify(ResumeLanguageVO vo) throws Exception {
		dao.updateResumeLanguage(vo);
	}

	@Override
	public void remove(Integer id) throws Exception {
		dao.deleteResumeLanguage(id);
	}

}
