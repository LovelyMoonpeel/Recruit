package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.PApplyVO;
import com.recruit.domain.ResumeVO;
import com.recruit.persistence.PApplyDAO;

@Service
public class PApplyServiceImpl implements PApplyService {
	
	@Inject
	private PApplyDAO dao;
	
	public void createAPOne(PApplyVO pavo)throws Exception{
		dao.createAPOne(pavo);
	}
	
	public PApplyVO selectAPOne(PApplyVO pavo)throws Exception{
		return dao.selectAPOne(pavo);
	}
	
	public String readornotAPOne(PApplyVO pavo)throws Exception{
		return dao.readornotAPOne(pavo);
	}
	
	public void CreadAPOne(PApplyVO pavo)throws Exception{
		dao.readornotAPOne(pavo);
	}
}
