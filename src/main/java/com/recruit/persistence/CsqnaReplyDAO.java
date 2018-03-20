package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.CsqnaReplyVO;

public interface CsqnaReplyDAO {

	public List<CsqnaReplyVO> list(Integer bno) throws Exception;
	
	public void create(CsqnaReplyVO vo) throws Exception;
	
	public void update(CsqnaReplyVO vo) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
	public void updateReply(Integer bno) throws Exception;
	
	public void deleteReply(Integer bno) throws Exception;
	
	public CsqnaReplyVO read(Integer rno) throws Exception;
}
