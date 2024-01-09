package com.myWeb.www.repository;

import java.util.List;

import com.myWeb.www.domain.BoardVO;
import com.myWeb.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);


	List<BoardVO> getList(PagingVO pgvo);


	Object getDetail(int bno);


	int delete(long bno);


	int update(BoardVO bvo);


	void updateReadCnt(int bno);


	int getTotalCount(PagingVO pgvo);

}
