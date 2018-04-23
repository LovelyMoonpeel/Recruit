package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.CsVO;

public interface CsDAO {

	public void create(CsVO vo) throws Exception;

	public CsVO read(Integer bno) throws Exception;

	public void update(CsVO vo) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<CsVO> listAll() throws Exception;
	
	public void noticeCreate(CsVO vo) throws Exception;

	public CsVO noticeRead(Integer bno) throws Exception;

	public void noticeUpdate(CsVO vo) throws Exception;

	public void noticeDelete(Integer bno) throws Exception;

	public List<CsVO> noticeListAll() throws Exception;
}