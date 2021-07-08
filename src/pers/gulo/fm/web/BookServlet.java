package pers.gulo.fm.web;

import pers.gulo.fm.dao.Impl.UserDaoImpl;
import pers.gulo.fm.dao.UserDAO;
import pers.gulo.fm.domain.User;
import pers.gulo.fm.exception.MyException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BookServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        User user=(User) request.getSession().getAttribute("user");
        UserDAO userDAO=new UserDaoImpl();
        
        System.out.println("test");
        System.out.println("test userID"+user.getUserID());
        request.setCharacterEncoding("UTF-8");
        System.out.println(request.getParameter("flightID"));
        int flightID=Integer.parseInt(request.getParameter("flightID"));
        
        System.out.println("flightid "+flightID);
        
        int seatID=1;
        try {
            seatID =userDAO.getSeatsByFlightID(flightID).get(0).getSeatID();
        } catch (MyException e) {
            e.printStackTrace();
        }
        System.out.println("test 2");
        System.out.println("test2 seatPrice "+ request.getParameter("seatPrice"));
        int seatPrice=Integer.parseInt(request.getParameter("seatPrice"));
       

        try {
            userDAO.bookFlight(user.getUserID(),flightID,seatID,seatPrice);
            request.setAttribute("bookFlightMsg","预订成功");
        } catch (MyException e) {
            request.getSession().setAttribute("bookFlightMsg","预订失败");
            e.printStackTrace();
        }finally {
        	
            response.sendRedirect(request.getContextPath() +"/bookFlight.jsp");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}