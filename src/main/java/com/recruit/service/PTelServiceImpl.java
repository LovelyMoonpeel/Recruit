package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.PTelVO;
import com.recruit.persistence.PTelDAO;

@Service
public class PTelServiceImpl implements PTelService{

	@Inject
	private PTelDAO dao;	
	
	@Override
	public void createTOne(PTelVO ptvo) throws Exception {
		dao.createTOne(ptvo);
	}//안씀
	
	@Override
	public void deleteTOne(Integer id) throws Exception {
		dao.deleteTOne(id);
	}//안씀

	@Override
	public List<PTelVO> selectPTelList(Integer bno) throws Exception {
		return dao.selectPTelList(bno);
	}

	@Override
	public void updateTOne(Integer ptvoid) throws Exception {
		//안소연
		dao.updateTOne(ptvoid);
	}
	
	@Transactional
	@Override
	public void updateTList(Integer rid, List<PTelVO> PTelVOlist) throws Exception {

		dao.deleteTList(rid);
		//레주메 번호에 해당하는 모든 Tel을 지운다.
		
		if (PTelVOlist != null) {
			for (int i = 0; i < PTelVOlist.size(); i++)
				dao.createTOne(PTelVOlist.get(i));
		}
	}
	
}
