<%@ page import="com.prachet.helper.MongoDB" %>
<%@ page import="com.prachet.utilities.StringRessource" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.prachet.utilities.Product" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Customist</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="body">
<!-- Topbar Start -->

<div class="container-fluid ">
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-4 d-none d-lg-block">
            <a href="" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span
                        class="text-primary font-weight-bold border px-3 mr-1">CT</span>Customist</h1>
            </a>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <form action="search.jsp" method="get">
                <div class="input-group">
                    <input type="text" name="searchtext" class="form-control" placeholder="Search for products">
                    <div class="input-group-append">
                            <button type="submit" style="border: none;">
                                <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                                </span>
                            </button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-2 col-6 text-right">
            <a href="cart.jsp" class="btn border">
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge">0</span>
            </a>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid mb-5">
    <div class="row align-items-center py-3 px-xl-5">
        <nav class="col-lg-12 navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-xl-0">
            <a href="" class="text-decoration-none d-block d-lg-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span
                        class="text-primary font-weight-bold border px-3 mr-1">CT</span>Customist</h1>
            </a>
            <button type="button" class="navbar-toggler my-2 " data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav mr-auto">
                    <a href="index.jsp" class="nav-item nav-link active">Home</a>
                    <a href="shop.jsp" class="nav-item nav-link">Shop</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="cart.jsp" class="dropdown-item">Shopping Cart</a>
                            <a href="checkout.jsp" class="dropdown-item">Checkout</a>
                        </div>
                    </div>
                    <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                </div>
                <div class="navbar-nav ml-auto py-0">
                    <a href="" class="nav-item nav-link">Login</a>
                    <a href="" class="nav-item nav-link">Register</a>
                </div>
            </div>
        </nav>
        <div id="header-carousel" class="carousel slide col-lg-12 " data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" style="height: 410px;">
                    <img class="img-fluid" src="img/landing3.jpg" alt="Image" style="background-size: cover;background-position: center;">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 700px;">
                            <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                            <h3 class="display-4 text-white font-weight-semi-bold mb-4">Customizable T-Shirts</h3>
                            <a href="shop.jsp" class="btn btn-light py-2 px-3">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-prev-icon mb-n2"></span>
                </div>
            </a>
            <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-next-icon mb-n2"></span>
                </div>
            </a>
        </div>
    </div>
</div>
</div>
<!-- Navbar End -->


<!-- Featured Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-6 col-md-12 col-sm-24 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-24 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
            </div>
        </div>
    </div>
</div>
<!-- Featured End -->


<%!
    ArrayList<ArrayList<String>> listx = null;
    ArrayList<ArrayList<String>> listdesc = null;
%>
<%
    MongoDB allcol = new MongoDB();
    listx = allcol.getAllCollection(StringRessource.getCollection(0));
    if (listx.size() > 4) {
        listdesc = (ArrayList<ArrayList<String>>) listx.clone();
        Collections.reverse(listdesc);
    }
    MongoDB db = new MongoDB();
    request.setAttribute("Trending_Products", listx);
    request.setAttribute("New_Products", listdesc);
%>
<%
    if(session.getAttribute("productMap")==null) {
        ArrayList<ArrayList<String>> products = db.getAllCollection(StringRessource.getCollection(0));
        Map<Integer, Product> productMap = db.getAllProductsMap(products);
        session.setAttribute("productMap", productMap);
        session.setAttribute("products", products);
    }
%>
<!-- Products Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Trandy Products</span></h2>
    </div>
    <div class="row px-xl-5 pb-3">
        <c:if test="${(Trending_Products.size()-1)<8}">
            <c:forEach var="x" begin="0" end="${Trending_Products.size()-1}">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="img/${Trending_Products.get(x).get(5)}" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">${Trending_Products.get(x).get(2)}</h6>
                            <div class="d-flex justify-content-center">
                                <h6>&#8377; ${Trending_Products.get(x).get(4)}</h6>
                                <h6 class="text-muted ml-2">
                                    <del>&#8377; ${Trending_Products.get(x).get(3)}</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <form action="productdetail.jsp" method="get">
                                <input type="hidden" name="productid" value="${Trending_Products.get(x).get(1)}">
                                <button type="submit" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View
                                    Detail</button>
                            </form>
                            <a href="cart.jsp" class="btn btn-sm text-dark p-0"><i
                                    class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>
<!-- Products End -->
<!-- Products Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Just Arrived</span></h2>
    </div>
    <div class="row px-xl-5 pb-3">
        <c:if test="${New_Products.size()>=4}">
            <c:forEach var="i" begin="0" end="3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="img/${New_Products.get(i).get(5)}" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">${New_Products.get(i).get(2)}</h6>
                            <div class="d-flex justify-content-center">
                                <h6>&#8377; ${New_Products.get(i).get(4)}</h6>
                                <h6 class="text-muted ml-2">
                                    <del>&#8377; ${New_Products.get(i).get(3)}</del>
                                </h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <form action="productdetail.jsp" method="get">
                                <input type="hidden" name="productid" value="${New_Products.get(i).get(1)}">
                                <button type="submit" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View
                                    Detail</button>
                            </form>
                            <a href="cart.jsp" class="btn btn-sm text-dark p-0"><i
                                    class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>
<!-- Products End -->

<%@ include file="footer_normal.jsp"%>

<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>