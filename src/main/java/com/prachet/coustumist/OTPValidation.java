package com.prachet.coustumist;

import com.prachet.utilities.UserAddress;

import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "otpvalidation",urlPatterns = "/otpvalidation")
public class OTPValidation extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
        response.setContentType("text/html");
        String otpuser=request.getParameter("otp");
        HttpSession session= request.getSession(false);
        String otp= (String) session.getAttribute("otp");
        System.out.println(otp+" "+otpuser);
        if(otp.equals(otpuser)){
            UserAddress userAddress= (UserAddress) session.getAttribute("address1");
            session.removeAttribute("address1");
            session.setAttribute("address",userAddress);
            session.setAttribute((String) session.getAttribute("email"),"true");
            session.setAttribute("currentemail","true");
            response.sendRedirect("checkout.jsp");
        }
        else{
            session.setAttribute("currentemail","false");
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("otpverification");
            requestDispatcher.forward(request,response);
        }
    }
}
