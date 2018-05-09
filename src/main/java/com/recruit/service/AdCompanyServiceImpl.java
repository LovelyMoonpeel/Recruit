package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.UserVO;
import com.recruit.domain.RecruitVO;
import com.recruit.persistence.AdCompanyDAO;
import com.recruit.persistence.UserDAO;

@EnableAsync
@Service
public class AdCompanyServiceImpl implements AdCompanyService {

	@Inject
	private AdCompanyDAO dao;
	
	@Override
	public UserVO read(String id) throws Exception {
		return dao.read(id);
	}

	@Transactional
	@Override
	public void modify(UserVO vo) throws Exception {
		dao.update(vo);
		dao.cnameupdate(vo);
	}

	@Override
	public List<UserVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<UserVO> listCriteria(AdminCriteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(AdminCriteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<UserVO> listSearchCriteria(AdminSearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(AdminSearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public void modify(RecruitVO vo) throws Exception {
		System.out.println("service test");
		dao.update(vo);
	}
	
	@Override
	public void remove(int bno) throws Exception {
		dao.delete(bno);
	}
}