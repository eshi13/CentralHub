<%@ page import="com.acms.CentralSellerPortal.Controllers.SpringSessionController" %>
<%@ page import="com.acms.CentralSellerPortal.Entities.Seller" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.acms.CentralSellerPortal.Entities.Product" %>
<%@ page import="org.springframework.http.ResponseEntity" %>
<%@ page import="com.acms.CentralSellerPortal.Controllers.SellerController" %>
<%@ page import="com.acms.CentralSellerPortal.Controllers.ProductController" %>
<%@ page import="org.springframework.web.bind.annotation.RequestMapping" %>
<%--<%@ page import="org.springframework.web.bind.annotation.RequestBody" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ecommerce Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/main.css">

    <%--    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>

</head>
<body>
<% long e_id = Long.parseLong(request.getParameter("e_id")); %>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="font-size: medium; background-color: #2A2A2A ; font-family: Ubuntu">
    <div class="container">
        <div class="navbar-header">
            <form class ="form-view" id="view-form-head"   method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <a  type="submit"  href="/EcommDashboard.jsp?e_id=<%=e_id%>" style="color: whitesmoke" class="btn"> Central Seller Portal</a>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>
        <div class="navbar-header">
            <form class ="form-view" id="view-form-viewprofile"  action = "/ecomm/viewEcommerce/<%=e_id%>" method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <button id = "view-profile" type="submit"   style="color: whitesmoke; background-color: #2A2A2A" class="btn"> View Your Profile</button>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>
        <div class="navbar-header">
            <form class ="form-view" id="view-form-update-ecomm"  method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <a class="btn" href="/UpdateEcommProfile.jsp?e_id=<%=e_id%>" style="color: whitesmoke; background-color: #2A2A2A" action="UpdateEcommProfile.jsp" role="button">Update Profile</a>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>
        <div class="navbar-header">
            <form class ="form-view" id="view-form-view-sellers" action="/products/displayAll/<%=e_id%>" method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <button id = "view-sellers" type="submit"   style="color: whitesmoke; background-color: #2A2A2A" class="btn"> View All Products</button>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>

        <%--        <div class="navbar-header">--%>
        <%--            <form class ="form-view" id="view-form-viewproduct"  action = "/products/displayBySellerId/<%=id%>" method="get">--%>
        <%--                <form :hidden path="id"/>--%>
        <%--                <div class="form-row">--%>
        <%--                    <div class="form-group">--%>
        <%--                        <button  id = "view-profile-viewproduct" type="submit"  style="color: whitesmoke; background-color: #2A2A2A" class="btn"> View Products</button>--%>
        <%--                    </div> <!-- form-group// -->--%>
        <%--                    <!-- form-group end.// -->--%>
        <%--                </div>--%>
        <%--            </form>--%>
        <%--        </div>--%>
        <div class="navbar-header">
            <form class ="form-view" id="view-form" action="/destroy" method="post">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <button class="btn" type="submit" style="color: whitesmoke; background-color: #2A2A2A" role="button">Logout</button>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>
    </div>
</nav>
<br>
<div class="row justify-content-center">
    <div class="col-md-6">
        <div class="card">
            <header class="card-header">

                <h4 class="card-title mt-2">Update Ecommerce Profile</h4>
            </header>
            <article class="card-body">

                <form class ="form-update" id="updation-form" action = "/ecomm/updateEcommerce/<%=e_id%>" method="post">
                    <form :hidden path="id"/>
                    <div class="form-row">
                        <div class="col form-group">
                            <label>Name </label>
                            <input type="text" id="c_name" name="c_name" class="form-control" value=${ecommName} placeholder=${ecommName}>
                        </div> <!-- form-group end.// -->
                        <!-- form-group end.// -->
                    </div> <!-- form-row end.// -->

                    <div class="form-group">
                        <label>Email address</label>
                        <input type="email" id="c_mail" name="c_mail" class="form-control"  value= ${ecommEmailId} placeholder=${ecommEmailId}>
                    </div> <!-- form-group end.// -->

                    <div class="form-group">
                        <label>Password</label>
                        <input class="form-control" id="c_password" name="c_password"  value=${ecommPassword} placeholder=${ecommPassword} type="password" >
                    </div> <!-- form-group end.// -->

                    <br>
                    <div class="form-group">
                        <button  type="submit"  class="btn btn-primary btn-block"> Save Changes</button>
                    </div> <!-- form-group// -->

                </form>
            </article> <!-- card-body end .// -->
            <!--<div class="border-top card-body text-center">Have an account? <a href="">Log In</a></div>-->
        </div> <!-- card.// -->
    </div> <!-- col.//-->

</div> <!-- row.//-->

<br><br>

<br>


</body>
</html>