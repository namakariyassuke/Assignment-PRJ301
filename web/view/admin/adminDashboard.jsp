<%-- 
    Document   : adminDashboard
    Created on : Jul 14, 2024, 11:03:30 PM
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
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
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Welcome, <%= ((User) session.getAttribute("user")).getDisplayname() %></h2>
            <p>This is the admin dashboard.</p>
            <a href="<%= request.getContextPath() %>/admin/selectStudent">View Student Scores</a><br>
            <a href="<%= request.getContextPath() %>/login">Logout</a>
        </div>
    </body>
</html>



