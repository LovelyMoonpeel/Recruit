package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.CsfaqVO;

public interface CsfaqDAO {

	public void create(CsfaqVO vo) throws Exception;

	public CsfaqVO read(Integer bno) throws Exception;

	public void update(CsfaqVO vo) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<CsfaqVO> listAll() throws Exception;
}