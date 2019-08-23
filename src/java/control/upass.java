/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nitish Aryan
 */
public class upass extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect("profile.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw=response.getWriter();
        String s1,s2,s3;
        HttpSession session=request.getSession();
        Connection Con;
        try {
            Con=ConnectDB.connect();
            
            s1=request.getParameter("oldp");
          s2=request.getParameter("newp");
          
          s3=request.getParameter("newcp");
          
          if(s2.equals(s3))
          {
                 
              Statement st=Con.createStatement();
             
              ResultSet ty=st.executeQuery("SELECT Password from registration where E_mail='"+session.getAttribute("mail")+"'");
              if(ty.next())
              {
                  s3=ty.getString("Password");
              }
             
              if(s1.equals(s3)){
                  PreparedStatement ps=Con.prepareStatement("update registration set Password=? where E_mail=?");
                  ps.setString(1, s2);
                  ps.setString(2, (String) session.getAttribute("mail"));
                  ps.executeUpdate();
                  
             RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
            rd.include(request, response);
             pw.println("<html>\n" +
"<body>\n" +
"<script type=\"text/javascript\">\n" +
"alert(\"Your Password Change SuccessFully...\");\n" +
"</script>\n" +
"</body>\n" +
"</html>");
             
             
                  
                  
              }else{
               RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
            rd.include(request, response);
                  pw.println("<html>\n" +
"<body>\n" +
"<script type=\"text/javascript\">\n" +
"alert(\"Your Old Password did not Match...\");\n" +
"</script>\n" +
"</body>\n" +
"</html>");
                  
             
              
          }
          }else{
              RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
            rd.include(request, response);
              
               pw.println("<html>\n" +
"<body>\n" +
"<script type=\"text/javascript\">\n" +
"alert(\"Your Confirm Password did not Match...\");\n" +
"</script>\n" +
"</body>\n" +
"</html>");
               
              
             
          }
          
        } catch (Exception ex) {
            Logger.getLogger(upass.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
