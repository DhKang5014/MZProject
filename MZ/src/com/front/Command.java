package com.front;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
public interface Command {
	public abstract String execute(HttpServletRequest request, HttpServletResponse response);
}
