package com.recruit.service;

import java.util.List;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.AmainVO;

public interface AmainService {

	public AmainVO read(String id) throws Exception;

	public void modify(AmainVO vo) throws Exception;

	public void remove(String id) throws Exception;

	public List<AmainVO> listAll() throws Exception;

	public List<AmainVO> listCriteria(AdminCriteria cri) throws Exception;

	public int listCountCriteria(AdminCriteria cri) throws Exception;

	public List<AmainVO> listSearchCriteria(AdminSearchCriteria cri) throws Exception;

	public int listSearchCount(AdminSearchCriteria cri) throws Exception;

	public AmainVO aread() throws Exception;

	public void amodify(AmainVO vo) throws Exception;
}