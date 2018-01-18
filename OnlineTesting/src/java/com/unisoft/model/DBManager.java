package com.unisoft.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.UUID;

public class DBManager {

    private static final String DBDRIVER = "com.mysql.jdbc.Driver";
    private static final String DBURL = "jdbc:mysql://localhost/online_testing";
    private static final String DBUSER = "root";
    private static final String DBPASSWORD = "root";

    static {
        try {
            Class.forName(DBDRIVER);
        } catch (Exception ex) {
            System.out.println("Error loading the Driver : " + ex);
        }
    }

    public static boolean addExam(Exam exam) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("insert into exams values(?,?)");) {
            st.setString(1, exam.getExamName());
            st.setString(2, exam.getDescription());
            st.executeUpdate();
            status = true;
        } catch (Exception ex) {
            System.out.println("Error addExam : " + ex);
        }
        return status;
    }

    public static boolean updateExam(Exam exam) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("update exams set Description=? where ExamName=?");) {

            st.setString(1, exam.getDescription());
            st.setString(2, exam.getExamName());
            st.executeUpdate();
            status = true;
        } catch (Exception ex) {
            System.out.println("Error updateExam : " + ex);
        }
        return status;
    }

    public static Exam getExam(String examName) {
        Exam exam = null;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from exams where ExamName=?");) {
            st.setString(1, examName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                exam = new Exam();
                exam.setExamName(rs.getString(1));
                exam.setDescription(rs.getString(2));
            }
        } catch (Exception ex) {
            System.out.println("Error getExam : " + ex);
        }
        return exam;
    }

    public static ArrayList<Exam> getAllExams() {
        ArrayList<Exam> list = new ArrayList<Exam>();
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from exams order by ExamName");) {
            ResultSet rs = st.executeQuery();       //Read
            while (rs.next()) {
                Exam e = new Exam();
                e.setExamName(rs.getString(1));
                e.setDescription(rs.getString(2));
                list.add(e);
            }
        } catch (Exception ex) {
            System.out.println("Error getAllExams : " + ex);
        }
        return list;
    }

    public static boolean addTest(Test test) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("insert into tests(ExamName,TestName,Description,NumberOfQuestions,PassPercentage) values(?,?,?,?,?)");) {
            st.setString(1, test.getExamName());
            st.setString(2, test.getTestName());
            st.setString(3, test.getDescription());
            st.setInt(4, test.getNumberOfQuestions());
            st.setDouble(5, test.getPassPercentage());
            st.executeUpdate();
            status = true;
        } catch (Exception ex) {
            System.out.println("Error addTest : " + ex);
        }
        return status;
    }

    public static boolean updateTest(Test test) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("update tests set Description=?,NumberOfQuestions=?,PassPercentage=? where id=?");) {

            st.setString(1, test.getDescription());
            st.setInt(2, test.getNumberOfQuestions());
            st.setDouble(3, test.getPassPercentage());
            st.setInt(4, test.getId());
            st.executeUpdate();
            status = true;
        } catch (Exception ex) {
            System.out.println("Error updateTest : " + ex);
        }
        return status;
    }

    public static Test getTest(int id) {
        Test test = null;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from tests where id=?");) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                test = new Test();
                test.setId(rs.getInt(1));
                test.setExamName(rs.getString(2));
                test.setTestName(rs.getString(3));
                test.setDescription(rs.getString(4));
                test.setNumberOfQuestions(rs.getInt(5));
                test.setPassPercentage(rs.getDouble(6));
            }
        } catch (Exception ex) {
            System.out.println("Error getTest : " + ex);
        }
        return test;
    }

    public static ArrayList<Test> getAllTests(String examName) {
        ArrayList<Test> list = new ArrayList<>();
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from tests where ExamName=? order by TestName");) {
            st.setString(1, examName);
            ResultSet rs = st.executeQuery();       //Read
            while (rs.next()) {
                Test test = new Test();
                test.setId(rs.getInt(1));
                test.setExamName(rs.getString(2));
                test.setTestName(rs.getString(3));
                test.setDescription(rs.getString(4));
                test.setNumberOfQuestions(rs.getInt(5));
                test.setPassPercentage(rs.getDouble(6));
                list.add(test);
            }
        } catch (Exception ex) {
            System.out.println("Error getAllTests : " + ex);
        }
        return list;
    }

    public static boolean addQuestion(Question q) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("insert into questions(TestId,QuestionText,OptionA,OptionB,OptionC,OptionD,CorrectOption) values(?,?,?,?,?,?,?)");) {
            st.setInt(1, q.getTestId());
            st.setString(2, q.getQuestionText());
            st.setString(3, q.getOptionA());
            st.setString(4, q.getOptionB());
            st.setString(5, q.getOptionC());
            st.setString(6, q.getOptionD());
            st.setString(7, q.getCorrectOption());

            st.executeUpdate();
            status = true;
        } catch (Exception ex) {
            System.out.println("Error addTest : " + ex);
        }
        return status;
    }

    public static boolean updateQuestion(Question q) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("update questions set QuestionText=?, OptionA=?,OptionB=?,OptionC=?,OptionD=?,CorrectOption=? where id=?");) {

            st.executeUpdate();
            status = true;
        } catch (Exception ex) {
            System.out.println("Error updateTest : " + ex);
        }
        return status;
    }

    public static Question getQuestion(int id) {
        Question q = null;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from questions where id=?");) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                q = new Question();
                q.setId(rs.getInt(1));
                q.setTestId(rs.getInt(2));
                q.setQuestionText(rs.getString(3));
                q.setOptionA(rs.getString(4));
                q.setOptionB(rs.getString(5));
                q.setOptionC(rs.getString(6));
                q.setOptionD(rs.getString(7));
                q.setCorrectOption(rs.getString(8));
            }
        } catch (Exception ex) {
            System.out.println("Error getTest : " + ex);
        }
        return q;
    }

    public static ArrayList<Question> getAllQuestions(int testId) {
        ArrayList<Question> list = new ArrayList<Question>();
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from questions where TestId=?");) {
            st.setInt(1, testId);
            ResultSet rs = st.executeQuery();       //Read
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt(1));
                q.setTestId(rs.getInt(2));
                q.setQuestionText(rs.getString(3));
                q.setOptionA(rs.getString(4));
                q.setOptionB(rs.getString(5));
                q.setOptionC(rs.getString(6));
                q.setOptionD(rs.getString(7));
                q.setCorrectOption(rs.getString(8));
                list.add(q);
            }
        } catch (Exception ex) {
            System.out.println("Error getAllTests : " + ex);
        }
        return list;
    }

    public static UserInfo loginUser(String userName, String password) {
        UserInfo info = null;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from users where UserName=? and Password = password(?)");) {
            st.setString(1, userName);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();       //Read
            if (rs.next()) {
                info = new UserInfo();
                info.setUserName(rs.getString("UserName"));
                info.setRoleName(rs.getString("RoleName"));
                info.setName(rs.getString("Name"));
            }
        } catch (Exception ex) {
            System.out.println("Error loginUser : " + ex);
        }
        return info;
    }

    public static boolean isUserExists(String userName) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from users where UserName=?");) {
            st.setString(1, userName.toLowerCase());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                status = true;
            }
        } catch (Exception ex) {
            System.out.println("Error isUserExists : " + ex);
        }
        return status;
    }

    public static String getSecretQuestion(String userName) {
        String secretQuestion = null;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select SecretQuestion from users where UserName=?");) {
            st.setString(1, userName.toLowerCase());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                secretQuestion = rs.getString("SecretQuestion");
            }
        } catch (Exception ex) {
            System.out.println("Error getSecretQuestion : " + ex);
        }
        return secretQuestion;
    }

    public static boolean isAnswerCorrect(String userName, String secretQuestion, String answer) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select Answer from users where UserName=? and SecretQuestion=?");) {
            st.setString(1, userName.toLowerCase());
            st.setString(2, secretQuestion);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String correctAnswer = rs.getString("Answer");
                if (answer.equalsIgnoreCase(correctAnswer)) {
                    status = true;
                }
            }
        } catch (Exception ex) {
            System.out.println("Error isAnswerCorrect : " + ex);
        }
        return status;
    }

    public static String resetPassword(String userName) {
        String password = null;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("update users set Password=password(?) where UserName=?");) {
            password = generatePassword();
            st.setString(1, password);
            st.setString(2, userName.toLowerCase());

            st.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Error isAnswerCorrect : " + ex);
        }
        return password;
    }

    public static boolean changePassword(String userName, String password) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("update users set Password=password(?) where UserName=?");) {
            st.setString(1, password);
            st.setString(2, userName.toLowerCase());

            st.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Error isAnswerCorrect : " + ex);
        }
        return status;
    }

    public static boolean registerUser(UserInfo info) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("insert into users values(?,password(?),?,?,?,?,?)");) {
            st.setString(1, info.getUserName().toLowerCase());
            st.setString(2, info.getPassword());
            st.setString(3, info.getRoleName());
            st.setString(4, info.getEmail());
            st.setString(5, info.getName());
            st.setString(6, info.getSecretQuestion());
            st.setString(7, info.getAnswer());
            st.executeUpdate();
            status = true;
        } catch (Exception ex) {
            System.out.println("Error registerUser : " + ex);
        }
        return status;
    }

    public static String generatePassword() {
        String password = UUID.randomUUID().toString();
        password = password.substring(0, 6);
        return password;
    }

    public static boolean addReport(Report r) {
        boolean status = false;
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("insert into reports(UserName,ExamName,TestName,DateOfExam,Score,Result) values(?,?,?,?,?,?)");) {
            st.setString(1, r.getUserName());
            st.setString(2, r.getExamName());
            st.setString(3, r.getTestName());
            st.setDate(4, new java.sql.Date(r.getDateOfExam().getTime()));
            st.setDouble(5, r.getScore());
            st.setString(6, r.getResult());

            st.executeUpdate();
            status = true;
        } catch (Exception ex) {
            System.out.println("Error addReport : " + ex);
        }
        return status;
    }

    public static ArrayList<Report> getReports(String userName) {
        ArrayList<Report> list = new ArrayList<Report>();
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from reports where UserName=?  order by DateOfExam");) {
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();       //Read
            while (rs.next()) {
                Report r = new Report();
                r.setId(rs.getInt(1));
                r.setUserName(rs.getString(2));
                r.setExamName(rs.getString(3));
                r.setTestName(rs.getString(4));
                r.setDateOfExam(new java.util.Date(rs.getDate(5).getTime()));
                r.setScore(rs.getDouble(6));
                r.setResult(rs.getString(7));
                list.add(r);
            }
        } catch (Exception ex) {
            System.out.println("Error getAllTests : " + ex);
        }
        return list;
    }

    public static ArrayList<Report> getAllReports() {
        ArrayList<Report> list = new ArrayList<Report>();
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from reports  order by DateOfExam");) {
            ResultSet rs = st.executeQuery();       //Read
            while (rs.next()) {
                Report r = new Report();
                r.setId(rs.getInt(1));
                r.setUserName(rs.getString(2));
                r.setExamName(rs.getString(3));
                r.setTestName(rs.getString(4));
                r.setDateOfExam(new java.util.Date(rs.getDate(5).getTime()));
                r.setScore(rs.getDouble(6));
                r.setResult(rs.getString(7));
                list.add(r);
            }
        } catch (Exception ex) {
            System.out.println("Error getAllTests : " + ex);
        }
        return list;
    }

    public static ArrayList<Report> getAllReports(String startDate, String endDate) {
        ArrayList<Report> list = new ArrayList<Report>();
        try (
                Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                PreparedStatement st = con.prepareStatement("select * from reports where DateOfExam between ? and ? order by DateOfExam");) {
            java.util.Date sd = DateConverter.toDate(startDate);
            java.util.Date ed = DateConverter.toDate(endDate);
            st.setDate(1, DateConverter.toSqlDate(sd));
            st.setDate(2, DateConverter.toSqlDate(ed));
            ResultSet rs = st.executeQuery();       //Read
            while (rs.next()) {
                Report r = new Report();
                r.setId(rs.getInt(1));
                r.setUserName(rs.getString(2));
                r.setExamName(rs.getString(3));
                r.setTestName(rs.getString(4));
                r.setDateOfExam(new java.util.Date(rs.getDate(5).getTime()));
                r.setScore(rs.getDouble(6));
                r.setResult(rs.getString(7));
                list.add(r);
            }
        } catch (Exception ex) {
            System.out.println("Error getAllTests : " + ex);
        }
        return list;
    }
}
