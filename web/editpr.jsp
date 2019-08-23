<%-- 
    Document   : home
    Created on : 4 Nov, 2016, 8:56:37 AM
    Author     : Nitish Aryan
--%>

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
        <title>Edit Profile | User</title>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/cd.css">
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="stylesheet" href="css/pro.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
          <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">  
        
          
          <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/home.js">
            
            </script>
    </head>
    
    <body class="home">
        
         <% String ph="images/"+session.getAttribute("pic");%>
    <div class="container-fluid display-table">
        <div class="row display-table-row">
            <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
                <div class="logo">
                    <a href="index.jsp"><img src="images/logo.png" alt="Knect_logo" class="img-responsive" style="padding-top:  30px;padding-bottom: 5px;">
                        
                    </a>
                </div>
                <div class="navi">
                     <ul>
                       <li ><a href="home.jsp"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Home</span></a></li>
                        <li><a href="add.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Add Site</span></a></li>
                        <li><a href="list.jsp"><i class="fa fa-th-list" aria-hidden="true"></i><span class="hidden-xs hidden-sm">List Site</span></a></li>
                        <li class="active"><a href="profile.jsp"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Profile</span></a></li>
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
                        <div class="col-md-7">
                            <nav class="navbar-default pull-left">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="#side-menu" aria-expanded="false" style="margin:5px 6px 6px 6px;">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                            </nav>
                            
                        </div>
                        <div class="col-md-5">
                            <div class="header-rightside">
                                <ul class="list-inline header-top pull-right">
                      <!--              <li class=""><a href="#" class="add-project" data-toggle="modal" data-target="#add_project" id="p">Share Ur Story</a></li>    -->
                                    <li><a href="#"><i class="fa fa-envelope" title="Inbox" aria-hidden="true" title="Inbox"></i></a></li>
                                    <li>
                                        <a href="home.jsp" class="icon-info">
                                             <i class="fa fa-bell" aria-hidden="true" title="Notification"></i> 
                                         <!--   <span class="label label-primary">3</span>   -->
                                        </a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=ph%>" alt="user">
                                            <b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <div class="navbar-content">
                                                    <span><%=session.getAttribute("name") %></span>
                                                    <p class="text-muted small">
                                                        <%=session.getAttribute("mail") %>
                                                    </p>
                                                    <div class="divider">
                                                    </div>
                                                    <a href="logout"  class="view btn-sm active">Log out</a>
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
                   
                    
                    
                    <div class="hek" style=" font-size: 40px; ">
                        <form action="editpro" method="post" enctype="multipart/form-data">
                         <table  align="center" class="tb" >
                <th colspan="2" style="text-align: center; font-family: Alexuss Heavy; padding: 10px; background: #0e1a35;color:#5584ff;"><u>Profile</u></th>
                
               <tr>
                    <td><b>User Id: </b> </td><td> <%=session.getAttribute("id") %></td>
                </tr>
                <tr>
                    <td><b>User Name: </b> </td><td> <input type="text"  placeholder="<%=session.getAttribute("name") %>" name="name"></td>
                </tr>
                <tr>
                    <td><b>Address: </b> </td><td> <input type="text"  placeholder="<%=session.getAttribute("address") %>" name="address"></td>
                </tr>
                <tr>
                    <td><b>Profession: </b> </td><td> <input type="text"  placeholder="<%=session.getAttribute("kaam") %>" name="kaam"></td>
                </tr>
                <tr>
                    <td><b>Mobile No: </b> </td><td> <input type="text"  placeholder="<%=session.getAttribute("mobile") %>" name="mobile"></td>
                </tr>
               <tr>
                    <td><b>E-mail: </b> </td><td> <input type="email"  placeholder="<%=session.getAttribute("mail") %>" name="mail"></td>
                </tr>
                <tr>
                    <td><b>Photo: </b> </td><td style="text-align: center; font-size: 18px;"> <input type="file" name="image"></td>
                </tr>
                <tr >
                    <td colspan="2" style="text-align: center;"><button class="btn btn-success" name="use" value="cancel" id="sb">Cancel</button> <button class="btn btn-info"  name="use" value="save" id="sb" >Save</button> </td>
                </tr>
                
                
            </table>
                        </form>
                    </div>
                    
                  
                  
                </div>
            </div>
        </div>

    </div>



    

</body>

</html>
