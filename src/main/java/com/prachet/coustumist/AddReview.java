package com.prachet.coustumist;

import com.prachet.helper.MongoDB;
import com.prachet.utilities.Review;
import com.prachet.utilities.StringRessource;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

@WebServlet(name="Review", urlPatterns="/review")
public class AddReview extends HttpServlet{
        String id;
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String productid=request.getParameter("id");
                this.id=productid;
                String rating=request.getParameter("rating");
                String message=request.getParameter("message");
                String name=request.getParameter("name");
                String email=request.getParameter("email");
                String date=new Date().getDate()+"-"+new Date().getMonth()+"-"+(new Date().getYear()-100);
                Review review=new Review(productid,rating,message,name,email,date);
                MongoDB db=new MongoDB();
                db.addReview(StringRessource.getCollection(4),review);
                ArrayList<Review> reviews=db.getReview(StringRessource.getCollection(4),productid);
                HttpSession session=request.getSession(false);
                session.setAttribute("review"+id,reviews);
                session.setAttribute("reviewsize"+id,reviews.size());
                String url=request.getRequestURI();
                String uri=url.substring(0, url.indexOf("review"));
                response.sendRedirect(uri+"productdetail.jsp?productid="+productid);
        }

        public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
                RequestDispatcher rd=request.getRequestDispatcher("productdetail.jsp");
                request.setAttribute("productid",this.id);
                rd.forward(request,response);
        }

}