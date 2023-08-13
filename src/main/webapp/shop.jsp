<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.prachet.helper.MongoDB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.prachet.helper.StringRessource" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: PRACHET
  Date: 8/12/2023
  Time: 7:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Shop</title>
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

<body>
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
                        <button type="submit" style="border: none">
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
                    <a href="index.jsp" class="nav-item nav-link ">Home</a>
                    <a href="shop.jsp" class="nav-item nav-link active">Shop</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle " data-toggle="dropdown">Pages</a>
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
    </div>
</div>
</div>
<!-- Navbar End -->


<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shop</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->

        <!-- Shop Sidebar End -->
        <!-- Shop Product Start -->
        <div class="col-lg-12 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">

                        <button id="filterbtn" class="btn border p-0" onclick="filterclick()">
                                <span class="input-group-text bg-transparent text-primary">
                                    <span style="color:#666;">Filter By </span> <i class="fa fa-filter"></i>
                                </span>
                        </button>
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId"
                                    data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                Sort by
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                <a class="dropdown-item" href="#">Latest</a>
                                <a class="dropdown-item" href="#">Popularity</a>
                                <a class="dropdown-item" href="#">Best Rating</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 " style="display: none;" id="filter">
                    <form action="filter" method="GET" id="filterdata">
                        <div class="border-bottom mb-4 pb-4">
                            <h5 class="font-weight-semi-bold mb-4">Filter by Material</h5>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" checked id="materialall"
                                       name="check" value="allmaterial">
                                <label class="custom-control-label" for="materialall">All Materials</label>
                                <span class="badge border font-weight-normal"></span>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="material1" value="polyester" name="check">
                                <label class="custom-control-label" for="material1">Polyester</label>
                                <span class="badge border font-weight-normal"></span>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="material2" value="cotton" name="check">
                                <label class="custom-control-label" for="material2">Cotton</label>
                                <span class="badge border font-weight-normal"></span>
                            </div>
                            <div class="container text-center"><button type="submit" class="btn border mt-2 mb-2 p-0" ><span style="width: 5em;
    justify-content: space-around;font-weight: 500" class="p-0 text-center input-group-text bg-transparent text-primary">Filter</span></button></div>
                        </div>
                    </form>
                </div>
                <%
                    MongoDB db = new MongoDB();
                    ArrayList<ArrayList<String>> products = db.getAllCollection(StringRessource.getCollection(0));
                    request.setAttribute("products", products);
                    ArrayList<ArrayList<String>> filteredproduct=(ArrayList<ArrayList<String>>) request.getAttribute("product");
                    request.setAttribute("product", filteredproduct);
                %>
                <c:choose>
                    <c:when test="${product==null}">
                        <c:forEach var="item" items="${products}">
                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                <div class="card product-item border-0 mb-4">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                        <img class="img-fluid w-100" src="img/${item.get(5)}" alt="">
                                    </div>
                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                        <h6 class="text-truncate mb-3">${item.get(2)}</h6>
                                        <div class="d-flex justify-content-center">
                                            <h6>&#8377; ${item.get(4)}</h6>
                                            <h6 class="text-muted ml-2">
                                                <del>&#8377; ${item.get(3)}</del>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between bg-light border">
                                        <form action="productdetail.jsp" method="get">
                                            <input type="hidden" name="productid" value="${item.get(1)}">
                                            <button type="submit" class="btn btn-sm text-dark p-0"><i
                                                    class="fas fa-eye text-primary mr-1"></i>View
                                                Detail
                                            </button>
                                        </form>
                                        <a href="cart.jsp" class="btn btn-sm text-dark p-0"><i
                                                class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="item" items="${product}">
                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                <div class="card product-item border-0 mb-4">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                        <img class="img-fluid w-100" src="img/${item.get(5)}" alt="">
                                    </div>
                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                        <h6 class="text-truncate mb-3">${item.get(2)}</h6>
                                        <div class="d-flex justify-content-center">
                                            <h6>&#8377; ${item.get(4)}</h6>
                                            <h6 class="text-muted ml-2">
                                                <del>&#8377; ${item.get(3)}</del>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between bg-light border">
                                        <form action="productdetail.jsp" method="get">
                                            <input type="hidden" name="productid" value="${item.get(1)}">
                                            <button type="submit" class="btn btn-sm text-dark p-0"><i
                                                    class="fas fa-eye text-primary mr-1"></i>View
                                                Detail
                                            </button>
                                        </form>
                                        <a href="cart.jsp" class="btn btn-sm text-dark p-0"><i
                                                class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->


<!-- Footer Start -->
<div class="container-fluid bg-secondary text-dark mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-6 col-md-12 mb-5 pr-3 pr-xl-5">
            <a href="" class="text-decoration-none">
                <h1 class="mb-4 display-5 font-weight-semi-bold"><span
                        class="text-primary font-weight-bold border border-white px-3 mr-1">CT</span>Customist</h1>
            </a>
            <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore
                amet erat.</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
        </div>
        <div class="col-lg-6 col-md-12">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-dark mb-2" href="index.jsp"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-dark mb-2" href="shop.jsp"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>

                        <a class="text-dark mb-2" href="cart.jsp"><i class="fa fa-angle-right mr-2"></i>Shopping
                            Cart</a>
                        <a class="text-dark mb-2" href="checkout.jsp"><i
                                class="fa fa-angle-right mr-2"></i>Checkout</a>
                        <a class="text-dark" href="contact.jsp"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row border-top border-light mx-xl-5 py-4">
        <div class="col-lg-12 col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-dark">
                &copy; <a class="text-dark font-weight-semi-bold" href="#">Customist</a>. All Rights Reserved. Designed
                by
                <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a>

                Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                Edited By <a href="https://themewagon.com" target="_blank">Prachet</a>
            </p>
        </div>
    </div>
    <div class="row bg-secondary py-2 px-xl-5 footer">
        <div class="col-lg-6 d-none d-lg-block">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark" href="">FAQs</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Help</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Support</a>
            </div>
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark px-2" href="">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-twitter"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-linkedin-in"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-instagram"></i>
                </a>
                <a class="text-dark pl-2" href="">
                    <i class="fab fa-youtube"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->


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
<script>
    const filter = document.getElementById("filter");
    const filterbutton = document.getElementById("filterbtn")

    function filterclick() {
        if (filter.style.display === "none") {
            filter.style.display = "block";
        } else {
            filter.style.display = "none";
        }
    }
    // $(document).ready(function (){
    //     $('#filterdata').on('submit',function(event){
    //         event.preventDefault();
    //         let form=new FormData(this)
    //         $.ajax({
    //             type:'POST',
    //             data:form,
    //             url:'filter',
    //             success:function (data, textStatus, jqXHR) {
    //                 console.log("Success......");
    //             },
    //             error:function (jqXHR, textStatus, errorThrown){
    //                 console.log("error...");
    //             },
    //             processData: false,
    //             contentType: false
    //         });
    //
    //     });
    // });
</script>
<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>