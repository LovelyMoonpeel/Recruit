package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.BoardVO;
import com.recruit.persistence.BoardDAO;

//3.19 문
@Service
public class BoardServiceImpl implements BoardService {

  @Inject
  private BoardDAO dao;

  @Override
  public void pregist(BoardVO board) throws Exception {
    dao.create(board);
  }
  
  @Transactional
  @Override
  public void cregist(BoardVO board) throws Exception {
    dao.create(board);
    dao.Ccreate(board);
  }
}