package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentDao;
import com.dto.Admin;
import com.dto.Student;

@WebServlet("/delete")
public class DeleteStudent extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Admin a=(Admin) req.getSession().getAttribute("admin");
		if(a!=null)
		{
		
		String id =req.getParameter("id");
		int id1 =Integer.parseInt(id);
		
		StudentDao dao =new StudentDao();
		Student s =dao.findStudentById(id1);
		
		dao.deleteStudent(s);
		
		resp.getWriter().print("<h1>"+ id1 + " is deleted...</h1>");
		req.getRequestDispatcher("dashboard.jsp").include(req, resp);
		
		}
		else
		{
			 resp.getWriter().print("<h1> Login First...<h1>");
      	     req.getRequestDispatcher("AdminLogin.jsp").include(req, resp);
		}
	}
}
