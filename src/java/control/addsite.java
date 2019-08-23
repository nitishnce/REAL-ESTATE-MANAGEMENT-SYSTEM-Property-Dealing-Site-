package control;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Nitish Aryan
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 100)    
public class addsite extends HttpServlet {

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
    
    private String getFileName(Part part) {
final String partHeader = part.getHeader("content-disposition");
System.out.println("***** partHeader: " + partHeader);
for (String content : part.getHeader("content-disposition").split(";")) {
if (content.trim().startsWith("filename")) {
return content.substring(content.indexOf('=') + 1).trim()
.replace("\"", "");
}
}
return null;
}
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con;
         HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
         InputStream inputStream = null;
                    OutputStream outputStream = null;
                       out.println("555555555dxcjd");
         
        try {
            con=ConnectDB.connect();
               out.println("dxcgggggggggggjd");
            PreparedStatement ps=con.prepareStatement("insert into site(UserId,Site_Name,Price,Area,BedRoom,BathRoom,Location,Address,Mobile,Email,Photo,Description) value(?,?,?,?,?,?,?,?,?,?,?,?)");
           ps.setString(1, (String) session.getAttribute("id"));
            ps.setString(2, request.getParameter("sname"));
            out.println("dxcjd");
            ps.setInt(3, Integer.parseInt(request.getParameter("sprice")));
            ps.setInt(4, Integer.parseInt(request.getParameter("sarea")));
            ps.setInt(5, Integer.parseInt(request.getParameter("sbedroom")));
            ps.setInt(6, Integer.parseInt(request.getParameter("sbathroom")));
             out.println("dxcjjjjjjjjjjjd");
            ps.setString(7, request.getParameter("slocation"));
            ps.setString(8, request.getParameter("saddress"));
            ps.setLong(9, Long.parseLong(request.getParameter("snumber")));
            ps.setString(10, request.getParameter("semail"));
            ps.setString(12, request.getParameter("describe"));
            out.println("dxcjdjghhhhhhhhhhhhhyj");
            
            String imageName=null ,s3;
         
          Part filePart = request.getPart("sfile");
         
                  imageName = getFileName(filePart);
          
          
          s3=imageName;
 
                 String basePath = "E:\\net\\project\\web\\images\\";
                 
                 File outputFilePath = new File(basePath + imageName);
                 out.println("dxc77777777777jd");

                        inputStream = filePart.getInputStream();
                        out.println("dxc77777777777jd555555");
                    outputStream = new FileOutputStream(outputFilePath);
                        out.println("dxc777777778888777jd");
                            int read = 0;
                        final byte[] bytes = new byte[1024];out.println("dxlllllllllc77777777777jd");
                        while ((read = inputStream.read(bytes)) != -1) {out.println("dxc788888887777777777jd");
                         outputStream.write(bytes, 0, read);
                        }
                        out.println("sdzfcdsz");
          ps.setString(11, s3);
          ps.execute();
          response.sendRedirect("add.jsp");
            
            
            
            
            
            
        } catch (Exception ex) {
            Logger.getLogger(addsite.class.getName()).log(Level.SEVERE, null, ex);
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
