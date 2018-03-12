package com.recruit.service;

import java.util.List;

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
	public List<ResumeLanguageVO> selectResumeLanguageList(Integer rid) throws Exception {
		return dao.selectResumeLanguageList(rid);
	}

	@Override
	public void modify(ResumeLanguageVO vo) throws Exception {
		dao.updateResumeLanguage(vo);
	}

	@Override
	public void remove(Integer id) throws Exception {
		dao.deleteResumeLanguage(id);
	}

	@Override
	public void createResumeLanguage(ResumeLanguageVO vo) throws Exception {
		dao.createResumeLanguage(vo);		
	}


}
