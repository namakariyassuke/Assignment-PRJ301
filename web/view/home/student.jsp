<%-- 
    Document   : student
    Created on : Jul 15, 2024, 2:34:29 PM
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 50px;
        }
        h2 {
            color: #333;
        }
        a {
            text-decoration: none;
            color: #4CAF50;
            display: inline-block;
            margin-top: 20px;
        }
        a:hover {
            text-decoration: underline;
        }
        .menu {
            margin-top: 30px;
        }
        .menu a {
            display: block;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, <%= ((User) session.getAttribute("user")).getDisplayname() %></h2>
        <p>What are you looking for.</p>
        <div class="menu">
            <h3>Menu</h3>
            <a href="<%= request.getContextPath() %>/view/student">View My Grades</a>
        </div>
        <a href="<%= request.getContextPath() %>/auth/logout">Logout</a>
    </div>
</body>
</html>

