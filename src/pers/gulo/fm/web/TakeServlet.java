package pers.gulo.fm.web;

import pers.gulo.fm.dao.Impl.UserDaoImpl;
import pers.gulo.fm.dao.UserDAO;
import pers.gulo.fm.domain.Flight;
import pers.gulo.fm.domain.Notification;
import pers.gulo.fm.domain.User;
import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.service.Impl.UserServiceImpl;
import pers.gulo.fm.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class TakeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        int userID=Integer.parseInt(request.getParameter("userID"));
        int flightID=Integer.parseInt(request.getParameter("flightID"));
        System.out.println("test 3");
        System.out.println(request.getParameter("seatID"));
        int seatID=Integer.parseInt(request.getParameter("seatID"));

        UserService userService=new UserServiceImpl();
        try {
            userService.deleteNotification(userID,flightID,seatID);
        } catch (MyException e) {
            request.getSession().setAttribute("takeTicketMsg",e.getMessage());
            e.printStackTrace();
        }finally {
            response.sendRedirect(request.getContextPath() +"/takeTicket.jsp");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}