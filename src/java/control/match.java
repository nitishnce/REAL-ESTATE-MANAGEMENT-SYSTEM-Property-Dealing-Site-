/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class match extends HttpServlet {

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
        response.sendRedirect("Login.jsp");
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
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
    {
        res.setContentType("text/html");
        PrintWriter pw=res.getWriter();
        try{
        
          Connection Con= ConnectDB.connect();
        String q,w,e,r,t,y,u,b,log,ph;
        Long n;
        q=req.getParameter("user");
        w=req.getParameter("password");
        Statement st=Con.createStatement();
        ResultSet ty=st.executeQuery("SELECT * from registration ");
            HttpSession session=req.getSession();
        while(ty.next())
        {
            e=ty.getString("USERID");
            r=ty.getString("Password");
         t=ty.getString("UserName");
         y=ty.getString("Address");
         u=ty.getString("Profession");
         n=ty.getLong("Contact_No");
         b=ty.getString("E_mail");
         log=ty.getString("userlog");
         ph=ty.getString("Photo");
            if((q.equals(e) )&& (w.equals(r)))
            {
                session.setAttribute("id", e);
                session.setAttribute("name", t);
                session.setAttribute("address", y);
                session.setAttribute("kaam", u);
                session.setAttribute("mobile", n);
                session.setAttribute("mail", b);
                session.setAttribute("pic",ph);
                session.setAttribute("admin", log);
                res.sendRedirect("home.jsp");
                
                
            }
              
        }
        RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
            rd.include(req, res);
            
             pw.println("<html>\n" +
"<body>\n" +
"       <script type=\"text/javascript\">\n" +
"        alert(\"Your User Id or Password Invalid.\");\n" +
"    </script>           \n" +
"</body>\n" +
"</html>");
               
        }catch(Exception e)
        {
            
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
