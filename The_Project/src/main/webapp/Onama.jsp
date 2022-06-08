<%-- 
    Document   : Onama
    Created on : Apr 24, 2022, 5:48:48 PM
    Author     : Magyarboss
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <!-- ============= HEADER ============== -->    
        <header class="p-3 bg-dark text-white">
            <div  class="container-fluid">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="IndexServlet" class="nav-link px-2 text-white">Početna</a></li>
                        <li><a href="cestapitanja.jsp" class="nav-link px-2 text-white">Česta pitanja</a></li>
                        <li><a href="kontakt.jsp" class="nav-link px-2 text-white">Kontakt</a></li>
                        <li><a href="Onama.jsp" class="nav-link px-2 text-white">O nama</a></li>
                    </ul>
                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                        <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
                    </form>
                    
                    <c:if test="${loggedUser!=null}" >
                        <div style="margin-left:5px;margin-right: 5px;" class="dropdown text-end">
                            <a href="#" class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png" alt="mdo" width="32" height="32" class="rounded-circle">
                            ${imeprezime}
                            </a>
                            <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                                <li><a class="dropdown-item" href="#">Profil</a></li>
                                <li><a class="dropdown-item" href="#">Povijest kupnje</a></li>
                                <li><a class="dropdown-item" href="#">Promjena lozinke</a></li>
                                <li><a class="dropdown-item" href="#">Postavke</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="LogoutServlet">Odjavi se</a></li>
                            </ul>
                        </div> 
                    </c:if>
                    <div class="text-end">
                        <c:if test="${loggedUser==null}" >
                            <a href="LoginServlet" class="btn btn-outline-light me-2">Prijava</a>
                            <a href="RegisterServlet" class="btn btn-warning">Registracija</a>
                        </c:if>
                        
                        <div style="margin-left: 10px" class="float-end">
                            <c:if test="${kosarica==null}">
                                <a href="PrikazKosariceServlet" class="btn btn-warning"> Moja košarica <i class="bi bi-cart4"></i> </a>
                            </c:if>
                            <c:if test="${kosarica!=null}">
                                <a href="PrikazKosariceServlet" class="btn btn-warning"> Moja košarica <i class="bi bi-cart4"></i> (${kosarica.size()}) </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <hr style="margin: 0 0 0 0 "></hr>
        
        <header class="p-3 bg-dark text-white">
            <div class="container-fluid">
                <a href="IndexServlet"  class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
                    <h1  style="color:white;"><b><i>Razor Sharp Technologies</i> Inc.</b> </h1>
                </a>
            </div>
        </header>
        
        <div class="b-example-divider"></div>
    <!-- ============= HEADER END ============== -->   
        
        
        
        
        
        
        
        
        
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
        
    </body>
</html>
