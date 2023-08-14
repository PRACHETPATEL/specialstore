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
