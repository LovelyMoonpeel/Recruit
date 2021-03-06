package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Transactional
	@Override
	public void updateLList(Integer rid, List<ResumeLanguageVO> rlangvolist)throws Exception{
		
		dao.deleteRLangList(rid);
		//레주메 번호에 해당하는 모든 Lang을 지운다.

		if (rlangvolist != null) {
			for (int i = 0; i < rlangvolist.size(); i++){
				
				System.out.println("updateLList vo getTest()"+rlangvolist.get(i).getTest());
				System.out.println("updateLList vo getRid()"+ rlangvolist.get(i).getRid());
				dao.createRLanguageList(rid, rlangvolist.get(i));
			}
		}
	}
	
	@Override
	public void createRLanguageList(Integer rid, List<ResumeLanguageVO> rlangvolist)throws Exception{
		if (rlangvolist != null) {
			for (int i = 0; i < rlangvolist.size(); i++)
				dao.createRLanguageList(rid, rlangvolist.get(i));
		}
	}
}
