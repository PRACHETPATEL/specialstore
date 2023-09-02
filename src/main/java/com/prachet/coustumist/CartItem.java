package com.prachet.coustumist;

import com.prachet.utilities.Cart;

import javax.servlet.ServletException;
import javax.servlet.SessionCookieConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "Cart", urlPatterns="/cart")
public class CartItem extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String price=request.getParameter("price");
        String img=request.getParameter("image");
        String quantity=request.getParameter("quantity");
        String size=request.getParameter("size");
        String color=request.getParameter("color");
        HttpSession session=request.getSession(false);
        Cart cart=new Cart(id,img,name,quantity,price,size,color);
        if(session!=null) {
            Map<Integer, Cart> cartitems = (Map<Integer, Cart>) session.getAttribute("cart");
            if (cartitems == null) {
                cartitems = new HashMap<>();
                cartitems.put(Integer.parseInt(id), cart);
            } else {
                cartitems.put(Integer.parseInt(id), cart);
            }
            session.setAttribute("cart", cartitems);
            session.setAttribute("cartitemnumber", cartitems.size());
        }
        response.sendRedirect("cart.jsp");
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id=request.getParameter("remove");
        HttpSession session=request.getSession();
        Map<Integer,Cart> cartitems=(Map<Integer,Cart>) session.getAttribute("cart");
        if(cartitems!=null){
            cartitems.remove(Integer.parseInt(id));
            session.setAttribute("cart",cartitems);
            session.setAttribute("cartitemnumber",cartitems.size());
        }
        response.sendRedirect("cart.jsp");
    }
}
