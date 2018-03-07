package com.recruit.persistence;

import com.recruit.domain.BoardVO;

public interface BoardDAO {
	
	  public void create(BoardVO vo)throws Exception;

}