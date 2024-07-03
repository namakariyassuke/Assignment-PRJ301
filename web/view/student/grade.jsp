<%-- 
    Document   : grade
    Created on : Jun 30, 2024, 3:35:59 PM
    Author     : ASUS
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grade Transcript</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h1>Grade Transcript</h1>
    
    <br>
    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Subject</th>
                <th>Score</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="grade" items="${grades}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${grade.student.id}</td>
                    <td>${grade.student.name}</td>
                    <td>${grade.exam.subject.name}</td>
                    <td>${grade.score}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>





