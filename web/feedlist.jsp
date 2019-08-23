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
        <link rel="stylesheet" href="css/table.css">
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
          <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">  
        
          
          <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/home.js">
            
            </script>
          
          
          
          
        <title>List Site | User</title>
    </head>
    <body class="home">
        <% String ph="images/"+session.getAttribute("pic");%>
    <div class="container-fluid display-table">
        <div class="row display-table-row">
            <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
                <div class="logo">
                    <a href="index.jsp" style="cursor: pointer;"><img src="images/logo.png" alt="logo" class="hidden-xs hidden-sm">
                        <img src="images/logo.png" alt="logo" class="visible-xs visible-sm circle-logo">
                    </a>
                </div>
                <div class="navi">
                    <ul>
                        <li ><a href="home.jsp"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Home</span></a></li>
                        <li><a href="add.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Add Site</span></a></li>
                        <li ><a href="list.jsp"><i class="fa fa-th-list" aria-hidden="true"></i><span class="hidden-xs hidden-sm">List Site</span></a></li>
                        <li><a href="profile.jsp"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Profile</span></a></li>
                         <li style="display:<%=er%>;"><a href="sitelist.jsp"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">All Client Site</span></a></li>
                        <li style="display:<%=er%>;"><a href="profilelist.jsp"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">All Client Profile</span></a></li>
                        <li class="active" style="display:<%=er%>;"><a href="feedlist.jsp"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">All FeedBack </span></a></li>
                    
                    </ul>
                </div>
            </div>
            <div class="col-md-10 col-sm-11 display-table-cell v-align">
                <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                <div class="row">
                    <header>
                        <div class="col-md-7">
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
                            <div class="search hidden-xs hidden-sm">
                                <input type="text" placeholder="Search" id="search">
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="header-rightside">
                                <ul class="list-inline header-top pull-right">
                             <!--       <li class="hidden-xs"><a href="#" class="add-project" data-toggle="modal" data-target="#add_project">Add Project</a></li>   -->
                                    <li><a href="#"><i class="fa fa-envelope" title="Inbox" aria-hidden="true"></i></a></li>
                                    <li>
                                        <a href="home.jsp" class="icon-info">
                                          <i class="fa fa-bell" title="Notification" aria-hidden="true"></i>
                                     <!--       <span class="label label-primary">3</span>   -->
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
                                
                              ResultSet   rs=st.executeQuery("select * from feedback ");
                                 Boolean s1=rs.next();
                                     if(s1==false)
                                     {%>
                                         <h3 style="background:#0d172e; color:white; text-align:center;padding:10px;">Your FeedBack List is empty... </h3>
                                         <%
                                     }
                                     else{
                                   
                     %>
                    <div class="col-md-12 col-xs-12">
                         <form action="deleteprofile" method="get">
                    <table border="3" id="table" class="table-responsive">
                        
                        <th>#</th><th> Name</th><th>E-mail</th><th>Contact-No</th><th>Date</th><th colspan="3">Message</th>
                        
                        
                       
                              <%
                              do
                              {
                            %>
                        
                       
                        <tr >
                            <td><input type="checkbox" name="check" value="<%=rs.getString("Email")%>"></td>
                            <td><%=rs.getString("Name")%></td>
                            <td><%=rs.getString("Email")%></td>
                            <td><%=rs.getLong("Mobile")%></td>
                            <td><%=rs.getString("Date")%></td>
                            <td colspan="3"><%=rs.getString("feedback")%></td>
                            
                        </tr>
                        <%}while(rs.next()); }%>
                        
                        
                    </table>
                        <input class="btn btn-info" type="submit" style="float:right;margin-top:10px;margin-right:30px;" value="Delete">
                        
                                                </form>

                        *Note:- For Delete Your Site Please Select one at a Time..
                    </div>
                    
                </div>
            </div>
        </div>

    </div>



    
</body>
</html>
