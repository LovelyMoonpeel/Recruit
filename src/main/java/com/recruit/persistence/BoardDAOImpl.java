package com.recruit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.BoardVO;



@Repository
public class BoardDAOImpl implements BoardDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.BoardMapper";

  @Override
  public void create(BoardVO vo) throws Exception {
	  System.out.println("4");
    session.insert(namespace + ".create", vo);
    System.out.println("5");
  }



}