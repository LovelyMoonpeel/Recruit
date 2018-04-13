package com.recruit.service;

import java.util.List;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.BoardVO;

public interface AdminService {

	public BoardVO read(String id) throws Exception;

	public void modify(BoardVO vo) throws Exception;

	public void remove(String id) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listCriteria(AdminCriteria cri) throws Exception;

	public int listCountCriteria(AdminCriteria cri) throws Exception;

	public List<BoardVO> listSearchCriteria(AdminSearchCriteria cri) throws Exception;

	public int listSearchCount(AdminSearchCriteria cri) throws Exception;

	public BoardVO aread() throws Exception;

	public void amodify(BoardVO vo) throws Exception;
	
	public String readpw(BoardVO vo) throws Exception;
	
	public int pcount()throws Exception;
	
	public int ccount()throws Exception;
}