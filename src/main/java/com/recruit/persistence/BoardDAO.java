package com.recruit.persistence;

import com.recruit.domain.BoardVO;

//3.19 문
public interface BoardDAO {
	
	  public void create(BoardVO vo)throws Exception;

	  public void Ccreate(BoardVO vo) throws Exception;
	  
	  public void updateCP(BoardVO board) throws Exception; //문> 3.23 companyPasswordChange
}