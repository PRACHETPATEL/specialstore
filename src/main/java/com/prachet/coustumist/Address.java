package com.prachet.coustumist;

import com.prachet.utilities.UserAddress;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Address",urlPatterns = "/address")
public class Address extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        response.setContentType("text/html");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        String country=request.getParameter("country");
        String city=request.getParameter("city");
        String state=request.getParameter("state");
        String pin=request.getParameter("pincode");
        PrintWriter our=response.getWriter();
        UserAddress userAddress=new UserAddress(fname,lname,email,phone,address,country,city,state,pin);
        HttpSession session= request.getSession(false);
        if(session!=null) {
            session.setAttribute("address1",userAddress);
        }
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("otpverification");
        requestDispatcher.forward(request,response);
    }
}