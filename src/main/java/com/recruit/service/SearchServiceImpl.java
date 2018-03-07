package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CUserVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.PUserVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.ResumeVO;
import com.recruit.persistence.CUserDAO;
import com.recruit.persistence.CodeDAO;
import com.recruit.persistence.PUserDAO;
import com.recruit.persistence.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	private PUserDAO puserdao;

	@Inject
	private CUserDAO cuserdao;

	@Inject
	private CodeDAO codedao;

	@Inject
	private SearchDAO searchDAO;

	@Override
	public PUserVO selectPUser(String skeyword) throws Exception {
		return puserdao.selectPUser(skeyword);
	}

	@Override
	public List<PUserVO> selectPUserAll() throws Exception {
		return puserdao.selectPUserAll();
	}

	@Override
	public List<PUserVO> selectPUsers(String skey) throws Exception {
		return puserdao.selectPUsers(skey);
	}

	@Override
	public CUserVO selectCUser(String skeyword) throws Exception {
		return cuserdao.selectCUser(skeyword);
	}

	@Override
	public List<CUserVO> selectCUserAll() throws Exception {
		return cuserdao.selectCUserAll();
	}

	@Override
	public List<CUserVO> selectCUsers(String skey) throws Exception {
		return cuserdao.selectCUsers(skey);
	}

	@Override
	public List<CodeVO> CodeList(int tid) throws Exception {
		return codedao.CodeList(tid);
	}

	@Override
	public List<RecruitVO> selectRecruits(String skey) throws Exception {
		return searchDAO.selectRecruits(skey);
	}

	@Override
	public List<ResumeVO> selectResumes(String skey) throws Exception {
		return searchDAO.selectResumes(skey);
	}
}
