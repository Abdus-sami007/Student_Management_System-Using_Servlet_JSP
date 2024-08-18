package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.Admin;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name =req.getParameter("name");
		String pass=req.getParameter("pass");
		
		if(name.equals("admin") && pass.equals("admin"))
		{
			Admin a = new Admin(name,pass);
			
			//session
			req.getSession().setAttribute("admin", a);
			resp.getWriter().print("<h1> Admin Login Successful...</h1>");
			req.getRequestDispatcher("signup.jsp").include(req, resp);
		}
		else
		{
			resp.getWriter().print("<h1> Invalid Credentials...</h1>");
			req.getRequestDispatcher("AdminLogin.jsp").include(req, resp);
		}
	}
}
