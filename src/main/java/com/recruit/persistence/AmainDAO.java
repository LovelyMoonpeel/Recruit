package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.AmainVO;

public interface AmainDAO {

	public AmainVO read(String id) throws Exception;

	public void update(AmainVO vo) throws Exception;

	public void delete(String id) throws Exception;

	public List<AmainVO> listAll() throws Exception;

	public List<AmainVO> listPage(int page) throws Exception;

	public List<AmainVO> listCriteria(AdminCriteria cri) throws Exception;

	public int countPaging(AdminCriteria cri) throws Exception;

	public List<AmainVO> listSearch(AdminSearchCriteria cri) throws Exception;

	public int listSearchCount(AdminSearchCriteria cri) throws Exception;

	public AmainVO aread() throws Exception;

	public void aupdate(AmainVO vo) throws Exception;
}