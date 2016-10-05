package com.finalproject.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.finalproject.model.BranchEmp;
import com.finalproject.service.BranchService;

@Service
public class BrEmpUserDetailsService implements UserDetailsService {
	
	@Autowired
	BranchService brService;
	public void setBrService(BranchService brService) {
		this.brService = brService;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		List<BranchEmp> brEmps = new ArrayList<>();
		BranchEmp brEmp = brService.getBrMemberByNo(Integer.parseInt(username));
		brEmps.add(brEmp);
		if (brEmps.isEmpty()) {
			throw new UsernameNotFoundException("사용자가 없습니다.");
		}
		BranchEmp emp = brEmps.get(0);
		
		return new BrEmpUserDetails(emp);
	}
	
}
