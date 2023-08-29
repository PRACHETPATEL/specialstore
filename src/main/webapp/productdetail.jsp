<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.prachet.utilities.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.prachet.utilities.StringRessource" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.prachet.helper.MongoDB" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.prachet.utilities.Review" %><%--
  Created by IntelliJ IDEA.
  User: PRACHET
  Date: 8/12/2023
  Time: 6:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page errorPage="error.jsp" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Product Details</title>
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
    <style>
        .rating:not(:checked) > input {
            position: absolute;
            appearance: none;
        }

        .rating:not(:checked) > label {
            float: right;
            cursor: pointer;
            font-size: 30px;
            color: #666;
        }

        .rating:not(:checked) > label:before {
            content: '★';
        }

        .rating > input:checked + label:hover,
        .rating > input:checked + label:hover ~ label,
        .rating > input:checked ~ label:hover,
        .rating > input:checked ~ label:hover ~ label,
        .rating > label:hover ~ input:checked ~ label {
            color: #bd716b;
        }

        .rating:not(:checked) > label:hover,
        .rating:not(:checked) > label:hover ~ label {
            color: #bd726b;
        }

        .rating > input:checked ~ label {
            color: #c17a74;
        }
    </style>
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
        <%
            Integer itemcount = null;
            itemcount = (Integer) session.getAttribute("cartitemnumber");
            if (itemcount != null) {
                request.setAttribute("count", itemcount);
            } else request.setAttribute("count", 0);
        %>
        <div class="col-lg-2 col-6 text-right">
            <a href="cart.jsp" class="btn border">
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge">${count}</span>
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
                <%--                <div class="navbar-nav ml-auto py-0">--%>
                <%--                    <a href="login.jsp" class="nav-item nav-link">Login</a>--%>
                <%--                    <a href="register.jsp" class="nav-item nav-link">Register</a>--%>
                <%--                </div>--%>
            </div>
        </nav>

    </div>
</div>
</div>
<!-- Navbar End -->
<%!
    Product product = null;
    MongoDB db = null;
%>
<%
    String id = request.getParameter("productid");
    db = new MongoDB();
    if (session.getAttribute("productMap") == null) {
        ArrayList<ArrayList<String>> products = db.getAllCollection(StringRessource.getCollection(0));
        Map<Integer, Product> productMap = db.getAllProductsMap(products);
        session.setAttribute("productMap", productMap);
        session.setAttribute("products", products);
    }
    Map<Integer, Product> productMap = (Map<Integer, Product>) session.getAttribute("productMap");
    if (id != null) {
        product = productMap.get(Integer.parseInt(id));
        request.setAttribute("productdetail", product);
    } else {
        request.setAttribute("productdetail", null);
    }
    ArrayList<Review> reviews= null;
    reviews=(ArrayList<Review>) session.getAttribute("review"+id);
    if(reviews==null){
        assert id != null;
        reviews=db.getReview(StringRessource.getCollection(4),id);
        session.setAttribute("review"+id,reviews);
        session.setAttribute("reviewsize"+id,reviews.size());
    }
//    else{
//        String reviewsize= session.getAttribute("reviewsize"+id).toString();
//        if(reviews.size()>Integer.parseInt(reviewsize)) {
//            reviews = db.getReview(StringRessource.getCollection(4), id);
//            session.setAttribute("review" + id, reviews);
//            session.setAttribute("reviewsize" + id, reviews.size());
//        }
//    }
    request.setAttribute("reviews",reviews);
