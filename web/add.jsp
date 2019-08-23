<%-- 
    Document   : home
    Created on : 16 Nov, 2016, 11:00:15 AM
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
    if(session.getAttribute("id")==null )
    {
        response.sendRedirect("Login.jsp");
    }
    String er =null;
    if(session.getAttribute("admin")==null)
    {
        RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
    }else{
        er=(String) session.getAttribute("admin");
        
            if(er.equals("admin"))
            {
                er="block";
            }
            else{
                er="none";
                
            }
        
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/cd.css">
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
          <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">  
        
          
          <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/home.js">
            
            </script>
          
          
          
          
        <title>Site | User</title>
    </head>
    <body class="home">
        <% String ph="images/"+session.getAttribute("pic");%>
    <div class="container-fluid display-table">
        <div class="row display-table-row">
            <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
                <div class="logo">
                    <a href="index.jsp"><img src="images/logo.png" alt="logo" class="hidden-xs hidden-sm">
                        <img src="images/logo.png" alt="logo" class="visible-xs visible-sm circle-logo">
                    </a>
                </div>
                <div class="navi">
                    <ul>
                        <li ><a href="home.jsp"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Home</span></a></li>
                        <li class="active"><a href="add.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Add Site</span></a></li>
                        <li><a href="list.jsp"><i class="fa fa-th-list" aria-hidden="true"></i><span class="hidden-xs hidden-sm">List Site</span></a></li>
                        <li><a href="profile.jsp"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Profile</span></a></li>
                         <li style="display:<%=er%>;"><a href="sitelist.jsp"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">All Client Site</span></a></li>
                        <li style="display:<%=er%>;"><a href="profilelist.jsp"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">All Client Profile</span></a></li>
                        <li style="display:<%=er%>;"><a href="feedlist.jsp"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">All FeedBack </span></a></li>
                    
                    </ul>
                </div>
            </div>
            <div class="col-md-10 col-sm-11 display-table-cell v-align">
                <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                <div class="row">
                    <header>
                        <div class="col-md-5">
                            <nav class="navbar-default pull-left">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="#side-menu" aria-expanded="false">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                            </nav>
                <!--            <div class="search hidden-xs hidden-sm">
                                <input type="text" placeholder="Search" id="search">
                            </div>   -->
                        </div>
                        <div class="col-md-7">
                            <div class="header-rightside">
                                <ul class="list-inline header-top pull-right">
                                   <li class=""><a href="#" id="p6" class="add-project" data-toggle="modal" data-target="#add_project">Add Site</a></li>   
                                    <li><a href="#"><i class="fa fa-envelope" title="Inbox" aria-hidden="true"></i></a></li>
                                    <li>
                                        <a href="home.jsp" class="icon-info">
                                             <i class="fa fa-bell" title="Notification" aria-hidden="true"></i> 
                                    <!--        <span class="label label-primary">3</span>   -->
                                        </a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=ph%>" alt="user">
                                            <b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <div class="navbar-content">
                                                    <span><%=session.getAttribute("name")%></span>
                                                    <p class="text-muted small">
                                                       <%=session.getAttribute("mail")%>
                                                    </p>
                                                    <div class="divider">
                                                    </div>
                                                    <a href="logout" class="view btn-sm active">Log Out</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </header>
                </div>
                <div class="user-dashboard">
                   <%
                    Connection con;
                    con=ConnectDB.connect();
                    Statement st=con.createStatement();
                                String s=(String) session.getAttribute("id") ,phl;
                              ResultSet   rs=st.executeQuery("select * from site Where UserId='"+s+"'");
                              Boolean s1=rs.next();
                                     if(s1==false)
                                     {%>
                                     <h3 style="background:#0d172e; color:white; text-align:center;padding:10px;">You haven't Add Any Property yet<br>Please add Your Site... </h3><%
                                     }
                                     else{
                              %>
                    
                    <div class="  col-md-12 col-sm-12"  id="o5">
            
            <p id="o5p"><b><u>RECENT ADDED PROPERTY</u></b></p>
             <%
                              do
                              {
                            
                                  
                              phl="images/"+rs.getString("Photo");
                    %>
                
            
            <div class="col-md-3 col-sm-5 "  id="o6" >
                
                              
                               
                <img src="<%=phl%>" height="268" width="260" class="img-responsive">
                <h3 style="font-weight:900; font-size: 18px;"><%=rs.getString("Site_name")%></h3>
                <%=rs.getString("Location")%> <br>
                <span style="font-weight:100;"><%=rs.getString("Address")%> </span><br>
                <p><%=rs.getInt("Area")%> <b> Area(in Sq.Ft) | </b><%=rs.getInt("BedRoom")%><b> BedRoom's <br> </b> <%=rs.getInt("BathRoom")%> <b>BathRoom</b></p>
                <p style='font-size: 18px;'> <img src="images/in.png" height="20" weight="20"> <%=rs.getInt("Price")%> <b>/-</b></p>
                <form action='ShowDetail.jsp' method='post'>
                    <Button type="submit" value="<%=rs.getString("Site_Name")%>" name="detail" style="background:green; color:white;">See Details</button></form>
                
                </div>
                
                
            <% }while(rs.next());} rs.close(); %>
            
            
            
        
        </div>
                    
                    
                    
                </div>
            </div>
        </div>

    </div>



   
    <!-- Modal -->
    <div id="add_project" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header login-header">
                    <button type="button" class="close" data-dismiss="modal" style="color:white;">×</button>
                    <h4 class="modal-title">Add Your Site</h4>
                </div>
                <form action="addsite" method="post" enctype="multipart/form-data">
                <div class="modal-body " >
                    <input type="text" required="" placeholder="Site Name" name="sname" class="col-md-7" style="margin-right: 10px;">
                            <input type="text" required=""  placeholder="Price" name="sprice"  style=" width:39%">
                            <input type="text" required=""  placeholder="Area In Sq. Ft." name="sarea" class="col-md-4" style="margin-right: 10px;">
                            <input type="text" required=""  placeholder="No.of BedRoom" name="sbedroom" class="col-md-4" style="margin-right: 10px;">
                            <input type="text" required=""  placeholder="No. of BathRoom" name="sbathroom"  style="width:28.1%">
                           <input type="text"  required="" placeholder="Location" name="slocation"  style="width:38% ;margin-right: 10px;">
                           <input type="text" required=""  placeholder="Site Address" name="saddress" class="col-md-7" style="margin-right: 10px;">
                           <input type="text" required=""  placeholder="Phone Number" name="snumber" class="col-md-6" style="margin-right: 10px;">
                           <input type="email"  required="" placeholder="E-Mail Id" name="semail" style="width:48%;">
                            <p class="col-md-5" style="margin-right: 10px; " id="kl">Upload Your Site Image:<input type="file" required=""   name="sfile" style="border:none;font-weight:500;" > </p>
                           <textarea id="editor5"  placeholder="Desicrption" name="describe" rows="5"></textarea>
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
