package com.recruit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.BoardVO;
import com.recruit.persistence.BoardDAO;


@Service
public class BoardServiceImpl implements BoardService {

  @Inject
  private BoardDAO dao;

  @Override
  public void regist(BoardVO board) throws Exception {
	  System.out.println("3");
    dao.create(board);
    System.out.println("6");
  }
}