package com.prachet.coustumist;

import com.mongodb.BasicDBObject;
import com.prachet.helper.MongoDB;
import com.prachet.helper.StringRessource;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Set;

@MultipartConfig
@WebServlet(name = "Filter", urlPatterns = "/filter")
public class filter extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String material=request.getParameter("check");
        MongoDB db=new MongoDB();
        switch (material) {
            case "allmaterial": {
                ArrayList<ArrayList<String>> products = db.getAllCollection(StringRessource.getCollection(0));
                request.setAttribute("product", products);
                break;
            }
            case "polyester":
            case "cotton": {
                ArrayList<ArrayList<String>> products = db.searchByMaterial(StringRessource.getCollection(0), material);
                request.setAttribute("product", products);
                break;
            }
        }
        RequestDispatcher rd=request.getRequestDispatcher("shop.jsp");
        rd.forward(request,response);
//        response.sendRedirect("shop.jsp");
    }
}
