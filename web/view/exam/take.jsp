<%-- 
    Document   : take
    Created on : Jun 24, 2024, 2:01:09 PM
    Author     : sonnt-local
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Grades</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f9f9f9;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                background-color: #fff;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            input[type="text"] {
                width: 100%;
                padding: 5px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .nav-buttons {
                margin-bottom: 20px;
            }
            .nav-buttons a, .nav-buttons button {
                padding: 10px 20px;
                border-radius: 4px;
                text-decoration: none;
                color: white;
                background-color: #4CAF50;
                text-align: center;
                border: none;
                cursor: pointer;
                margin-right: 10px;
            }
            .nav-buttons .logout {
                background-color: #f44336;
            }
            .nav-buttons a:hover, .nav-buttons button:hover {
                opacity: 0.8;
            }
        </style>
    </head>
    <body>
        <div class="nav-buttons">
            <button onclick="history.back()">Back</button>
            <a href="${pageContext.request.contextPath}/logout" class="logout">Logout</a>
        </div>
        
        <form action="take" method="POST">
            <table>
                <thead>
                    <tr>
                        <th></th>
                        <c:forEach items="${requestScope.exams}" var="e">
                            <th>
                                ${e.assessment.name} (${e.assessment.weight})<br/>
                                ${e.from}
                            </th>
                        </c:forEach>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.students}" var="s">
                        <tr>
                            <td>${s.name}</td>
                            <c:forEach items="${requestScope.exams}" var="e">
                                <td>
                                    <input type="text" name="score${s.id}_${e.id}"
                                           <c:forEach items="${requestScope.grades}" var="g">
                                               <c:if test="${e.id eq g.exam.id and s.id eq g.student.id}">
                                                   value="${g.score}"
                                               </c:if>
                                           </c:forEach>
                                           />
                                    <input type="hidden" name="gradeid" value="${s.id}_${e.id}"/>
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>    
                </tbody>
            </table>
            <input type="hidden" name="cid" value="${param.cid}" />
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
