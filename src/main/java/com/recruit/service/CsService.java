package com.recruit.service;

import java.util.List;

import com.recruit.domain.CsVO;

public interface CsService {

	public void regist(CsVO vo) throws Exception;

	public CsVO read(Integer bno) throws Exception;

	public void modify(CsVO vo) throws Exception;

	public void remove(Integer bno) throws Exception;

	public List<CsVO> listAll() throws Exception;
	
	public void noticeCreate(CsVO vo) throws Exception;

	public CsVO noticeRead(Integer bno) throws Exception;

	public void noticeUpdate(CsVO vo) throws Exception;

	public void noticeDelete(Integer bno) throws Exception;

	public List<CsVO> noticeListAll() throws Exception;
}