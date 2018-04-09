package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CRecruitVO;
import com.recruit.persistence.CRecruitDAO;

@Service
public class CRecruitServiceImpl implements CRecruitService {
	
	@Inject
	private CRecruitDAO dao;
	
	@Override
	public List<CRecruitVO> selectCRList(String id, String order_value)throws Exception{
		return dao.selectCRList(id, order_value);
	};
	
	@Override
	public List<CRecruitVO> selectCRList_ongoing(String id, String order_value)throws Exception{
		return dao.selectCRList_ongoing(id, order_value);
	};
	
	@Override
	public List<CRecruitVO> selectCRList_closed(String id, String order_value)throws Exception{
		return dao.selectCRList_closed(id, order_value);
	};
	
	@Override//안소연 사용
	public List<CRecruitVO> selectAPList(String id, String order_value)throws Exception{
		return dao.selectAPList(id, order_value);
	};
	
	@Override//안소연 사용
	public List<CRecruitVO> selectAPList_ongoing(String id, String order_value)throws Exception{
		return dao.selectAPList_ongoing(id, order_value);
	};
	
	@Override//안소연 사용
	public List<CRecruitVO> selectAPList_closed(String id, String order_value)throws Exception{
		return dao.selectAPList_closed(id, order_value);
	};
	
	@Override
	public CRecruitVO selectCROne(int bno)throws Exception{
		return dao.selectCROne(bno);
	};
	

}
