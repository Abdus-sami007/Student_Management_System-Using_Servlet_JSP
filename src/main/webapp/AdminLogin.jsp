<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>

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
            width: 300px;
            text-align: center;
        }
        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
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
    </style>

</head>
<body>

   <h1>Admin Login</h1>
   
   <form action="adminLogin">
     username :<input type="text" name="name"> <br><br>
     password :<input type="password" name="pass"> <br><br>
     
     <input type="submit" value="LOGIN">
     <input type="reset" value="CANCEL">
     
   </form>
</body>
</html>