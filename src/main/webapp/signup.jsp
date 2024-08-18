<%@page import="com.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Form</title>

   <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc); /* Gradient background */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            margin-bottom: 20px;
            text-align: center;
            color: white; /* Color of h1 */
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px; /* Wider form */
            text-align: left; /* Align text to the left */
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        input[type="tel"],
        input[type="submit"],
        input[type="reset"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="radio"] {
            margin: 0 5px 0 20px;
        }
        input[type="submit"],
        input[type="reset"] {
            width: 45%;
            padding: 10px;
            margin: 10px 2%;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
        }
        input[type="submit"] {
            background-color: #4CAF50;
        }
        input[type="reset"] {
            background-color: #f44336;
        }
        input[type="submit"]:hover,
        input[type="reset"]:hover {
            opacity: 0.9;
        }
        button {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            opacity: 0.9;
        }
        a {
            margin-top: 20px;
        }
    </style>

</head>
<body>

	<%
	Admin a = (Admin) session.getAttribute("admin");

	if (a != null) {
	%>
	<h1>SIGNUP FORM</h1>

	<form action="studentSignup">

		Name : <input type="text" name="name"><br>
		<br> Email : <input type="email" name="email"><br>
		<br> Password :<input type="password" name="pass"><br>
		<br> Date Of Birth :<input type="date" name="db"><br>
		<br> Gender :<input type="radio" value="male" name="gender">Male
		<input type="radio" value="female" name="gender">Female <input
			type="radio" value="other" name="gender">Other <br>
		<br> Mobile No :<input type="tel" name="mob"><br>
		<br> Address :<input type="text" name="address"><br>
		<br> <input type="submit" value="SUBMIT"> <input
			type="reset" value="CANCEL">

	</form>

	<%
	} else {
	response.getWriter().print("<h1> Login First...<h1>");
	request.getRequestDispatcher("AdminLogin.jsp").include(request, response);
	}
	%>

	<br>
	<a href="logout"><button>LOGOUT</button></a>
</body>
</html>