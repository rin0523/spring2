package com.myWeb.www.service;

import org.springframework.stereotype.Service;

import com.myWeb.www.repository.CommentDAO;
import com.myWeb.www.repository.MemberDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberDAO mdao;
	
}
