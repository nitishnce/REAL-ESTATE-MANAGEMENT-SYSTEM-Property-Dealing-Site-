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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nitish Aryan
 */
public class store extends HttpServlet {

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
        response.sendRedirect("index.jsp");
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
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
    {
        System.out.println("scdsv");
        PrintWriter out=res.getWriter();
        System.out.println("scdsv");
        
        try{
         
          Connection Con= ConnectDB.connect();
            
          PreparedStatement ps=Con.prepareStatement("insert into registration(UserName,USERID,Password,Address,Profession,Contact_No,E_mail,userlog,Photo) value(?,?,?,?,?,?,?,?,?)");
          
           ps.setString(1, req.getParameter("UName"));
           String p=req.getParameter("UName")+"^";
           char[] fg= p.toCharArray();
           p="$";
           
           
          
           for(int q=0;fg[q]!='^';q++)
           {
               p=p+fg[q];
               if(fg[q+1]==' ')break;
              
           }
           int z=1;
            Statement st=Con.createStatement();
           ResultSet rs=st.executeQuery("SELECT S_no FROM registration WHERE S_no = ( SELECT MAX(S_no) FROM registration)");
      while(rs.next()) {
       
        z=rs.getInt("S_no")+z;
               
       }
           p=p+z;
           ps.setString(2, p);
           ps.setString(3, req.getParameter("Password"));
           ps.setString(4, req.getParameter("Address"));
           ps.setString(5, req.getParameter("Profession"));
           ps.setLong(6, Long.parseLong(req.getParameter("Contact")));
          
           ps.setString(7, req.getParameter("Email"));
           ps.setString(8, "client");
           ps.setString(9, "user.png");
           
            ps.execute();
            out.println("<html> <head>");
           out.println("<title>Account Created</title>");
           out.println("</head> <body bgcolor='#e2eef4'>");
           
           out.println("<h1 align='center'>YOU Have Succesfully Created Your Account. &</h1>");
           out.print("<h3 align='center'> Your User Id : <h1 align='center'>"+ p +" </h1></h3> ");
          out.println(" <p align='center'><a href='Login.jsp' >  Click Here</a> For Login </p>");
          out.println("</body></html>");
          
          
        }
        catch(Exception e)
        {
            System.out.println(e);
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
