package com.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentDao;
import com.dto.Admin;
import com.dto.Student;

@WebServlet("/studentSignup")
public class StudentSignup extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Admin a = (Admin) req.getSession().getAttribute("admin");
		if (a != null) {

			// Fetch
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String pass = req.getParameter("pass");

			String dob = req.getParameter("db");
			// convert date type
			Date date_of_birth = Date.valueOf(dob);

			String gender = req.getParameter("gender");

			String mob = req.getParameter("mob");
			long mobileNumber = Long.parseLong(mob);

			String address = req.getParameter("address");

			// Print in Console
//		System.out.println(name);
//		System.out.println(email);
//		System.out.println(pass);
//		System.out.println(date_of_birth);
//		System.out.println(gender);
//		System.out.println(mobileNumber);
//		System.out.println(address);

			// Create Object
			Student student = new Student();

			student.setName(name);
			student.setEmail(email);
			student.setPassword(pass);
			student.setDob(date_of_birth);
			student.setGender(gender);
			student.setMob(mobileNumber);
			student.setAddress(address);

			StudentDao dao = new StudentDao();
			dao.saveStudent(student);

			resp.getWriter().print("<h1>Data Saved...</h1>");
			req.getRequestDispatcher("dashboard.jsp").include(req, resp);

		} else {
			resp.getWriter().print("<h1> Login First...<h1>");
			req.getRequestDispatcher("AdminLogin.jsp").include(req, resp);
		}

	}
}
