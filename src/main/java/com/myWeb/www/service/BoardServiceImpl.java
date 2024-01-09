package com.myWeb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myWeb.www.domain.BoardVO;
import com.myWeb.www.domain.PagingVO;
import com.myWeb.www.repository.BoardDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService{

	private final BoardDAO bdao;

	@Override
	public int insert(BoardVO bvo) {
		log.info("insert service in");
		return bdao.insert(bvo);
	}

	
	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getList(pgvo);
	}


	@Override
	public Object getDetail(int bno) {
		// TODO Auto-generated method stub
		bdao.updateReadCnt(bno);
		return bdao.getDetail(bno);
	}




	@Override
	public int modify(BoardVO bvo) {
		// TODO Auto-generated method stub
		return bdao.update(bvo);
	}


	@Override
	public int remove(long bno) {
		// TODO Auto-generated method stub
		return bdao.delete(bno);
	}


	@Override
	public int getTotalCount(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getTotalCount(pgvo);
	}
	
	
}
