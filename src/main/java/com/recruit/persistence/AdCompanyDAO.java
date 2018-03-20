package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.BoardVO;
import com.recruit.domain.RecruitVO;

public interface AdCompanyDAO {

	public BoardVO read(String id) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(String id) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listPage(int page) throws Exception;

	public List<BoardVO> listCriteria(AdminCriteria cri) throws Exception;

	public int countPaging(AdminCriteria cri) throws Exception;

	public List<BoardVO> listSearch(AdminSearchCriteria cri) throws Exception;

	public int listSearchCount(AdminSearchCriteria cri) throws Exception;
	
	public void update(RecruitVO vo) throws Exception;

	public void delete(int bno) throws Exception;
}
