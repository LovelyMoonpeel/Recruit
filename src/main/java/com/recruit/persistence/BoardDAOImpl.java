package com.recruit.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.BoardVO;


//3.19 문
@Repository
public class BoardDAOImpl implements BoardDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.BoardMapper";

  @Override
  public void create(BoardVO vo) throws Exception {
    session.insert(namespace + ".create", vo);
  }

  @Override
  public void Ccreate(BoardVO vo) throws Exception{
	  session.insert(namespace+".Ccreate", vo);
  }


}