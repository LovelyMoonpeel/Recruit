package com.recruit.service;

import java.util.List;

import com.recruit.domain.CsfaqVO;

public interface CsfaqService {

	public void regist(CsfaqVO vo) throws Exception;

	public CsfaqVO read(Integer bno) throws Exception;

	public void modify(CsfaqVO vo) throws Exception;

	public void remove(Integer bno) throws Exception;

	public List<CsfaqVO> listAll() throws Exception;
}