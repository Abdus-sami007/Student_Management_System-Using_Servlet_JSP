<%@page import="com.dto.Admin"%>
<%@page import="com.dto.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
  
  <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc); /* Gradient background */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            height: 100vh;
            margin: 0;
            padding: 20px;
        }
        h1 {
            margin-bottom: 20px;
            text-align: center;
            color: white; /* Color of h1 */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            opacity: 0.8;
        }
        a {
            text-decoration: none;
        }
        .logout {
            margin-top: 20px;
        }
    </style>
  
</head>
<body>

      <%
           
	      Admin a = (Admin) session.getAttribute("admin");   
	      
	      if(a!=null){     
      
          StudentDao dao = new StudentDao();   
          List<Student> listOfStudent = dao.findAllStudent();
      %>
      
     <h1>Dashboard</h1>
     
     <table border="1px solid" cellpaddind="5px" cellspacing="5px" width="100%">
		
					<tr>
					<th>SL.NO</th>
					<th>STUDENT_ID</th>
					<th>STUDENT_NAME</th>
					<th>STUDENT_EMAIL</th>
					<th>STUDENT_GENDER</th>
					<th>STUDENT_DOB</th>
					<th>STUDENT_MOB</th>
					<th>STUDENT_ADDRESS</th>
					<th>UPDATE</th>
					<th>DELETE</th>
					</tr>
					
					
					<%
                       int i=1;
					   for(Student s:listOfStudent)
					   {
					%>
					<tr>
					   <td><%=i++ %></td>
					   <td><%=s.getId() %></td>
					   <td><%=s.getName() %></td>
					   <td><%=s.getEmail() %></td>
					   <td><%=s.getGender() %></td>
					   <td><%=s.getDob() %></td>
					   <td><%=s.getMob() %></td>
					   <td><%=s.getAddress() %></td>
					   <td><a href="update?id=<%=s.getId()%>"><button>Edit</button></a></td>
					   <td><a href="delete?id=<%=s.getId()%>"><button>Delete</button></a></td>
					
					</tr>
					
					<%
					   }					
					%>
					
					</table> <br>
					
	<%
	      }
          else{
       	   response.getWriter().print("<h1> Login First...<h1>");
       	   request.getRequestDispatcher("AdminLogin.jsp").include(request, response);
          }
      %>

      
      <a href="logout"><button>LOGOUT</button></a>

					
</body>
</html>