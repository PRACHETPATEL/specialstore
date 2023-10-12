<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.prachet.utilities.Cart" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.prachet.utilities.User" %>
<%@ page import="com.prachet.utilities.UserAddress" %><%--
  Created by IntelliJ IDEA.
  User: PRACHET
  Date: 8/12/2023
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page errorPage="error.jsp"%>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%--<%--%>
<%--    User user=(User)session.getAttribute("user");--%>
<%--    if(user==null){--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--    }--%>
<%--%>--%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Checkout</title>
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
        <%
            Integer itemcount = null;
            itemcount = (Integer) session.getAttribute("cartitemnumber");
            if (itemcount != null) {
                request.setAttribute("count", itemcount);
            } else request.setAttribute("count", 0);
            Map<Integer, Cart> cartitems = (Map<Integer, Cart>) session.getAttribute("cart");
            Set<Map.Entry<Integer, Cart>> items = null;
            int total=0;
            if (cartitems != null) {
                items = cartitems.entrySet();
                for(Map.Entry<Integer, Cart> item:items){
                    total+=(item.getValue().getPrice()*item.getValue().getQuantity());
                }
            }
            request.setAttribute("items", items);
            session.setAttribute("checkoutitems",items);
            session.setAttribute("checkoutprice",total);
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
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Checkout</p>
        </div>
    </div>
</div>
<!-- Page Header End -->
<%
    UserAddress userAddress = (UserAddress) session.getAttribute("address");
    String verify=(String) session.getAttribute("currentemail");
    request.setAttribute("address", userAddress);
    request.setAttribute("verify",verify);
%>

