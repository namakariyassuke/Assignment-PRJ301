<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        h1, h2 {
            text-align: center;
            color: #333;
        }
        .course-select {
            width: 60%;
            margin: 20px auto;
            text-align: center;
        }
        .course-select select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .hidden {
            display: none;
        }
        .total {
            font-weight: bold;
            background-color: #e9e9e9;
        }
        .status-passed {
            color: green;
        }
        .status-failed {
            color: red;
        }
    </style>
</head>
<body>
    <h1>Grade Transcript</h1>
    <h2>Student's Name: ${requestScope.sname}</h2>
    </div>
    <form action="student" method="post">
        <input type="hidden" name="sid" value="${param.sid}"/>
        <br>
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Subject</th>
                    <th>Assessment Name</th>
                    <th>Weight</th>
                    <th>Score</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="grade" items="${grades}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${grade.exam.subject.name}</td>
                        <td>${grade.exam.assessment.name}</td>
                        <td>${grade.exam.assessment.weight}%</td>
                        <td>${grade.score}</td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <c:set var="totalScore" value="0" />
                <c:set var="totalWeight" value="0" />
                <c:forEach var="grade" items="${grades}">
                    <c:set var="totalScore" value="${totalScore + (grade.score * grade.exam.assessment.weight / 100)}" />
                    <c:set var="totalWeight" value="${totalWeight + grade.exam.assessment.weight}" />
                </c:forEach>
                <c:set var="average" value="${totalScore / (totalWeight / 100)}" />
                <tr>
                    <td colspan="4" class="total">Course Average</td>
                    <td colspan="2" class="total"><fmt:formatNumber value="${average}" type="number" minFractionDigits="1" maxFractionDigits="1"/></td>
                </tr>
                <tr>
                    <td colspan="4" class="total">Status</td>
                    <td colspan="2" class="${average >= 5.0 ? 'status-passed' : 'status-failed'}">${average >= 5.0 ? 'PASSED' : 'FAILED'}</td>
                </tr>
            </tfoot>
        </table>
    </form>
</body>
</html>
