package com.myWeb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myWeb.www.domain.BoardDTO;
import com.myWeb.www.domain.BoardVO;
import com.myWeb.www.domain.FileVO;
import com.myWeb.www.domain.PagingVO;
import com.myWeb.www.repository.BoardDAO;
import com.myWeb.www.repository.FileDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService{

	private final BoardDAO bdao;
	private final FileDAO fdao;

	@Transactional
	@Override
	public int insert(BoardDTO bdto) {
		log.info("insert service in");
		
		//bvo boardMapper / flist fileMapper  등록 
		int isOk = bdao.insert(bdto.getBvo());
		
		if(bdto.getFlist()==null) {
			return isOk;
		}
		
		//bvo insert 후 파일도 있다면..
		if(isOk>0 &&bdto.getFlist().size()>0) {
			//bno setting 
			long bno= bdao.selectOneBno(); //가장 마지막에 등록된 bno
			for(FileVO fvo:bdto.getFlist()) {
				fvo.setBno(bno);
				isOk *=fdao.insertFile(fvo);
			}
		}
		return isOk;
	}

	
	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		// TODO Auto-generated method stub
		bdao.updateCommentCount();
		bdao.updateFileCount();
		return bdao.getList(pgvo);
	}


	@Transactional
	@Override
	public BoardDTO getDetail(long bno) {
		// TODO Auto-generated method stub
		BoardVO bvo=bdao.getDetail(bno);
		List<FileVO>flist=fdao.getFileList(bno);
		BoardDTO bdto= new BoardDTO(bvo,flist);
		return bdto;
	}

	@Transactional
	@Override
	public int modify(BoardDTO bdto) {//update 부분
		//bvo boardMapper / flist fileMapper  등록 
		int isOk = bdao.update(bdto.getBvo());
		if(bdto.getFlist()==null) {
			return isOk;
		}
		
		//bvo insert 후 파일도 있다면..
		if(isOk>0 &&bdto.getFlist().size()>0) {
			//bno setting 
			long bno= bdto.getBvo().getBno(); 
			for(FileVO fvo:bdto.getFlist()) {
				fvo.setBno(bno);
				isOk +=fdao.insertFile(fvo);
			}
		}
		return isOk;
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


	@Override
	public int removeFile(String uuid) {
		// TODO Auto-generated method stub
		return fdao.removeFile(uuid);
	}
	
	
}
