<%-- 
    Document   : newjspShowDetailf
    Created on : 18 Nov, 2016, 9:37:42 AM
    Author     : Nitish Aryan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="control.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ckeditor.samples.ConfigurationHelper"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<% 
    String s=request.getParameter("detail");
    if(s==null)
    {
        response.sendRedirect("showproperty.jsp");
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property Info | Knect</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/main.css" rel="stylesheet">
            <link href="css/shape.css" rel="stylesheet">
            <link rel="shortcut icon" href="images/ico/favicon.ico">
            <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/modal.css">
     <link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
    </head>
    <body  style="background: #218d21; color:white;" >
        
        <header>
         <nav class="navbar navbar-inverse navbar-fixed-top" role="banner" >
            <div class="container">
                <div class="navbar-header">
                   
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right ">
                    
               
                    <ul class="nav navbar-nav">
                        <li ><a href="index.jsp">Home</a></li>
                        <li><a href="about-us.html">About Us</a></li>
                        <li><a href="showproperty.jsp">Show Property</a></li>
                        <li><a href="Login.jsp">Login</a></li>
                        <li><a href="registration.html">Sign Up</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#add_project1">Feedback</a></li> 
                                                
                    </ul>
                </div>
            </div><!--/.container-->
        </nav>
    </header>
        
        
        <div class="bod container  ty" style="margin-top: 90px; margin-bottom:  20px; padding-top:10px; padding-bottom: 10px; ">
        <div class="bod-1 col-md-10 container" style="padding-bottom:10px;">
      <div class="bod-1-1 row" style="text-align: center;">
      <h2 id="pt"> $$ Property Full Details And Fill Form For Buy  $$</h2>
      </div>
      <div class="bod-1-1 row">
        <div class="">
             <% 
                Connection con;
                String e=null;
                con=ConnectDB.connect();
                     Statement st=con.createStatement();  ResultSet rs,rs1;
                      rs=st.executeQuery("select * from site Where Site_Name='"+s+"'");
                     if(rs.next())
                     {
                     e="images/" +rs.getString("Photo");
                     session.setAttribute("id1", rs.getString("UserId"));
                     session.setAttribute("name1", rs.getString("Site_Name"));
                     
                     
                %>
            <img src="<%=e%>" class="img-responsive" id="iml" alt="Property Image" width="500px">
        <div id="p1">
           
         
                <p > <b> Site  Name :- </b><span id="tit"> <%=rs.getString("Site_Name")%></span></>
                <p  > <b> About :-</b><span id="des"><%= rs.getString("Description")%></span></p>
                            <p><b>Price :- &nbsp;</b>  <img src="images/in.png" style="max-width: 15px; max-width: 15px;" > <%=rs.getInt("Price")%> <b>/-</b> </p> 
                            <p><b>Area :- </b> <%=rs.getInt("Area")%> <b> (in Sq.Ft.)</b></p>
                            <p><b>No. Of BedRooms :- </b> <%=rs.getInt("BedRoom")%></p>
                            <p><b>No. Of BathRooms :- </b> <%=rs.getInt("BathRoom")%></p>
                            <p><b>Location :- </b> <%=rs.getString("Location")%></p>
                        <p><b> Address :- </b> <%=rs.getString("Address")%></p>
                        <p><b> Mobile :- </b> <%=rs.getString("Mobile")%></p>
                        <p><b> E-mail :- </b> <%=rs.getString("Email")%></p>
                        
        </div>
                             
                                    
                            
      </div>

    </div>

    <ul class="comment-list">
        <% rs1=st.executeQuery("select * from registration Where USERID='"+ rs.getString("UserId")+"'");
                            if(rs1.next()){
                                %>
                                <h5 class="post-author_head">Property Posted By: <a href="#" title="Posts by <%=rs1.getString("UserName")%>" rel="author"> <%=rs1.getString("UserName")%></a></h5>
		  		   
		  		   <div class="desc">
                                       <p><b> Contact No:-</b> <a href="#"  rel="author" style="color:#00aeff;"><%=rs1.getLong("Contact_No")%></a></p>
                                       <p> <b>Email Id:- </b><a href="#" rel="author" style="color:#00aeff;"><%=rs1.getString("E_mail")%></a></p>
		  		   </div>
		  		   <div class="clearfix"></div>
		  		   </li>
		  	  </ul>
                                       <%
                                              }rs1.close();
                                              
                                           %>
			  <div class="content-form">
                              <h2 style="color:white;"><b>:- For Buy This Property Please Fill This Form  -:</b></h2>
					<form action="buy" method="post">
						<input placeholder=" Customer Name" required="" type="text" name="cname">
                                                <input placeholder=" Customer Email" required="" type="text" name="cemail">
						<input placeholder="Customer Phone" required="" type="text" name="cmobile">
						<textarea placeholder=" Customer Message" id="editor1" required="" name="cmessage"></textarea>
                                                
                                                
                                                
						<input value="SEND MESSAGE" type="submit" >
				   </form>
						 </div>

<%
                                        
                             } rs.close();
                            %>





  </div>
        
        
        
        </div>
        
        
        
        
        
         
        <footer class="footer-distributed " style="padding-top:50px;">

			<div class="footer-left" id="fl">

				<h3>K-<span>Nect</span></h3>

				<p class="footer-links">
					<a href="index.jsp">Home</a>
					·
					<a href="about.html">About us</a>
					·
					<a href="Login.jsp">Login</a>
					·
					<a href="registration.html">Sign Up</a>
					·
					<a href="#" data-toggle="modal" data-target="#add_project1">FeedBack</a>
					·
                                        <a href="terms.html">T&C</a>
				</p>

				<p class="footer-company-name">KNECT &copy; 2016</p>
			</div>

			<div class="footer-center" id="fl">

				<div style="margin-bottom:5px;">
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="font-weight:900; font-size:30px;"></span>
					<p><span> 83 Piller ,RajaBazar </span> Patna, India</p>
				</div>

				<div  style="margin-bottom:5px;">
					<span class="glyphicon glyphicon-earphone" aria-hidden="true" style="font-weight:900; font-size:20px;"></span>
					<p> +91 9939979769, 8271237935</p>
				</div>

				<div style="margin-bottom:5px;">
					<span class="glyphicon glyphicon-envelope" aria-hidden="true" style="font-weight:900; font-size:20px;"></span>
					<p><a href="mailto:support@company.com">Knect@gmail.com</a></p>
				</div>

			</div>

			<div class="footer-right" id="fl">

				<p class="footer-company-about">
					<span>About the company</span>
					Knect is India's No 1 Property portal and has been adjudged as the most preferred property site in India, by independent surveys. 
				</p>

				<div class="footer-icons">

					<a href="#"><img src="images/fb.png" height="20" width="15"></a>
					<a href="#"><img src="images/goo.png" height="20" width="20"></a>
					<a href="#"><img src="images/tw.png" height="30" width="30"></a>
					<a href="#"><img src="images/li.png" height="30" width="30"></a>

				</div>

			</div>

		</footer>
     
        
           <script src="js/jquery.js"></script>
            <script src="js/jquery-2.1.1.min.js"></script>
            <script src="js/jquery.cycle2.min.js"></script>
        
               <script src="js/bootstrap.min.js"></script>  
               
               
               
                             
    <!-- Modal -->
    <div id="add_project1" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header login-header">
                    <button type="button" class="close" data-dismiss="modal" style="color:white;">×</button>
                    <h4 class="modal-title">Give Your Site FeedBack</h4>
                </div>
                <form action="feedback" method="post" >
                <div class="modal-body " >
                    <input type="text" required="" placeholder="Enter Your Name" name="fname" style="width:100%;" >
                    <input type="email" required=""  placeholder="Enter Your Email" name="femail" style="width:100%;" >
                           <input type="text" required=""  placeholder="Enter Your Mobile Number" name="fnumber" style="width:100%;" >
                      <textarea id="editor5"  placeholder="Your FeedBack" name="fmessage" rows="5"></textarea>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="cancel" data-dismiss="modal">Close</button>
                    <button type="submit" class="add-project" >Save</button>
                </div>
                </form>
            </div>

        </div>
    </div>
               
               
               
               
               
               
        
        <ckeditor:replace replace="editor1" basePath="ckeditor/"
   config="<%= ConfigurationHelper.createConfig() %>" />
    </body>
</html>
