<%-- 
    Document   : lecturer
    Created on : Jun 19, 2024, 4:49:40 PM
    Author     : X1 Nano
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            select, input[type="submit"], input[type="checkbox"] {
                margin: 10px 0;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                margin-bottom: 5px;
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:if test="${requestScope.exams eq null}">
                <c:if test="${requestScope.courses.size() > 0}">
                    <h1>Select Course</h1>
                    <form action="lecturer" method="POST">
                        <input type="hidden" name="lid" value="${param.lid}"/>
                        <div class="form-group">
                            <label for="cid">Course:</label>
                            <select name="cid" id="cid">
                                <c:forEach items="${requestScope.courses}" var="c">
                                    <option value="${c.id}">
                                        ${c.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="submit" value="View"/>
                    </form>
                </c:if>
            </c:if>
            <c:if test="${requestScope.exams ne null}">
                <h1>Select Exams</h1>
                <form action="take" method="GET">
                    <input type="hidden" name="cid" value="${param.cid}"/>
                    <c:forEach items="${requestScope.exams}" var="e">
                        <div class="form-group">
                            <input type="checkbox" name="eid" value="${e.id}" /> 
                            ${e.assessment.name}-(${e.from}:${e.assessment.weight}%) <br/>
                        </div>
                    </c:forEach>
                    <input type="submit" value="Take"/>
                </form>
            </c:if>
        </div>
    </body>
</html>

