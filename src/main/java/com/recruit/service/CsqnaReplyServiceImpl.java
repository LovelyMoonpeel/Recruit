package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CsqnaReplyVO;
import com.recruit.persistence.CsqnaReplyDAO;

@Service
public class CsqnaReplyServiceImpl implements CsqnaReplyService {
	
	@Inject
	private CsqnaReplyDAO dao;
	
	@Override
	public void addReply(CsqnaReplyVO vo) throws Exception{
		dao.create(vo);
	}
	
	@Override
	public List<CsqnaReplyVO> listReply(Integer bno) throws Exception{
		return dao.list(bno);
	}
	
	@Override
	public void modifyReply(CsqnaReplyVO vo) throws Exception{
		dao.update(vo);
	}
	
	@Override
	public void removeReply(Integer rno) throws Exception{
		dao.delete(rno);
	}
	
	@Override
	public void updateReply(Integer bno) throws Exception{
		dao.updateReply(bno);
	}
	
	@Override
	public void deleteReply(Integer bno) throws Exception{
		dao.deleteReply(bno);
	}
	
	@Override
	public CsqnaReplyVO readReply(Integer rno) throws Exception{
		return dao.read(rno);
	}
}
