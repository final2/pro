package com.finalproject.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class LoginStateChangeListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		session.getAttribute("");
	}

}
