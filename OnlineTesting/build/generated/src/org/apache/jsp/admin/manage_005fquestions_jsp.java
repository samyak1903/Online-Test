package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.unisoft.model.*;
import java.util.ArrayList;

public final class manage_005fquestions_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    int testId = Integer.parseInt(request.getParameter("testId"));
    if (request.getMethod().equals("POST")) {
        String questionText = request.getParameter("questionText");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");
        Question q = new Question(testId, questionText, optionA, optionB, optionC, optionD, correctOption);
        DBManager.addQuestion(q);
    }

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
      out.write("            #questions\n");
      out.write("            {\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("            #questions th,#questions td\n");
      out.write("            {\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 15px;\n");
      out.write("                font-size: 1.1em;\n");
      out.write("            }\n");
      out.write("            #questions,#questions th,#questions td\n");
      out.write("            {\n");
      out.write("                border: 1px solid silver;\n");
      out.write("                border-collapse: collapse;\n");
      out.write("            }\n");
      out.write("            .highlight\n");
      out.write("            {\n");
      out.write("                background-color: silver;\n");
      out.write("            }            \n");
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
      out.write("                    <form style=\"width:600px\" action=\"manage_questions.jsp?id=");
      out.print( testId);
      out.write("\" method=\"POST\">\n");
      out.write("                        <fieldset>\n");
      out.write("                            <legend>Add New Question</legend>\n");
      out.write("                            <table border=\"0\" cellpadding=\"10\">\n");
      out.write("                                <tbody>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>Question Text : </td>\n");
      out.write("                                        <td><textarea name=\"questionText\" rows=\"6\" cols=\"50\"></textarea></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>Option A : </td>\n");
      out.write("                                        <td><input type=\"text\" name=\"optionA\" required value=\"\" /></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>Option B : </td>\n");
      out.write("                                        <td><input type=\"text\" name=\"optionB\" required value=\"\" /></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>Option C : </td>\n");
      out.write("                                        <td><input type=\"text\" name=\"optionC\" required value=\"\" /></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>Option D : </td>\n");
      out.write("                                        <td><input type=\"text\" name=\"optionD\" required value=\"\" /></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>Correct Option: </td>\n");
      out.write("                                        <td>\n");
      out.write("                                            <select name=\"correctOption\">\n");
      out.write("                                                <option>A</option>\n");
      out.write("                                                <option>B</option>\n");
      out.write("                                                <option>C</option>\n");
      out.write("                                                <option>D</option>\n");
      out.write("                                            </select>\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td colspan=\"2\" align=\"right\">\n");
      out.write("                                            <input type=\"submit\" name=\"submit\" value=\"Add Question\" />\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                </tbody>\n");
      out.write("                            </table>\n");
      out.write("                        </fieldset>\n");
      out.write("                    </form>\n");
      out.write("                    <hr>\n");
      out.write("                    ");

                        ArrayList<Question> list = DBManager.getAllQuestions(testId);
                    
      out.write("\n");
      out.write("                    ");
 if (list.size() == 0) { 
      out.write("\n");
      out.write("                    <h2>There are no question in this Test. Please add some questions.</h2>\n");
      out.write("                    ");
 } else {
      out.write("\n");
      out.write("                    <table id=\"questions\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr class=\"highlight\">\n");
      out.write("                                <th width=\"5%\">S.No.</th>\n");
      out.write("                                <th width=\"40%\">Question Text</th>\n");
      out.write("                                <th width=\"10%\">Option A</th>\n");
      out.write("                                <th width=\"10%\">Option B</th>\n");
      out.write("                                <th width=\"10%\">Option C</th>\n");
      out.write("                                <th width=\"10%\">Option D</th>\n");
      out.write("                                <th width=\"5%\">Correct Option</th>\n");
      out.write("                                <th width=\"10%\">&nbsp;</th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody>\n");
      out.write("                            ");

                                int i = 1;
                                for (Question q : list) {
                            
      out.write("\n");
      out.write("                            <tr ");
 if (i % 2 == 0) {
      out.write(" class=\"highlight\" ");
 }
      out.write(">\n");
      out.write("                                <td>");
      out.print( i );
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( q.getQuestionText() );
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( q.getOptionA() );
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( q.getOptionB() );
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( q.getOptionC() );
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( q.getOptionD() );
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( q.getCorrectOption() );
      out.write("</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <a href=\"edit_question.jsp?id=");
      out.print( q.getId() );
      out.write("\"><img src=\"../images/b_edit.png\" alt=\"\"/></a>   \n");
      out.write("                                    /\n");
      out.write("                                    <a href=\"delete_question.jsp?id=");
      out.print( q.getId() );
      out.write("\" onclick=\"return confirm('Are you sure')\"><img src=\"../images/b_drop.png\" alt=\"\"/></a>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            ");
  i++;
                                }
                            
      out.write("\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>                \n");
      out.write("                    ");
 } 
      out.write("\n");
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
