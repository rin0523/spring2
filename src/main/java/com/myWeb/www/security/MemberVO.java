package com.myWeb.www.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



@ToString
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class MemberVO {
	

	private String email;
	private String pwd;
	private String nickName;
	private String regAt;
	private String lastLogin;
	private List<AuthVO>authList;
	
	
	

}
