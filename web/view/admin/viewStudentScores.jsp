<%-- 
    Document   : viewStudentScores
    Created on : Jul 14, 2024, 11:04:07 PM
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Scores</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* Đổi màu nền thành màu trắng */
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container">
        <h2>Scores for <%= request.getAttribute("studentName") %></h2>
        <canvas id="scoreChart" width="400" height="200"></canvas>
        <script>
            var labels = [<%= ((List<String>) request.getAttribute("labels")).stream().map(label -> "'" + label + "'").collect(Collectors.joining(",")) %>];
            var scores = [<%= ((List<Float>) request.getAttribute("scores")).stream().map(String::valueOf).collect(Collectors.joining(",")) %>];

            var ctx = document.getElementById('scoreChart').getContext('2d');
            var scoreChart = new Chart(ctx, {
                type: 'line', // Đổi thành biểu đồ đường
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Scores',
                        data: scores,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1,
                        fill: false, // Không tô màu dưới đường
                        tension: 0.1 // Độ cong của đường
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
        <a href="<%= request.getContextPath() %>/admin/selectStudent">Back</a><br>
        <a href="<%= request.getContextPath() %>/login">Logout</a>
    </div>
</body>
</html>
