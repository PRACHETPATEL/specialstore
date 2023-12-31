<%@ page import="java.util.Map" %>
<%@ page import="com.prachet.utilities.Cart" %>
<%@ page import="java.util.Set" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PRACHET
  Date: 8/11/2023
  Time: 8:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Cart</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

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
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">CT</span>Customist</h1>
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
            Integer itemcount=null;
            itemcount=(Integer) session.getAttribute("cartitemnumber");
            if(itemcount!=null){
                request.setAttribute("count",itemcount);
            }else request.setAttribute("count",0);
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
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">CT</span>Customist</h1>
            </a>
            <button type="button" class="navbar-toggler my-2 " data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav mr-auto">
                    <a href="index.jsp" class="nav-item nav-link ">Home</a>
                    <a href="shop.jsp" class="nav-item nav-link">Shop</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle active" data-toggle="dropdown">Pages</a>
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


<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shopping Cart</p>
        </div>
    </div>
</div>
<!-- Page Header End -->
<%
    Map<Integer, Cart> cartitems=(Map<Integer,Cart>)session.getAttribute("cart");
    Set<Map.Entry<Integer, Cart>> items=null;
    if(cartitems!=null) {
        items= cartitems.entrySet();
    }
    request.setAttribute("items",items);
%>

<!-- Cart Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5" style="height:50vmax;overflow-y: auto;">
            <table class="table table-bordered text-center mb-0">
                <thead class="bg-secondary text-dark">
                <tr>
                    <th>Products</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Remove</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:set var="subtotal" value="${0}"></c:set>
                <c:if test="${items!=null}">

                    <c:forEach var="item" items="${items}" >
                <tr>
                    <td class="align-middle"><img src="img/${item.value.img}" alt="" style="width: 50px;"> ${item.value.name}(${item.value.size}, ${item.value.color})</td>
                    <td class="align-middle">&#8377; ${item.value.price}</td>
                    <td class="align-middle">
                        <div class="input-group quantity mx-auto" style="width: 100px;">
                            <div class="form-control form-control-sm bg-secondary text-center">${item.value.quantity}</div>
                        </div>
                    </td>
                    <c:set var="subtotal" value="${subtotal+(item.value.price*item.value.quantity)}"></c:set>
                    <td class="align-middle">&#8377; ${item.value.price*item.value.quantity}</td>
                    <td class="align-middle"><a href="/Coustumist_war_exploded/cart?remove=${item.value.id}" class="btn btn-sm btn-primary"><i class="fa fa-times"></i></a></td>
                </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
        <div class="col-lg-4" style="height:50vmax;">
            <form class="mb-5" action="">
                <div class="input-group">
                    <input type="text" class="form-control p-4" placeholder="Coupon Code">
                    <div class="input-group-append">
                        <button class="btn btn-primary">Apply Coupon</button>
                    </div>
                </div>
            </form>
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">Subtotal</h6>
                        <h6 class="font-weight-medium">&#8377; ${subtotal}</h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Shipping</h6>
                        <h6 class="font-weight-medium">&#8377; 0</h6>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Total</h5>
                        <h5 class="font-weight-bold">&#8377; ${subtotal}</h5>
                    </div>
                    <form action="checkout.jsp" method="post">
                        <input type="hidden" value="${subtotal}" name="subtotal">
                        <button class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart End -->

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