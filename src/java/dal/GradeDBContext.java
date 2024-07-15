/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assessment;
import model.Exam;
import model.Grade;
import model.Student;
import model.Subject;

/**
 *
 * @author sonnt-local
 */
public class GradeDBContext extends DBContext<Grade> {

    public ArrayList<Grade> getGradesFromExamIds(ArrayList<Integer> eids) {
        ArrayList<Grade> grades = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT eid,sid,score FROM grades WHERE (1>2)";
            for (Integer eid : eids) {
                sql += " OR eid = ?";
            }

            stm = connection.prepareStatement(sql);

            for (int i = 0; i < eids.size(); i++) {
                stm.setInt((i + 1), eids.get(i));
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Grade g = new Grade();
                g.setScore(rs.getFloat("score"));

                Student s = new Student();
                s.setId(rs.getInt("sid"));
                g.setStudent(s);

                Exam e = new Exam();
                e.setId(rs.getInt("eid"));
                g.setExam(e);

                grades.add(g);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return grades;
    }

    public void insertGradesForCourse(int cid, ArrayList<Grade> grades) {
        String sql_check = "SELECT COUNT(*) FROM grades WHERE sid = ? AND eid = ?";
        String sql_update = "UPDATE grades SET score = ? WHERE sid = ? AND eid = ?";
        String sql_insert = "INSERT INTO [grades] ([eid], [sid], [score]) VALUES (?, ?, ?)";

        PreparedStatement stm_check = null;
        PreparedStatement stm_update = null;
        PreparedStatement stm_insert = null;

        try {
            connection.setAutoCommit(false);

            stm_check = connection.prepareStatement(sql_check);
            stm_update = connection.prepareStatement(sql_update);
            stm_insert = connection.prepareStatement(sql_insert);

            for (Grade grade : grades) {
                stm_check.setInt(1, grade.getStudent().getId());
                stm_check.setInt(2, grade.getExam().getId());
                ResultSet rs = stm_check.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    // Update existing grade
                    stm_update.setFloat(1, grade.getScore());
                    stm_update.setInt(2, grade.getStudent().getId());
                    stm_update.setInt(3, grade.getExam().getId());
                    stm_update.executeUpdate();
                } else {
                    // Insert new grade
                    stm_insert.setInt(1, grade.getExam().getId());
                    stm_insert.setInt(2, grade.getStudent().getId());
                    stm_insert.setFloat(3, grade.getScore());
                    stm_insert.executeUpdate();
                }
                rs.close();
            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
                if (stm_check != null) {
                    stm_check.close();
                }
                if (stm_update != null) {
                    stm_update.close();
                }
                if (stm_insert != null) {
                    stm_insert.close();
                }
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Grade> viewStudentGrade(int sid) {
        ArrayList<Grade> grades = new ArrayList<>();
        String query = "SELECT  g.sid, s.sname, sub.subname, a.aname, a.weight, AVG(g.score) AS score\n"
                + "FROM grades g \n"
                + "JOIN students s ON g.sid = s.sid \n"
                + "JOIN exams e ON g.eid = e.eid \n"
                + "JOIN assesments a ON e.aid = a.aid \n"
                + "JOIN subjects sub ON a.subid = sub.subid \n"
                + "JOIN courses c ON sub.subid = c.subid \n"
                + "JOIN students_courses sc ON c.cid = sc.cid AND s.sid = sc.sid \n"
                + "WHERE g.sid = ?\n"
                + "GROUP BY g.sid, s.sname, sub.subname, a.aname, a.weight\n"
                + "ORDER BY sub.subname, a.aname";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(query);
            stm.setInt(1, sid);
            rs = stm.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("sid"));
                student.setName(rs.getString("sname"));

                Subject subject = new Subject();
                subject.setName(rs.getString("subname"));

                Assessment assessment = new Assessment();
                assessment.setName(rs.getString("aname"));
                assessment.setWeight(rs.getFloat("weight"));

                Exam exam = new Exam();
                exam.setSubject(subject);
                exam.setAssessment(assessment);

                Grade grade = new Grade();
                grade.setStudent(student);
                grade.setExam(exam);
                grade.setScore(rs.getFloat("score"));

                grades.add(grade);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return grades;
    }
    

    @Override
    public void insert(Grade model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Grade model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Grade model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Grade get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Grade> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void close() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
