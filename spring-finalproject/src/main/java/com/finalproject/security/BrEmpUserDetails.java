package com.finalproject.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.finalproject.model.BranchEmp;

public class BrEmpUserDetails implements UserDetails {
	
	private BranchEmp brEmp;
	
	public BrEmpUserDetails(BranchEmp brEmp) {
		this.brEmp = brEmp;
	}
	
	public BranchEmp getBrEmp() {
		return brEmp;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		
		List<String> grades = new ArrayList<>();
		grades.add(brEmp.getGrade());
		
		for (String role_name : grades) {
			SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role_name);
			authorities.add(authority);
		}
		
		return authorities;
	}

	@Override
	public String getPassword() {
		return brEmp.getPassword();
	}

	@Override
	public String getUsername() {
		System.out.println(brEmp.getNo());
		return Integer.toString(brEmp.getNo());
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
