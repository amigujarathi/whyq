package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletImpl extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	}

	@Override
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
		
		response.getContentType();
		PrintWriter pw=response.getWriter();
		
		String name=request.getParameter("user");
		System.out.println("You have entered "+name);
		
		String password=request.getParameter("pass");
		System.out.println("Password is "+password);
		
		ArrayList list=new ArrayList();
		 Map author1 = new HashMap();
		  author1.put("id", "A");
		  list.add(author1);
		  Map author2 = new HashMap();
		  author2.put("id", "B");
		  list.add(author2);
		  Map author3 = new HashMap();
		  author3.put("id", "C");
		  list.add(author3);
		  
		//pw.println("<h1>Hello</h1><br><h2>"+name+"</h2>");
		//pw.close();
		request.setAttribute("message", name);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/menu.html").forward(request, response);
		
	}

}
