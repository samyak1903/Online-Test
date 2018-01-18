package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.unisoft.model.*;
import java.util.ArrayList;

public final class manage_005ftest_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

    if (session.getAttribute("userName") == null) {
        response.sendRedirect("../login.jsp");
    } else if (!session.getAttribute("roleName").toString().equals("Admin")) {
        response.sendRedirect("../login.jsp");
    } else {

      out.write('\n');

    String examName = "";
    if (request.getMethod().equals("POST")) {
        examName = request.getParameter("examName");
        String testName = request.getParameter("testName");
        String description = request.getParameter("description");
        int numberOfQuestions = Integer.parseInt(request.getParameter("numberOfQuestions"));
        double passPercentage = Double.parseDouble(request.getParameter("passPercentage"));
        Test test = new Test(examName, testName, description, numberOfQuestions, passPercentage);
        DBManager.addTest(test);
    }
    examName = request.getParameter("examName");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <title>Online Testing : Admin Home</title>\n");
      out.write("        <meta name=\"Keywords\" content=\"\" />\n");
      out.write("        <meta name=\"Description\" content=\"\" />\n");
      out.write("        <link href=\"../css/default.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <style>\n");
      out.write("            #colTwo{\n");
      out.write("                width: 1072px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"header\">\n");
      out.write("            <h1>Online Testing</h1>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                <li><a href=\"view_reports.jsp\">Reports</a></li>\n");
      out.write("                <li><a href=\"changepassword.jsp\">Change Password</a></li>\n");
      out.write("                <li><a href=\"../logout\">Logout</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"content\">\n");
      out.write("            <div id=\"colTwo\">\n");
      out.write("                <div class=\"bg2\">\n");
      out.write("                    <h2>Available Tests in ");
      out.print( examName);
      out.write("</h2>\n");
      out.write("                    <hr>\n");
      out.write("                    <table style=\"float: left;\" cellpadding=\"5px\">\n");
      out.write("                        ");

                            ArrayList<Test> list = DBManager.getAllTests(examName);
                            for (Test test : list) {
                        
      out.write("\n");
      out.write("                        <tr>  \n");
      out.write("                            <td>");
      out.print( test.getTestName());
      out.write("</td>\n");
      out.write("                            <td><a class=\"link-style\" href=\"edit_test.jsp?id=");
      out.print( test.getId());
      out.write("\">Edit Test</a></td>\n");
      out.write("                            <td><a class=\"link-style\" href=\"manage_questions.jsp?id=");
      out.print( test.getId());
      out.write("\">Manage Questions</a></td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
 }
      out.write("\n");
      out.write("                    </table>\n");
      out.write("                    <form style=\"float: right;width: 500px\" action=\"manage_test.jsp\" method=\"POST\">\n");
      out.write("                        <fieldset>\n");
      out.write("                            <legend>Add New Test</legend>\n");
      out.write("                            <table border=\"0\" cellpadding=\"10\">\n");
      out.write("                                <tbody>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>Test Name : </td>\n");
      out.write("                                        <td><input type=\"text\" name=\"testName\" required value=\"\" /></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>Description : </td>\n");
      out.write("                                        <td><textarea name=\"description\" rows=\"6\" cols=\"35\"></textarea></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>Number Of Questions : </td>\n");
      out.write("                                        <td><input type=\"text\" name=\"numberOfQuestions\" required value=\"\" /></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>Pass Percentage : </td>\n");
      out.write("                                        <td><input type=\"text\" name=\"passPercentage\" required value=\"\" /></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td colspan=\"2\" align=\"right\">\n");
      out.write("                                            <input type=\"submit\" name=\"submit\" value=\"Add Test\" />\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                </tbody>\n");
      out.write("                            </table>\n");
      out.write("                            <input type=\"hidden\" name=\"examName\" value=\"");
      out.print( examName);
      out.write("\"\n");
      out.write("                        </fieldset>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"footer\">\n");
      out.write("            <p>&copy; OnlineTesting.com. All Rights Reserved. Design by <a href=\"#\" rel=\"nofollow\">Anonymous</a>.</p>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
 }
      out.write('\n');
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