%>
<!-- Shop Detail Start -->
<c:if test="${productdetail!=null}">

    <div class="container-fluid py-5">
        <div class="row px-xl-5">

            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                        <div class="carousel-item active">
                            <img class="w-100 h-100" src="img/${productdetail.image}" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="img/2.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="img/3.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="img/4.jpg" alt="Image">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>
            <c:set var="five" value="5"></c:set>
            <c:set var="four" value="4"></c:set>
            <c:set var="three" value="3"></c:set>
            <c:set var="two" value="2"></c:set>
            <c:set var="one" value="1"></c:set>
            <div class="col-lg-7 pb-5">
                <h3 class="font-weight-semi-bold">${productdetail.name}</h3>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="far fa-star"></small>
                    </div>
                    <small class="pt-1">(${reviews.size()} Reviews)</small>
                </div>
                <h3 class="font-weight-semi-bold mb-4">&#8377; ${productdetail.price}</h3>
                <p class="mb-4">Volup erat ipsum diam elitr rebum et dolor. Est nonumy elitr erat diam stet sit clita
                    ea. Sanc invidunt ipsum et, labore clita lorem magna lorem ut. Erat lorem duo dolor no sea nonumy.
                    Accus labore stet, est lorem sit diam sea et justo, amet at lorem et eirmod ipsum diam et rebum kasd
                    rebum.</p>
                <form action="cart" method="post">
                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>

                        <c:set var="i" value="1"></c:set>
                        <c:forEach var="x" items="${productdetail.size}">
                            <c:choose>
                                <c:when test="${i==1}">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="size-${i}" name="size"
                                               value="${x}" checked>
                                        <label class="custom-control-label" for="size-${i}">${x}</label>
                                        <c:set var="i" value="${i+1}"></c:set>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="size-${i}" name="size"
                                               value="${x}">
                                        <label class="custom-control-label" for="size-${i}">${x}</label>
                                        <c:set var="i" value="${i+1}"></c:set>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <div class="d-flex mb-4">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Colors:</p>
                        <c:set var="i" value="1"></c:set>
                        <c:forEach var="x" items="${productdetail.color}">
                            <c:choose>
                                <c:when test="${i==1}">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="color-${i}" name="color"
                                               value="${x}" checked>
                                        <label class="custom-control-label" for="color-${i}">${x}</label>
                                        <c:set var="i" value="${i+1}"></c:set>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="color-${i}" name="color"
                                               value="${x}">
                                        <label class="custom-control-label" for="color-${i}">${x}</label>
                                        <c:set var="i" value="${i+1}"></c:set>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 130px;">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-primary" onclick="quantityminus()">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <div class="form-control bg-secondary text-center" id="display">1</div>

                            <div class="input-group-btn">
                                <button type="button" class="btn btn-primary" onclick="quantityplus()">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>

                        <input type="hidden" value="1" name="quantity" id="cartitems">
                        <input type="hidden" value="${productdetail.price}" name="price">
                        <input type="hidden" value="${productdetail.name}" name="name">
                        <input type="hidden" value="${productdetail.image}" name="image">
                        <input type="hidden" value="${productdetail.id}" name="id">
                        <button type="submit" class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add
                            To Cart
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (${reviews.size()})</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Product Description</h4>
                        <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam
                            invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod
                            consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam.
                            Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos
                            dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod
                            nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt
                            tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                        <p>Dolore magna est eirmod sanctus dolor, amet diam et eirmod et ipsum. Amet dolore tempor
                            consetetur sed lorem dolor sit lorem tempor. Gubergren amet amet labore sadipscing clita
                            clita diam clita. Sea amet et sed ipsum lorem elitr et, amet et labore voluptua sit rebum.
                            Ea erat sed et diam takimata sed justo. Magna takimata justo et amet magna et.</p>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-2">
                        <h4 class="mb-3">Additional Information</h4>
                        <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam
                            invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod
                            consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam.
                            Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos
                            dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod
                            nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt
                            tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-3">
                        <div class="row">
                            <div class="col-md-6" style="height: 60vh;overflow-y:auto;">
                            <h4 class="mb-4">${reviews.size()} review for "${productdetail.name}"</h4>
                            <c:forEach var="review" items="${reviews}">
                                <div class="media mb-4">
                                    <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1"
                                         style="width: 45px;">
                                    <div class="media-body">
                                        <h6>${review.name}<small> - <i>${review.date}</i></small></h6>
                                        <c:choose>
                                            <c:when test="${review.rating==five}">
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="fas fa-star text-primary"></small>
                                            </c:when>
                                            <c:when test="${review.rating==four}">
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="far fa-star text-primary"></small>
                                            </c:when>
                                            <c:when test="${review.rating==three}">
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="far fa-star text-primary"></small>
                                                <small class="far fa-star text-primary"></small>
                                            </c:when>
                                            <c:when test="${review.rating==two}">
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="far fa-star text-primary"></small>
                                                <small class="far fa-star text-primary"></small>
                                                <small class="far fa-star text-primary"></small>
                                            </c:when>
                                            <c:when test="${review.rating==one}">
                                                <small class="fas fa-star text-primary"></small>
                                                <small class="far fa-star text-primary"></small>
                                                <small class="far fa-star text-primary"></small>
                                                <small class="far fa-star text-primary"></small>
                                                <small class="far fa-star text-primary"></small>
                                            </c:when>
                                        </c:choose>
                                        <p>${review.review}</p>
                                    </div>
                                </div>
                            </c:forEach>
                            </div>
                            <div class="col-md-6" style="height: 60vh;overflow-y:auto;">
                                <h4 class="mb-4">Leave a review</h4>
                                <small>Your email address will not be published. Required fields are marked *</small>
                                <form action="review" method="post">
                                    <div class="d-flex my-3" style="align-items: center;">
                                        <p class="mb-0 mr-2">Your Rating * :</p>
                                        <div class="rating">
                                            <input value="5" name="rating" id="star5" type="radio">
                                            <label title="text" for="star5"></label>
                                            <input value="4" name="rating" id="star4" type="radio">
                                            <label title="text" for="star4"></label>
                                            <input value="3" name="rating" id="star3" type="radio" checked="">
                                            <label title="text" for="star3"></label>
                                            <input value="2" name="rating" id="star2" type="radio">
                                            <label title="text" for="star2"></label>
                                            <input value="1" name="rating" id="star1" type="radio">
                                            <label title="text" for="star1"></label>
                                        </div>
                                    </div>
                                    <input type="hidden" value="${productdetail.id}" name="id">
                                    <div class="form-group">
                                        <label for="message">Your Review *</label>
                                        <textarea id="message" name="message" cols="30" rows="5" class="form-control"
                                                  required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Your Name *</label>
                                        <input type="text" name="name" class="form-control" id="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Your Email *</label>
                                        <input type="email" name="email" class="form-control" id="email" required>
                                    </div>
                                    <div class="form-group mb-0">
                                        <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->
