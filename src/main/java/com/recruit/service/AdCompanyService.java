package com.recruit.service;

import java.util.List;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.BoardVO;
import com.recruit.domain.RecruitVO;

public interface AdCompanyService {

	public BoardVO read(String id) throws Exception;

	public void modify(BoardVO vo) throws Exception;

	public void remove(String id) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listCriteria(AdminCriteria cri) throws Exception;

	public int listCountCriteria(AdminCriteria cri) throws Exception;

	public List<BoardVO> listSearchCriteria(AdminSearchCriteria cri) throws Exception;

	public int listSearchCount(AdminSearchCriteria cri) throws Exception;

	public void modify(RecruitVO vo) throws Exception;
	
	public void remove(int bno) throws Exception;
}