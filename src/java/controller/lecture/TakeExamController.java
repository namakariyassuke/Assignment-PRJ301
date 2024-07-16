/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecture;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.ExamDBContext;
import dal.GradeDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
import model.Exam;
import model.Grade;
import model.Lecturer;
import model.Student;
import model.User;

/**
 *
 * @author sonnt-local
 */
public class TakeExamController extends BaseRequiredLecturerAuthenticationController {
   
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response,User user, Lecturer lecturer)
    throws ServletException, IOException {
      // Initialize database contexts for students, exams, and grades
        StudentDBContext stuDB = new StudentDBContext();
        ExamDBContext examDB = new ExamDBContext();
        GradeDBContext graDB = new GradeDBContext();
        
        // Get the course ID from the request parameter
        int cid = Integer.parseInt(request.getParameter("cid"));
        // Retrieve students for the specified course
        ArrayList<Student> students = stuDB.getStudentsByCourse(cid);
        
        // Get the exam IDs from the request parameters
        String[] raw_eids = request.getParameterValues("eid");
        ArrayList<Integer> eids = new ArrayList<>();
        for (String raw_eid : raw_eids) {
            eids.add(Integer.parseInt(raw_eid));
        }
        
        // Retrieve exams and grades for the specified exam IDs
        ArrayList<Exam> exams = examDB.getExamsByExamIds(eids);
        ArrayList<Grade> grades = graDB.getGradesFromExamIds(eids);
        
        // Set attributes for students, exams, and grades
        request.setAttribute("students", students);
        request.setAttribute("exams", exams);
        request.setAttribute("grades", grades);
        
        // Forward the request to the take.jsp page
        request.getRequestDispatcher("../view/exam/take.jsp").forward(request, response);
        
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response,User user, Lecturer lecturer)
    throws ServletException, IOException {
        // Get the course ID from the request parameter
        int cid = Integer.parseInt(request.getParameter("cid"));
        HashSet<Integer> eids = new HashSet<>();
        
        // Get the grade IDs from the request parameters
        String[] raw_gradeids = request.getParameterValues("gradeid");
        ArrayList<Grade> grades = new ArrayList<>();
        for (String raw_gradeid : raw_gradeids) {
            int sid = Integer.parseInt(raw_gradeid.split("_")[0]);
            int eid = Integer.parseInt(raw_gradeid.split("_")[1]);
            
            eids.add(eid);
            
            // Get the score for each student-exam pair
            String raw_score = request.getParameter("score" + sid + "_" + eid);
            if (raw_score.length() > 0) {
                Grade g = new Grade();
                Exam e = new Exam();
                e.setId(eid);
                
                Student s = new Student();
                s.setId(sid);
                
                g.setExam(e);
                g.setStudent(s);
                g.setScore(Float.parseFloat(raw_score));
                
                grades.add(g);
            }
        }
        
        // Update the grades in the database
        GradeDBContext db = new GradeDBContext();
        db.insertGradesForCourse(cid, grades);
        
        // Build URL parameters for redirecting back to the take exam page
        String url_param = "";
        for (Integer eid : eids) {
            url_param += "&eid=" + eid;
        }
        // Redirect back to the take exam page
        response.sendRedirect("take?cid=" + cid + url_param);
        
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
