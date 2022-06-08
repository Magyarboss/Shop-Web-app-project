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
        
        
        
        
        <section class="py-3 mb-4 border-bottom">
            <div class="d-flex align-content-center">
                <div class="me-auto ms-5 p-2"><h2 class="me-auto mb-3 mb-lg-0 text-dark text-decoration-none"> 
                    <c:if test="${idkat==-1}"> &#62; Svi proizvodi </c:if>
                    <c:if test="${idkat!=-1 && idpotkat!=null && idpotkat!=-1}"> &#62; ${kategorije.get(idkat-1).naziv} &#62; ${potkategorije.get(idpotkat-1).naziv} </c:if>
                    <c:if test="${idkat!=-1 && idkat!=0 && (idpotkat==null || idpotkat==-1) }"> &#62; ${kategorije.get(idkat-1).naziv} </c:if>
                    </h2>
                </div>
                
                <div class="p-2 me-3">
                    <a class="nav-link dropdown-toggle text-dark" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">Sortiraj po:</a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown01">
                        <li><a class="dropdown-item" href="IndexServlet?idkat=${idkat}&idpotkat=${idpotkat}" <c:if test="${orderBy==-1}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>>Nazivu: A do Z</a></li>
                        <li><a class="dropdown-item" href="IndexServlet?idkat=${idkat}&idpotkat=${idpotkat}&orderBy=1" <c:if test="${orderBy==1}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>>Nazivu: Z do A</a></li>
                        <li><a class="dropdown-item" href="IndexServlet?idkat=${idkat}&idpotkat=${idpotkat}&orderBy=2" <c:if test="${orderBy==2}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>>Cijena: manja prema većoj</a></li>
                        <li><a class="dropdown-item" href="IndexServlet?idkat=${idkat}&idpotkat=${idpotkat}&orderBy=3" <c:if test="${orderBy==3}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>>Cijena: veća prema manjoj</a></li>
                        
                    </ul>
                </div>
                                                                   
            </div>
        </section>    
                
        <main>    
            <div class="container-fluid">
                <div class="row" >
                    <div class="col-3 col-xl-2"> 
<!-- ============= COMPONENT ============== -->
                        <nav class="sidebar card py-2 mb-4">
                            <ul class="nav flex-column">
                                <li class="nav-item ">
                                    <a class="nav-link" href="IndexServlet" <c:if test="${idkat==-1}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if> > Svi  proizvodi </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet?idkat=${kategorije.get(0).id}" <c:if test="${idkat==1}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>> Monitori </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet?idkat=${kategorije.get(1).id}" <c:if test="${idkat==2}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if> > Periferija <b class="float-end">&#10095;</b> </a>
                                    <ul class="submenu dropdown-menu">                     
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(1).id}&idpotkat=${potkategorije.get(0).potkategorijaID}">Tipkovnice </a></li>
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(1).id}&idpotkat=${potkategorije.get(1).potkategorijaID}">Miševi </a></li>
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(1).id}&idpotkat=${potkategorije.get(2).potkategorijaID}">Podloge za miš </a></li>
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(1).id}&idpotkat=${potkategorije.get(3).potkategorijaID}">Zvučnici </a></li>
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(1).id}&idpotkat=${potkategorije.get(4).potkategorijaID}">Slušalice </a></li>
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(1).id}&idpotkat=${potkategorije.get(5).potkategorijaID}">Mikrofoni </a></li>
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(1).id}&idpotkat=${potkategorije.get(6).potkategorijaID}">Web kamere </a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet?idkat=${kategorije.get(2).id}" <c:if test="${idkat==3}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>> Kućišta </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet?idkat=${kategorije.get(3).id}" <c:if test="${idkat==4}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>> Grafičke kartice </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet?idkat=${kategorije.get(4).id}" <c:if test="${idkat==5}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>> Procesori </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet?idkat=${kategorije.get(5).id}" <c:if test="${idkat==6}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>> Matične ploče </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet?idkat=${kategorije.get(6).id}" <c:if test="${idkat==7}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>> Napajanja </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet?idkat=${kategorije.get(7).id}" <c:if test="${idkat==8}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>> Memorija <b class="float-end">&#10095;</b> </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(7).id}&idpotkat=${potkategorije.get(7).potkategorijaID}">Tvrdi diskovi (HDD) </a></li>
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(7).id}&idpotkat=${potkategorije.get(8).potkategorijaID}">Solid state diskovi (SSD) </a></li>
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(7).id}&idpotkat=${potkategorije.get(9).potkategorijaID}">Radna memorija (RAM) </a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet?idkat=${kategorije.get(8).id}" <c:if test="${idkat==9}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>> Hlađenje <b class="float-end">&#10095;</b> </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(8).id}&idpotkat=${potkategorije.get(10).potkategorijaID}">Ventilatori </a></li>
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(8).id}&idpotkat=${potkategorije.get(11).potkategorijaID}">Hladnjaci </a></li>
                                        <li><a class="nav-link" href="IndexServlet?idkat=${kategorije.get(8).id}&idpotkat=${potkategorije.get(12).potkategorijaID}">Vodeno hlađenje </a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet?idkat=0" <c:if test="${idkat==0}"> style="color:var(--bs-primary);background: var(--bs-light);"</c:if>> Ostalo </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
<!-- ============= COMPONENT END// ============== -->	


                    <div class="col-9">
                        <div class="row justify-content-center">
                            
                                <c:forEach var="p" items="${proizvodi}">
                                    <div class="col-auto">
                                
                                   
                                        <div class="card m-3" style="width: 20rem;height: 35rem">
                                            
                                            <c:if test="${p.slika==null}">
                                                <img src="./slike/slikeproizvoda/no_image.png" class="card-img-top"  height="300" alt="...">
                                            </c:if>
                                            <c:if test="${p.slika!=null}">
                                                <img src="./slike/slikeproizvoda/${p.slika}" class="card-img-top"  height="300" alt="...">
                                            </c:if>
                                            
                                            <div class="card-body">
                                                <h5 class="card-title">${p.naziv}</h5>
                                                <p class="card-text">${p.opis}</p>
                                                <h5 class="card-title"><fmt:formatNumber value="${p.cijena}" minFractionDigits="2" maxFractionDigits="2" />Kn</h5>
                                                <form action="DodajUKosaricuServlet" method="post">
                                                    <input type="hidden" name="id" value="${p.IDProizvod}" />
                                                    <input type="hidden" name="naziv" value="${p.naziv}" />
                                                    <input type="hidden" name="opis" value="${p.opis}" />
                                                    <input type="hidden" name="cijena" value="${p.cijena}" />
                                                    <input type="hidden" name="kolicinaNaSkladistu" value="${p.kolicinaNaSkladistu}" />
                                                    <div class="d-flex align-content-center">
                                                    <input class="me-3" type="number" value="1" 
                                                           min="1" max="${p.kolicinaNaSkladistu}" step="1"
                                                           name="kolicina" />
                                                    <input type="submit" class="btn btn-primary" value="Dodaj u košaricu"/>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                   
                                           
                                    </div>
                                </c:forEach>
                              
                                
                    </div>
                </div>
            </div>
        </main>                        
<!-- ============= COMPONENT END// ============== -->	  


        <p class="ms-5">Ukupna vrijednost sve robe je <fmt:formatNumber value="${ukupnaVrijednost}" minFractionDigits="2" maxFractionDigits="2" /> Kn</p>
        
       
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        
       
<!-- ============= FOOTER ============== --> 
        
        <div class="container mt-auto">
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
<!-- ============= FOOTER END ============== -->
        
    </body>
</html>
