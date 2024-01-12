package com.myWeb.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myWeb.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/member/*")
@Slf4j
@RequiredArgsConstructor
@Controller
public class MemberController {

	private final MemberService msv;
	
	@GetMapping("/register")
	public void register() {}
	
	
	
}
