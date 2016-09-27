package com.finalproject.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityContextUtils {

	public static BrEmpUserDetails getUserDetails() {
		
		// Authentication객체 조회하기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		// Authentication객체의 principal에 저장된 사용자 상세정보 조회하기
		Object obj = auth.getPrincipal();
		if (obj instanceof BrEmpUserDetails) {
			return (BrEmpUserDetails) obj;
		} else {
			return null;
		}
	}
}