<!-- Checkout Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <c:choose>
            <c:when test="${address==null}">
                <div class="col-lg-8">
                    <form action="address" method="post">
                        <div class="mb-4">
                            <h4 class="font-weight-semi-bold mb-4">Billing/Shipping Address</h4>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label>First Name</label>
                                    <input class="form-control" name="fname" type="text" placeholder="Your Name"
                                           required>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Last Name</label>
                                    <input class="form-control" name="lname" type="text" placeholder="Sure Name"
                                           required>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>E-mail</label>
                                    <input class="form-control" name="email" type="text" placeholder="example@email.com"
                                           required>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Mobile No</label>
                                    <input class="form-control" name="phone" type="text" maxlength="10"
                                           placeholder="1234567890" required>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Address</label>
                                    <textarea rows="3" name="address" class="form-control" type="text"
                                              placeholder="house/flat No, Street, landmark, town/village."></textarea>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Country</label>
                                    <select name="country" class="custom-select">
                                        <option selected value="India">India</option>
                                            <%--                            <option>Afghanistan</option>--%>
                                            <%--                            <option>Albania</option>--%>
                                            <%--                            <option>Algeria</option>--%>
                                    </select>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>City</label>
                                    <input class="form-control" name="city" type="text" placeholder="Anand" required>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>State</label>
                                    <input class="form-control" name="state" type="text" placeholder="Gujarat" required>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>PIN Code</label>
                                    <input class="form-control" name="pincode" type="text" maxlength="6"
                                           placeholder="400001" required>
                                </div>
                                    <%--                    <div class="col-md-12 form-group">--%>
                                    <%--                        <div class="custom-control custom-checkbox">--%>
                                    <%--                            <input type="checkbox" class="custom-control-input" id="shipto">--%>
                                    <%--                            <label class="custom-control-label" for="shipto" data-toggle="collapse"--%>
                                    <%--                                   data-target="#">Ship to different address</label>--%>
                                    <%--                        </div>--%>
                                    <%--                    </div>--%>
                            </div>
                            <div class="d-flex flex-column" style="align-items: center;">
                                <button class="btn  btn-primary font-weight-bold my-3 py-1" type="submit"
                                        style=" width: 35%;">
                                    Submit
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4">
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                        </div>
                        <div class="card-body">
                            <h5 class="font-weight-medium mb-3">Products</h5>
                            <c:set var="subtotal" value="0"></c:set>
                            <c:if test="${items!=null}">
                                <c:forEach var="item" items="${items}">
                                    <div class="d-flex justify-content-between">
                                        <p>${item.value.name}(${item.value.size}, ${item.value.color})x${item.value.quantity}</p>
                                        <p>&#8377; ${item.value.quantity*item.value.price}</p>
                                        <c:set var="subtotal"
                                               value="${subtotal+(item.value.quantity*item.value.price)}"></c:set>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <hr class="mt-0">
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
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="col-lg-8">
                    <div>
                        <div class="col-md-12 form-group">
                            <div class="custom-control" style="border: 1px solid #666;
    border-color: #EDF1FF !important;
    padding-left: 2%;
    padding-top: 2%;
    border-radius: 10px;">
                                <h5>Shipping Details</h5>
                                    ${address.fname} ${address.lname} <br>
                                    ${address.email}<br>
                                    ${address.phone}<br>
                                    ${address.address}<br>
                                    ${address.pin}-${address.city}<br>
                                    ${address.state}<br>
                                    ${address.country}<br>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="shipto">
                                <label class="custom-control-label" for="shipto" data-toggle="collapse"
                                       data-target="#change-address">Change address</label>
                            </div>
                        </div>
                    </div>
                    <div class="collapse mb-4" id="change-address">
                        <form action="address" method="post">
                            <div class="mb-4">
                                <h4 class="font-weight-semi-bold">Change Address</h4>
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <label>First Name</label>
                                        <input class="form-control" name="fname" type="text" placeholder="Your Name"
                                               required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>Last Name</label>
                                        <input class="form-control" name="lname" type="text" placeholder="Sure Name"
                                               required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>E-mail</label>
                                        <input class="form-control" name="email" type="text"
                                               placeholder="example@email.com" required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>Mobile No</label>
                                        <input class="form-control" name="phone" type="text" maxlength="10"
                                               placeholder="1234567890" required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>Address</label>
                                        <textarea rows="3" name="address" class="form-control" type="text"
                                                  placeholder="house/flat No, Street, landmark, town/village."></textarea>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>Country</label>
                                        <select name="country" class="custom-select">
                                            <option selected value="India">India</option>
                                                <%--                            <option>Afghanistan</option>--%>
                                                <%--                            <option>Albania</option>--%>
                                                <%--                            <option>Algeria</option>--%>
                                        </select>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>City</label>
                                        <input class="form-control" name="city" type="text" placeholder="Anand"
                                               required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>State</label>
                                        <input class="form-control" name="state" type="text" placeholder="Gujarat"
                                               required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>PIN Code</label>
                                        <input class="form-control" name="pincode" type="text" maxlength="6"
                                               placeholder="400001" required>
                                    </div>
                                </div>
                                <div class="d-flex flex-column" style="align-items: center;">
                                    <button class="btn  btn-primary font-weight-bold my-3 py-1" type="submit"
                                            style=" width: 35%;">
                                        Submit
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                        </div>
                        <div class="card-body">
                            <h5 class="font-weight-medium mb-3">Products</h5>
                            <c:set var="subtotal" value="0"></c:set>
                            <c:if test="${items!=null}">
                                <c:forEach var="item" items="${items}">
                                    <div class="d-flex justify-content-between">
                                        <p>${item.value.name}(${item.value.size}, ${item.value.color})x${item.value.quantity}</p>
                                        <p>&#8377; ${item.value.quantity*item.value.price}</p>
                                        <c:set var="subtotal"
                                               value="${subtotal+(item.value.quantity*item.value.price)}"></c:set>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <hr class="mt-0">
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
                        </div>
                    </div>
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Payment</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" name="payment" id="paytm" checked>
                                    <label class="custom-control-label" for="paytm">Online</label>
                                </div>
                            </div>
<%--                            <div class="">--%>
<%--                                <div class="custom-control custom-radio">--%>
<%--                                    <input type="radio" class="custom-control-input" name="payment" id="banktransfer"--%>
<%--                                           readonly>--%>
<%--                                    <label class="custom-control-label" for="banktransfer">Bank Transfer</label>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                        <c:if test="${subtotal!=0}">
                            <c:if test="${verify.equals(\"true\")}">
                        <div class="card-footer border-secondary bg-transparent">
                            <button onclick="paymentStart(${subtotal})" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Place Order
                            </button>
                        </div>
                            </c:if>
                        </c:if>
                    </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Checkout End -->
<%@ include file="footer_normal.jsp" %>

<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="js/payment.js"></script>
<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>