package com.recruit.service;

import java.util.List;

import com.recruit.domain.CsqnaReplyVO;

public interface CsqnaReplyService {

	public void addReply(CsqnaReplyVO vo) throws Exception;
	
	public List<CsqnaReplyVO> listReply(Integer bno) throws Exception;
	
	public void modifyReply(CsqnaReplyVO vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;
	
	public void updateReply(Integer bno) throws Exception;
	
	public void deleteReply(Integer bno) throws Exception;
}
