package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.UserVO;
import com.recruit.domain.RecruitVO;

public interface AdCompanyDAO {

	public UserVO read(String id) throws Exception;

	public void update(UserVO vo) throws Exception;
	
	public void cnameupdate(UserVO vo) throws Exception;

	public List<UserVO> listAll() throws Exception;

	public List<UserVO> listPage(int page) throws Exception;

	public List<UserVO> listCriteria(AdminCriteria cri) throws Exception;

	public int countPaging(AdminCriteria cri) throws Exception;

	public List<UserVO> listSearch(AdminSearchCriteria cri) throws Exception;

	public int listSearchCount(AdminSearchCriteria cri) throws Exception;
	
	public void update(RecruitVO vo) throws Exception;

	public void delete(int bno) throws Exception;
}
