<%-- 
    Document   : showproperty
    Created on : 18 Nov, 2016, 2:12:35 AM
    Author     : Nitish Aryan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="control.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ckeditor.samples.ConfigurationHelper"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> All Property | Knect</title>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/main.css" rel="stylesheet">
            <link href="css/shape.css" rel="stylesheet">
            <link rel="shortcut icon" href="images/ico/favicon.ico">
            <link rel="stylesheet" href="css/modal.css">
        
     <link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
    </head>
    <body class="b1" style="background: #218d21;">
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
                        <li ><a href="about.html">About Us</a></li>
                        <li class="active"><a href="showproperty.jsp">Show Property</a></li> 
                        <li><a href="Login.jsp">Login</a></li>
                        <li><a href="registration.html">Sign Up</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#add_project1">Feedback</a></li>                        
                    </ul>
                </div>
            </div><!--/.container-->
        </nav>
    </header>
       
        
        <div class=" container-fluid col-md-12"  id="o5" style="margin-top: 80px;">
            
            <p id="o5p"><b><u>RECENTLY ADDED ALL PROPERTY</u></b></p>
            <%
                    Connection con;
                    con=ConnectDB.connect();
                    Statement st=con.createStatement();
                                String phl; int sn;
                                ResultSet   rs,rs1;
                                rs=st.executeQuery("select * from site Where S_no = (SELECT MAX(S_no) from site)");
                              
                              Boolean b;
                              b=rs.next();
                                  sn=rs.getInt("S_no");
                              do
                              {
                                  rs1=st.executeQuery("select * from site Where S_no = '"+sn+"'");
                                  b=rs1.next();
                                  if(sn==0){
                                      break;
                                  }
                                  if(b==true)
                                  {
                                      
                                  phl="images/"+rs1.getString("Photo");
                              %>
            
            <div class="col-md-3 col-sm-6 "  id="o6" >
                
                <img src="<%=phl%>" height="270" width="260" class="img-responsive">
                <h3 style="font-weight:900;"><%=rs1.getString("Site_name")%></h3>
                <%=rs1.getString("Location")%><br>
                <span style="font-weight:100;"><%=rs1.getString("Address")%></span><br>
                <p><%=rs1.getInt("Area")%> <b> Area(in Sq.Ft) | </b><%=rs1.getInt("BedRoom")%><b> BedRoom's <br> </b> <%=rs1.getInt("BathRoom")%> <b>BathRoom</b></p>
                <p> <img src="images/in.png" height="20" weight="20"><b><%=rs1.getInt("Price")%></b> <b>/-</b></p>
                 <form action='ShowDetailf.jsp' method='post'>
                    <Button type="submit" value="<%=rs1.getString("Site_Name")%>" name="detail" style="background:green; color:white;">See Details</button></form>
                
                </div>
                
            <%
                 }sn--;
                              }while(true);
                %>
                
            
             
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <footer class="footer-distributed" style="padding-top:50px;">

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
               
        
        
         <ckeditor:replace replace="editor5" basePath="ckeditor/"
   config="<%= ConfigurationHelper.createConfig() %>" />
        
        
        
    </body>
</html>
