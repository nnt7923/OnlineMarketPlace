package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Student;

public class StudentDBContext extends DBContext {

    public List<String> getStudentIDs() {
        List<String> studentIDs = new ArrayList<>();
        String sql = "SELECT studentID FROM Students";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String studentID = resultSet.getString("studentID");
                studentIDs.add(studentID);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentIDs;
    }

    public Student getStudentById(String studentID) {
        Student student = null;
        String sql = "SELECT studentID, studentName, BirthDate, Gender, MajorID FROM Students WHERE studentID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, studentID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String id = resultSet.getString("studentID");
                String name = resultSet.getString("studentName");
                java.sql.Date birthDate = resultSet.getDate("BirthDate");
                boolean gender = resultSet.getBoolean("Gender");
                String majorID = resultSet.getString("MajorID");
                student = new Student(id, name, new Date(birthDate.getTime()), gender, majorID);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }

    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT studentID, studentName, BirthDate, Gender, MajorID FROM Students";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("studentID");
                String name = resultSet.getString("studentName");
                java.sql.Date birthDate = resultSet.getDate("BirthDate");
                boolean gender = resultSet.getBoolean("Gender");
                String majorID = resultSet.getString("MajorID");
                Student student = new Student(id, name, new Date(birthDate.getTime()), gender, majorID);
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public String getMajorNameById(String majorID) {
        String majorName = null;
        String sql = "SELECT MajorName FROM Major WHERE MajorID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, majorID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                majorName = resultSet.getString("MajorName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return majorName;
    }

    public List<Student> getStudentsByMajor(String majorID) {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT studentID, studentName, BirthDate, Gender, MajorID FROM Students WHERE MajorID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, majorID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("studentID");
                String name = resultSet.getString("studentName");
                java.sql.Date birthDate = resultSet.getDate("BirthDate");
                boolean gender = resultSet.getBoolean("Gender");
                Student student = new Student(id, name, new Date(birthDate.getTime()), gender, majorID);
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
    
    
}
