package com.myWeb.www.service;

import java.util.List;

import com.myWeb.www.domain.BoardDTO;
import com.myWeb.www.domain.BoardVO;
import com.myWeb.www.domain.PagingVO;

public interface BoardService {

	int insert(BoardDTO bdto);

	List<BoardVO> getList(PagingVO pgvo);

	BoardDTO getDetail(long bno);

	int remove(long bno);

	int modify(BoardDTO bdto);

	int getTotalCount(PagingVO pgvo);

	int removeFile(String uuid);
	

}
