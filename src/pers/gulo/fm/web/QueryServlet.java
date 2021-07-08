package pers.gulo.fm.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.gulo.fm.dao.UserDAO;
import pers.gulo.fm.dao.Impl.UserDaoImpl;
import pers.gulo.fm.domain.Flight;
import pers.gulo.fm.exception.MyException;

public class QueryServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
    	String start=null;
        String destination=null;
        String time=null;
        try {
            start=new String(request.getParameter("start").getBytes("ISO_8859_1"), "UTF_8");
        }catch (Exception e){
        }

        try {
            destination=new String(request.getParameter("destination").getBytes("ISO_8859_1"), "UTF_8");
        }catch (Exception e){
        }

        try {
            time=new String(request.getParameter("time").getBytes("ISO_8859_1"), "UTF_8");
        }catch (Exception e){
        }
    	
        System.out.println(start);
        System.out.println(destination);
        System.out.println(time);
        System.out.println(request.getContextPath());
        request.getRequestDispatcher("/bookFlight.jsp").forward(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

}
