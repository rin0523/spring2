package com.myWeb.www.repository;

import java.util.List;

import com.myWeb.www.domain.BoardDTO;
import com.myWeb.www.domain.BoardVO;
import com.myWeb.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO boardVO);


	List<BoardVO> getList(PagingVO pgvo);


	BoardVO getDetail(long bno);


	int delete(long bno);


	int update(BoardVO boardVO);


	void updateReadCnt(int bno);


	int getTotalCount(PagingVO pgvo);


	long selectOneBno();


	void updateCommentCount();


	void updateFileCount();



}
