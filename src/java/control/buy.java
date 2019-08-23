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
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class buy extends HttpServlet {

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
        response.sendRedirect("showproperty.jsp");
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
        Connection con;
         PrintWriter out=response.getWriter();
           HttpSession session=request.getSession();
           String s;
        try {
            con=ConnectDB.connect();
            PreparedStatement ps=con.prepareStatement("insert into buy(Cname,Cemail,Cmobile,Cmessage,Cdate,UserId,SiteName) value(?,?,?,?,?,?,?)");
             ps.setString(1, request.getParameter("cname"));
             ps.setString(2, request.getParameter("cemail"));
             ps.setLong(3, Long.parseLong(request.getParameter("cmobile")));
             s=request.getParameter("cmessage") +"☺";
             ps.setString(4, s);
             Date now = new Date();
                 SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
                 ps.setString(5, (String)ft.format(now));
                 
                  ps.setString(6,(String) session.getAttribute("id1"));
                   ps.setString(7, (String) session.getAttribute("name1"));
                  
                   
                 
                   ps.execute();
                   
                    session.removeAttribute("id1");
                     session.removeAttribute("name1");
                     
                           
             RequestDispatcher rd=request.getRequestDispatcher("showproperty.jsp");
            rd.include(request, response);
             out.println("<html>\n" +
"<body>\n" +
"<script type=\"text/javascript\">\n" +
"alert(\"Your message send SuccessFully...\");\n" +
"</script>\n" +
"</body>\n" +
"</html>");
             
            
        } catch (Exception ex) {
            
            RequestDispatcher rd=request.getRequestDispatcher("showproperty.jsp");
            rd.include(request, response);
             out.println("<html>\n" +
"<body>\n" +
"<script type=\"text/javascript\">\n" +
"alert(\"Your message didnot Send Successfully \\n Something is wrong...\");\n" +
"</script>\n" +
"</body>\n" +
"</html>");
            
            
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
