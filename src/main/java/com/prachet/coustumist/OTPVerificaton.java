package com.prachet.coustumist;

import com.prachet.utilities.UserAddress;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "OTP",urlPatterns = "/otpverification")
public class OTPVerificaton extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession(false);
        String verify= "false";
        verify=(String) session.getAttribute((String) session.getAttribute("email"));
        if(verify!=null) {
            if (verify.equals("false")) {
                out.println("<html>\n" +
                        "<head>\n" +
                        "    <meta charset=\"utf-8\">\n" +
                        "    <title>Login</title>\n" +
                        "    <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n" +
                        "    <meta content=\"Free HTML Templates\" name=\"keywords\">\n" +
                        "    <meta content=\"Free HTML Templates\" name=\"description\">\n" +
                        "\n" +
                        "    <link href=\"img/favicon.ico\" rel=\"icon\">\n" +
                        "\n" +
                        "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\n" +
                        "    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap\"\n" +
                        "          rel=\"stylesheet\">\n" +
                        "\n" +
                        "    <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css\" rel=\"stylesheet\">\n" +
                        "\n" +
                        "    <link href=\"lib/owlcarousel/assets/owl.carousel.min.css\" rel=\"stylesheet\">\n" +
                        "\n" +
                        "    <link href=\"css/style.css\" rel=\"stylesheet\">\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<div class=\"container-fluid \">\n" +
                        "    <div class=\"row align-items-center py-3 px-xl-5\">\n" +
                        "        <div class=\"col-lg-4 d-none d-lg-block\">\n" +
                        "            <a href=\"\" class=\"text-decoration-none\">\n" +
                        "                <h1 class=\"m-0 display-5 font-weight-semi-bold\"><span\n" +
                        "                        class=\"text-primary font-weight-bold border px-3 mr-1\">CT</span>Customist</h1>\n" +
                        "            </a>\n" +
                        "        </div>\n" +
                        "        <div class=\"col-lg-6 col-6 text-left\">\n" +
                        "            <form action=\"search.jsp\" method=\"get\">\n" +
                        "                <div class=\"input-group\">\n" +
                        "                    <input type=\"text\" name=\"searchtext\" class=\"form-control\" placeholder=\"Search for products\">\n" +
                        "                    <div class=\"input-group-append\">\n" +
                        "                        <button type=\"submit\" style=\"border: none;\">\n" +
                        "                                <span class=\"input-group-text bg-transparent text-primary\">\n" +
                        "                                <i class=\"fa fa-search\"></i>\n" +
                        "                                </span>\n" +
                        "                        </button>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </form>\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "</div>\n" +
                        "<div class=\"container-fluid mb-5\">\n" +
                        "    <div class=\"row align-items-center py-3 px-xl-5\">\n" +
                        "        <nav class=\"col-lg-12 navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-xl-0\">\n" +
                        "            <a href=\"\" class=\"text-decoration-none d-block d-lg-none\">\n" +
                        "                <h1 class=\"m-0 display-5 font-weight-semi-bold\"><span\n" +
                        "                        class=\"text-primary font-weight-bold border px-3 mr-1\">CT</span>Customist</h1>\n" +
                        "            </a>\n" +
                        "            <button type=\"button\" class=\"navbar-toggler my-2 \" data-toggle=\"collapse\" data-target=\"#navbarCollapse\">\n" +
                        "                <span class=\"navbar-toggler-icon\"></span>\n" +
                        "            </button>\n" +
                        "            <div class=\"collapse navbar-collapse justify-content-between\" id=\"navbarCollapse\">\n" +
                        "                <div class=\"navbar-nav mr-auto\">\n" +
                        "                    <a href=\"index.jsp\" class=\"nav-item nav-link \">Home</a>\n" +
                        "                    <a href=\"shop.jsp\" class=\"nav-item nav-link\">Shop</a>\n" +
                        "                    <div class=\"nav-item dropdown\">\n" +
                        "                        <a href=\"#\" class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\">Pages</a>\n" +
                        "                        <div class=\"dropdown-menu rounded-0 m-0\">\n" +
                        "                            <a href=\"cart.jsp\" class=\"dropdown-item\">Shopping Cart</a>\n" +
                        "                            <a href=\"checkout.jsp\" class=\"dropdown-item\">Checkout</a>\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                    <a href=\"contact.jsp\" class=\"nav-item nav-link\">Contact</a>\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "        </nav>\n" +
                        "    </div>\n" +
                        "</div>\n" +
                        "<div class=\"container-fluid pt-1\">\n" +
                        "    <div class=\"row px-xl-5\">\n" +
                        "        <div class=\"col-lg-6 offset-lg-3\">\n" +
                        "            <form action=\"otpvalidation\" class=\"d-flex flex-column text-center mb-4 mt-4 p-2\" method=\"post\" style=\"border-radius:25px;box-shadow: 1px 1px 10px 5px #e8f0fe;z-index: 1;flex-wrap: wrap;\">\n" +
                        "                <div class=\"d-flex flex-row text-center\" style=\"justify-content: space-around;flex-wrap: wrap;align-items: center;\">\n" +
                        "                    <h5 class=\"font-weight-semi-bold mb-4 \">Email Verification</h5>\n" +
                        "                </div>\n" +
                        "                <div class=\"d-flex flex-row\" style=\"justify-content: space-between;flex-wrap: wrap;align-items: center;\">\n" +
                        "                    <label for=\"otp\" style=\"color:#666666\">OTP</label>\n" +
                        "                    <input class=\"form-control\" type=\"text\" id=\"otp\" style=\"width: 80%;\" name=\"otp\" placeholder=\"Enter OTP\" required=\"\" >\n" +
                        "                </div>\n" +
                        "                <div class=\"d-flex flex-column\" style=\"align-items: center;\">\n" +
                        "                    <button class=\"btn  btn-primary font-weight-bold my-3 py-1\" type=\"submit\" style=\"width: 35%;\">Verify</button>\n" +
                        "                </div>\n" +
                        "            </form>\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "</div>\n" +
                        "<script src=\"https://code.jquery.com/jquery-3.4.1.min.js\"></script>\n" +
                        "<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js\"></script>\n" +
                        "<script src=\"lib/easing/easing.min.js\"></script>\n" +
                        "<script src=\"lib/owlcarousel/owl.carousel.min.js\"></script>\n" +
                        "</body>\n" +
                        "</html>\n");
            } else {
                UserAddress userAddress= (UserAddress) session.getAttribute("address1");
                session.removeAttribute("address1");
                userAddress.setEmail((String) session.getAttribute("email"));
                session.setAttribute("address",userAddress);
                response.sendRedirect("checkout.jsp");
            }
        }
        else {
            out.println("<html>\n" +
                    "<head>\n" +
                    "    <meta charset=\"utf-8\">\n" +
                    "    <title>Login</title>\n" +
                    "    <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n" +
                    "    <meta content=\"Free HTML Templates\" name=\"keywords\">\n" +
                    "    <meta content=\"Free HTML Templates\" name=\"description\">\n" +
                    "\n" +
                    "    <link href=\"img/favicon.ico\" rel=\"icon\">\n" +
                    "\n" +
                    "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\n" +
                    "    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap\"\n" +
                    "          rel=\"stylesheet\">\n" +
                    "\n" +
                    "    <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css\" rel=\"stylesheet\">\n" +
                    "\n" +
                    "    <link href=\"lib/owlcarousel/assets/owl.carousel.min.css\" rel=\"stylesheet\">\n" +
                    "\n" +
                    "    <link href=\"css/style.css\" rel=\"stylesheet\">\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "<div class=\"container-fluid \">\n" +
                    "    <div class=\"row align-items-center py-3 px-xl-5\">\n" +
                    "        <div class=\"col-lg-4 d-none d-lg-block\">\n" +
                    "            <a href=\"\" class=\"text-decoration-none\">\n" +
                    "                <h1 class=\"m-0 display-5 font-weight-semi-bold\"><span\n" +
                    "                        class=\"text-primary font-weight-bold border px-3 mr-1\">CT</span>Customist</h1>\n" +
                    "            </a>\n" +
                    "        </div>\n" +
                    "        <div class=\"col-lg-6 col-6 text-left\">\n" +
                    "            <form action=\"search.jsp\" method=\"get\">\n" +
                    "                <div class=\"input-group\">\n" +
                    "                    <input type=\"text\" name=\"searchtext\" class=\"form-control\" placeholder=\"Search for products\">\n" +
                    "                    <div class=\"input-group-append\">\n" +
                    "                        <button type=\"submit\" style=\"border: none;\">\n" +
                    "                                <span class=\"input-group-text bg-transparent text-primary\">\n" +
                    "                                <i class=\"fa fa-search\"></i>\n" +
                    "                                </span>\n" +
                    "                        </button>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "            </form>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "</div>\n" +
                    "<div class=\"container-fluid mb-5\">\n" +
                    "    <div class=\"row align-items-center py-3 px-xl-5\">\n" +
                    "        <nav class=\"col-lg-12 navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-xl-0\">\n" +
                    "            <a href=\"\" class=\"text-decoration-none d-block d-lg-none\">\n" +
                    "                <h1 class=\"m-0 display-5 font-weight-semi-bold\"><span\n" +
                    "                        class=\"text-primary font-weight-bold border px-3 mr-1\">CT</span>Customist</h1>\n" +
                    "            </a>\n" +
                    "            <button type=\"button\" class=\"navbar-toggler my-2 \" data-toggle=\"collapse\" data-target=\"#navbarCollapse\">\n" +
                    "                <span class=\"navbar-toggler-icon\"></span>\n" +
                    "            </button>\n" +
                    "            <div class=\"collapse navbar-collapse justify-content-between\" id=\"navbarCollapse\">\n" +
                    "                <div class=\"navbar-nav mr-auto\">\n" +
                    "                    <a href=\"index.jsp\" class=\"nav-item nav-link \">Home</a>\n" +
                    "                    <a href=\"shop.jsp\" class=\"nav-item nav-link\">Shop</a>\n" +
                    "                    <div class=\"nav-item dropdown\">\n" +
                    "                        <a href=\"#\" class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\">Pages</a>\n" +
                    "                        <div class=\"dropdown-menu rounded-0 m-0\">\n" +
                    "                            <a href=\"cart.jsp\" class=\"dropdown-item\">Shopping Cart</a>\n" +
                    "                            <a href=\"checkout.jsp\" class=\"dropdown-item\">Checkout</a>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                    <a href=\"contact.jsp\" class=\"nav-item nav-link\">Contact</a>\n" +
                    "                </div>\n" +
                    "            </div>\n" +
                    "        </nav>\n" +
                    "    </div>\n" +
                    "</div>\n" +
                    "<div class=\"container-fluid pt-1\">\n" +
                    "    <div class=\"row px-xl-5\">\n" +
                    "        <div class=\"col-lg-6 offset-lg-3\">\n" +
                    "            <form action=\"otpvalidation\" class=\"d-flex flex-column text-center mb-4 mt-4 p-2\" method=\"post\" style=\"border-radius:25px;box-shadow: 1px 1px 10px 5px #e8f0fe;z-index: 1;flex-wrap: wrap;\">\n" +
                    "                <div class=\"d-flex flex-row text-center\" style=\"justify-content: space-around;flex-wrap: wrap;align-items: center;\">\n" +
                    "                    <h5 class=\"font-weight-semi-bold mb-4 \">Email Verification</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"d-flex flex-row\" style=\"justify-content: space-between;flex-wrap: wrap;align-items: center;\">\n" +
                    "                    <label for=\"otp\" style=\"color:#666666\">OTP</label>\n" +
                    "                    <input class=\"form-control\" type=\"text\" id=\"otp\" style=\"width: 80%;\" name=\"otp\" placeholder=\"Enter OTP\" required=\"\" >\n" +
                    "                </div>\n" +
                    "                <div class=\"d-flex flex-column\" style=\"align-items: center;\">\n" +
                    "                    <button class=\"btn  btn-primary font-weight-bold my-3 py-1\" type=\"submit\" style=\"width: 35%;\">Verify</button>\n" +
                    "                </div>\n" +
                    "            </form>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "</div>\n" +
                    "<script src=\"https://code.jquery.com/jquery-3.4.1.min.js\"></script>\n" +
                    "<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js\"></script>\n" +
                    "<script src=\"lib/easing/easing.min.js\"></script>\n" +
                    "<script src=\"lib/owlcarousel/owl.carousel.min.js\"></script>\n" +
                    "</body>\n" +
                    "</html>\n");
        }
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {

    }
}
