<%@page import="modeli.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="./css/headers.css" rel="stylesheet">
        <script src="./javascript/sidebar-nav-submenu.js"></script>
        <link rel="stylesheet" href="./css/sidebar-nav-submenu.css">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT Accessories</title>
          
    </head>
    <body class="d-flex flex-column min-vh-100">
        
        
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
                    <form class="col-auto col-auto mb-3 mb-md-0 me-3">
                        <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
                    </form>
                    
                    <c:if test="${loggedUser!=null}" >
                        <div  class="dropdown text-end mx-2">
                            <a href="#" class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                <c:if test="${slikaprofila==null}">
                                    <img src="./slike/slikeprofila/blank-profile-picture-973460__340.png" alt="mdo" width="32" height="32" class="rounded-circle">
                                </c:if>
                                <c:if test="${slikaprofila!=null}">
                                    <img src="./slike/slikeprofila/${slikaprofila}" alt="mdo" width="32" height="32" class="rounded-circle">
                                </c:if>
                            ${ime}
                            </a>
                            <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                                <li><a class="dropdown-item" href="mojprofil.jsp">Moj profil</a></li>
                                <li><a class="dropdown-item" href="PovijestKupnjeServlet">Povijest kupnje</a></li>
                                <li><a class="dropdown-item" href="#">Promjena lozinke</a></li>
                                
                                <c:if test="${loggedUser=='Administrator'}" >
                                <li><a class="dropdown-item" href="dodavanjeproizvoda.jsp">Dodavanje proizvoda</a></li>
                                </c:if>
                                <li><a class="dropdown-item" href="#">Postavke</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="LogoutServlet">Odjavi se</a></li>
                            </ul>
                        </div> 
                    </c:if>
                    <div class="text-end mx-2">
                        <c:if test="${loggedUser==null}" >
                            <a href="LoginServlet" class="btn btn btn-success me-2">Prijava</a>
                            <a href="RegisterServlet" class="btn btn-success me-2">Registracija</a>
                        </c:if>
                        
                        <div  class="float-end mx-2">
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
        
        <hr style="margin: 0 0 0 0;color: whitesmoke "></hr>
        
        <header class="p-3 bg-dark text-white">
            <div class="container-fluid d-flex justify-content-sm-center justify-content-lg-start align-content-lg-center mb-lg-0 ">
                <a href="IndexServlet"  class="text-dark text-decoration-none">
                    <h1  style="color:white;"><b><i> Razor Sharp Technologies </i> Inc.</b> </h1>
                </a>
            </div>
        </header>
        
        <div class="b-example-divider"></div>
    <!-- ============= HEADER END ============== -->
        
        
        
        <h1>${imeprezime}, ovo je sadržaj Vaše košarice</h1>
        <h1><a href="IndexServlet">Vratite se na popis proizvoda</a></h1>
        
        <br/><hr/><br/>
        <div class="container">
        <table class="table table-bordered table-hover">
            <tr><th>Naziv proizvoda</th><th>Opis</th><th>Cijena [Kn]</th>
                <th>Kolicina</th><th>Vrijednost [Kn]</th><th>Akcija</th></tr>
            <c:forEach var="puk" items="${kosarica}">
                <tr>
                    <td>${puk.naziv}</td>
                    <td>${puk.opis}</td>
                    <td><fmt:formatNumber value="${puk.cijena}" minFractionDigits="2" maxFractionDigits="2" /> Kn</td>
                    <td>
                        <form action="PromjeniKolicinuServlet" method="post">
                            <input type="hidden" name="id" value="${puk.IDProizvod}" />                           
                            <input type="number" value="${puk.kolicina}" 
                                   min="1" max="${puk.kolicinaNaSkladistu}" step="1"
                                   name="novakolicina" />
                            <input type="submit" value="Promijeni"/>
                        </form>   
                    </td>
                    <td><fmt:formatNumber value="${puk.cijena*puk.kolicina}" minFractionDigits="2" maxFractionDigits="2" />
                      </td>
                    <td>
                       <form action="BrisiKosaricaServlet" method="post">
                            <input type="hidden" name="id" value="${puk.getIDProizvod()}" />                           
                            <input type="submit" value="Obriši"/>
                        </form>   
                    </td>
                </tr>
            </c:forEach>
        </table>
        </div>
        
        <c:if test="${loggedUser==null}">
            <p class="fw-bold">Za nastavak kupovine potrebno se prijaviti/registrirati.</p>
        </c:if>
        <c:if test="${loggedUser!=null}">
            <form action="KupiServlet" method="post">
                <input type="radio" name="nacin" value="1" checked="checked"> Online Plaćanje <br/>
                <input type="radio" name="nacin" value="2"> Gotovina - pouzeće <br/>
                <input class="btn btn-success" type="submit" value="Nastavi s plaćanjem">
            </form>
        </c:if>
            
            
        <h2>Ukupna vrijednost košarice je <fmt:formatNumber value="${ukupno}" minFractionDigits="2" maxFractionDigits="2" /> Kn</h2>
        
        
        
        <!-- ============= FOOTER// ============== -->        
        <div class="mt-auto">
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
        </div>
        
    </body>
</html>
