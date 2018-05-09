package com.recruit.service;

import java.util.List;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.UserVO;
import com.recruit.domain.RecruitVO;

public interface AdCompanyService {

	public UserVO read(String id) throws Exception;

	public void modify(UserVO vo) throws Exception;

	public List<UserVO> listAll() throws Exception;

	public List<UserVO> listCriteria(AdminCriteria cri) throws Exception;

	public int listCountCriteria(AdminCriteria cri) throws Exception;

	public List<UserVO> listSearchCriteria(AdminSearchCriteria cri) throws Exception;

	public int listSearchCount(AdminSearchCriteria cri) throws Exception;

	public void modify(RecruitVO vo) throws Exception;
	
	public void remove(int bno) throws Exception;
}