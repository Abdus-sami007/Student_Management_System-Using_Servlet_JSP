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

@WebServlet("/update")
public class updateStudent extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          
		Admin a=(Admin) req.getSession().getAttribute("admin");
		if(a!=null)
		{	
				
			
          String id=req.getParameter("id");
          int stdId =Integer.parseInt(id);
          
          StudentDao dao=new StudentDao();
          Student std =dao.findStudentById(stdId);
          
          req.getSession().setAttribute("std",std);
          req.getRequestDispatcher("updateStudent.jsp").include(req, resp);
          
		}
		else
		{
			 resp.getWriter().print("<h1> Login First...<h1>");
      	     req.getRequestDispatcher("AdminLogin.jsp").include(req, resp);
		}
	}
}
