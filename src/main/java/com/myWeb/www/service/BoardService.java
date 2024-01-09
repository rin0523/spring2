package com.myWeb.www.service;

import java.util.List;

import com.myWeb.www.domain.BoardVO;
import com.myWeb.www.domain.PagingVO;

public interface BoardService {

	int insert(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	Object getDetail(int bno);

	int remove(long bno);

	int modify(BoardVO bvo);

	int getTotalCount(PagingVO pgvo);
	

}
