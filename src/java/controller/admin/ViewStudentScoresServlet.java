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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String studentIdParam = request.getParameter("sid");
        if (studentIdParam == null || studentIdParam.isEmpty()) {
            request.setAttribute("errorMessage", "Student ID is missing.");
            request.getRequestDispatcher("/view/admin/selectStudent.jsp").forward(request, response);
            return;
        }

        int studentId;
        try {
            studentId = Integer.parseInt(studentIdParam);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Student ID.");
            request.getRequestDispatcher("/view/admin/selectStudent.jsp").forward(request, response);
            return;
        }

        GradeDBContext gradeDB = new GradeDBContext();
        StudentDBContext studentDB = new StudentDBContext();

        ArrayList<Grade> grades = gradeDB.viewStudentGrade(studentId);
        Student student = studentDB.get(studentId);

        if (student == null) {
            request.setAttribute("errorMessage", "Student does not exist.");
            request.getRequestDispatcher("/view/admin/selectStudent.jsp").forward(request, response);
            return;
        }

        List<String> labels = new ArrayList<>();
        List<Float> scores = new ArrayList<>();

        for (Grade grade : grades) {
            labels.add(grade.getExam().getSubject().getName() + " - " + grade.getExam().getAssessment().getName());
            scores.add(grade.getScore());
        }

        request.setAttribute("studentName", student.getName());
        request.setAttribute("labels", labels);
        request.setAttribute("scores", scores);
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
