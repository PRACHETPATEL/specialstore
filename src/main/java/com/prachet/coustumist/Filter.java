package com.prachet.coustumist;

import com.prachet.helper.MongoDB;
import com.prachet.utilities.StringRessource;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@MultipartConfig
@WebServlet(name = "Filter", urlPatterns = "/filter")
public class Filter extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String material = request.getParameter("check");
        String gender = request.getParameter("check1");
        MongoDB db = new MongoDB();
        ArrayList<ArrayList<String>> products=new ArrayList<>();
        if (material != null && gender!=null) {
            switch (material) {
                case "allmaterial": {
                    if (gender.equals("anygender")) {
                       products = db.getAllCollection(StringRessource.getCollection(0));
                        request.setAttribute("product", products);
                    }
                    else{
                        products = db.searchByGender(StringRessource.getCollection(0),gender);
                        request.setAttribute("product", products);
                    }
                    break;
                }
                case "polyester":
                case "cotton": {
                    if (gender.equals("anygender")) {
                        products = db.searchByMaterial(StringRessource.getCollection(0), material);
                        request.setAttribute("product", products);
                    }
                    else{
                        products = db.filterByMaterialAndGender(StringRessource.getCollection(0),material,gender);
                        request.setAttribute("product", products);
                    }
                    break;
                }
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("shop.jsp");
        rd.forward(request, response);
    }
}
