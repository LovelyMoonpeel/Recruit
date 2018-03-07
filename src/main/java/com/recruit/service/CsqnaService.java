package com.recruit.service;

import java.util.List;

import com.recruit.domain.CsqnaCriteria;
import com.recruit.domain.CsqnaVO;

public interface CsqnaService {

	public void regist(CsqnaVO vo) throws Exception;

	public CsqnaVO read(Integer bno) throws Exception;

	public CsqnaVO modread(Integer bno) throws Exception;

	public void modify(CsqnaVO vo) throws Exception;

	public void remove(Integer bno) throws Exception;

	public List<CsqnaVO> listAll() throws Exception;

	public int listCountCriteria(CsqnaCriteria cri) throws Exception;

	public List<CsqnaVO> listCriteria(CsqnaCriteria cri) throws Exception;

}