</c:if>
<%
    Cookie[] cookie = request.getCookies();
    String gender = "";
    String material = "";
    if (product != null) {
        gender = product.getGender();
        material = product.getMaterial();
    }
    ArrayList<ArrayList<String>> products = null;
    products = (ArrayList<ArrayList<String>>) db.filterByMaterialAndGender(StringRessource.getCollection(0), material, gender);
    if (id != null) {
        for (int i = 0; i < products.size(); i++) {
            if (Objects.equals(products.get(i).get(1), id)) {
                products.remove(products.get(i));
            }
        }
    }
    request.setAttribute("productdetail", products);
%>
<!-- Products Start -->
<div class="container-fluid py-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <c:if test="${productdetail!=null && productdetail.size()!=0}">
                    <c:forEach var="z" begin="0" end="${productdetail.size()-1}">
                        <div class="card product-item border-0">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="img/${productdetail.get(z).get(5)}" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${productdetail.get(z).get(2)}</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>&#8377; ${productdetail.get(z).get(4)}</h6>
                                    <h6 class="text-muted ml-2">
                                        <del>&#8377; ${productdetail.get(z).get(3)}</del>
                                    </h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <form action="productdetail.jsp" method="get">
                                    <input type="hidden" name="productid" value="${productdetail.get(z).get(1)}">
                                    <button type="submit" class="btn btn-sm text-dark p-0"><i
                                            class="fas fa-eye text-primary mr-1"></i>View
                                        Detail
                                    </button>
                                </form>
                                <a href="cart.jsp" class="btn btn-sm text-dark p-0"><i
                                        class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!-- Products End -->
<%@ include file="footer_normal.jsp" %>


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->

<!-- Template Javascript -->
<script src="js/main.js"></script>
<script>
    let data = 1;
    document.getElementById("display").innerHTML = data;
    document.getElementById("cartitems").value = data;

    function quantityplus() {
        if (data < 10) {
            data = data + 1;
            document.getElementById("display").innerHTML = data;
            document.getElementById("cartitems").value = data;
        }
    }

    function quantityminus() {
        if (data > 1) {
            data = data - 1;
            document.getElementById("display").innerHTML = data;
            document.getElementById("cartitems").value = data;
        }
    }
</script>
</body>

</html>