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
        /* CSS styles for the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* Change background color to white */
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
    <!-- Import Chart.js library from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container">
        <!-- Display student name -->
        <h2>Scores for <%= request.getAttribute("studentName") %></h2>
        <!-- Canvas element for Chart.js -->
        <canvas id="scoreChart" width="400" height="200"></canvas>
        <script>
            // Convert labels and scores from server-side to JavaScript variables
            var labels = [<%= ((List<String>) request.getAttribute("labels")).stream().map(label -> "'" + label + "'").collect(Collectors.joining(",")) %>];
            var scores = [<%= ((List<Float>) request.getAttribute("scores")).stream().map(String::valueOf).collect(Collectors.joining(",")) %>];

            // Get the context of the canvas element
            var ctx = document.getElementById('scoreChart').getContext('2d');
            // Create a new Chart instance
            var scoreChart = new Chart(ctx, {
                type: 'line', // Change to line chart
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Scores',
                        data: scores,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1,
                        fill: false, // Do not fill the area under the line
                        tension: 0.1 // Set line tension for smoothing
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true // Start y-axis at zero
                        }
                    }
                }
            });
        </script>
        <!-- Links for navigation -->
        <a href="<%= request.getContextPath() %>/admin/selectStudent">Back</a><br>
        <a href="<%= request.getContextPath() %>/login">Logout</a>
    </div>
</body>
</html>
