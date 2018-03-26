package com.recruit.service;


import com.recruit.domain.BoardVO;

//3.19 문
public interface BoardService {

  public void pregist(BoardVO board) throws Exception;

  public void cregist(BoardVO board) throws Exception;
  
  public void updateCP(BoardVO board) throws Exception;
  
}