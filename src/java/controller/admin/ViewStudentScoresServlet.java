package controller.admin;

import dal.GradeDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Grade;
import model.Student;

public class ViewStudentScoresServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the current session, do not create one if it doesn't exist
        HttpSession session = request.getSession(false);
        // Check if the session or user is null
        if (session == null || session.getAttribute("user") == null) {
            // Redirect to login page if the user is not authenticated
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get the student ID from the request parameters
        String studentIdParam = request.getParameter("sid");
        // Check if the student ID is missing or empty
        if (studentIdParam == null || studentIdParam.isEmpty()) {
            request.setAttribute("errorMessage", "Student ID is missing.");
            request.getRequestDispatcher("/view/admin/selectStudent.jsp").forward(request, response);
            return;
        }

        int studentId;
        try {
            // Parse the student ID to an integer
            studentId = Integer.parseInt(studentIdParam);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Student ID.");
            request.getRequestDispatcher("/view/admin/selectStudent.jsp").forward(request, response);
            return;
        }

        // Create instances of the database context classes
        GradeDBContext gradeDB = new GradeDBContext();
        StudentDBContext studentDB = new StudentDBContext();

        // Retrieve the grades and student information from the database
        ArrayList<Grade> grades = gradeDB.viewStudentGrade(studentId);
        Student student = studentDB.get(studentId);

        // Check if the student exists
        if (student == null) {
            request.setAttribute("errorMessage", "Student does not exist.");
            request.getRequestDispatcher("/view/admin/selectStudent.jsp").forward(request, response);
            return;
        }

        // Prepare labels and scores for the chart
        List<String> labels = new ArrayList<>();
        List<Float> scores = new ArrayList<>();

        for (Grade grade : grades) {
            labels.add(grade.getExam().getSubject().getName() + " - " + grade.getExam().getAssessment().getName());
            scores.add(grade.getScore());
        }

        // Set attributes to be forwarded to the JSP page
        request.setAttribute("studentName", student.getName());
        request.setAttribute("labels", labels);
        request.setAttribute("scores", scores);
        // Forward the request to the viewStudentScores JSP page
        request.getRequestDispatcher("/view/admin/viewStudentScores.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
