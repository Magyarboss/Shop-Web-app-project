<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modeli.*"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link href="./css/headers.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link href="./css/login-page.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT Accessories</title>
    </head>
    <body>

        
        
    	<section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <div class="wrap">
                            <div class="img" style="background-image: url(https://wallpapertops.com/walldb/original/e/d/2/96430.jpg);"></div>         
                            <div class="login-wrap p-4 p-md-5">
                                
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Prijavi se</h3>
                                    </div>
                                </div>
                                
                                <form action="LoginServlet" class="signin-form" method="POST">
                                <div class="form-group mt-3">
                                    <input id="username" name="username" type="text" class="form-control" required>
                                    <label class="form-control-placeholder" for="username">Korisničko ime</label>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" name="password" type="password" class="form-control" required>
                                    <label class="form-control-placeholder" for="password-field" >Lozinka</label>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <%
                                    if(request.getAttribute("incorrect-login") != null) {
                                %>
                                        <p style="color:red;"><%= request.getAttribute("incorrect-login")%></p>
                                <%
                                        request.setAttribute("incorrect-login", null);
                                    }
                                %>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary rounded submit px-3">Prijavi se</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50 text-left">
                                        <label class="checkbox-wrap checkbox-primary mb-0">Zapamti me?
                                            <input type="checkbox" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="#">Zaboravili ste lozinku?</a>
                                    </div>
                                </div>
                                </form>
                                
                                <p class="text-center">Još se niste registrirali? <a href="RegisterServlet">Registriraj se</a></p>   
                                <p  class="text-center"><a style="color:#4267B2" href="IndexServlet">Povratak nazad</a></p>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	</section>
        
                                
        <!-- ============= FOOTER// ============== -->    
       
        <div class="container">
            <footer class="py-3 my-4">
                <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                    <li class="nav-item"><a href="IndexServlet" class="nav-link px-2 text-muted">Početna</a></li>
                    <li class="nav-item"><a href="dostava.jsp" class="nav-link px-2 text-muted">Dostava</a></li>
                    <li class="nav-item"><a href="reklamacije.jsp" class="nav-link px-2 text-muted">Reklamacije</a></li>
                    <li class="nav-item"><a href="cestapitanja.jsp" class="nav-link px-2 text-muted">Česta pitanja</a></li>
                    <li class="nav-item"><a href="kontakt.jsp" class="nav-link px-2 text-muted">Kontakt</a></li>
                    <li class="nav-item"><a href="Onama.jsp" class="nav-link px-2 text-muted">O nama</a></li>
                </ul>
                <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                    <p class="text-center text-muted">©Razor Sharp Technologies, Inc</p>

                    <li class="ms-3"><a class="text-muted" href="https://twitter.com/"><i class="bi bi-twitter"></i></a></li>
                    <li class="ms-3"><a class="text-muted" href="https://www.instagram.com/"><i class="bi bi-instagram"></i></a></li>
                    <li class="ms-3"><a class="text-muted" href="https://web.facebook.com/"><i class="bi bi-facebook"></i></a></li>
                </ul>
            </footer>
                                
        </div>                        
        
        <script src="./javascript/jquery.min.js"></script>
        <script src="./javascript/popper.js"></script>
        <script src="./javascript/bootstrap.min.js"></script>
        <script src="./javascript/main.js"></script>
        
    </body>
</html>
