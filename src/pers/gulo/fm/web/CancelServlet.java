package pers.gulo.fm.web;

import pers.gulo.fm.dao.Impl.UserDaoImpl;
import pers.gulo.fm.dao.UserDAO;
import pers.gulo.fm.domain.FlightReserve;
import pers.gulo.fm.domain.User;
import pers.gulo.fm.exception.MyException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CancelServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        User user=(User) request.getSession().getAttribute("user");
        int ticketID=Integer.parseInt(request.getParameter("ticketID"));
        int flightID=Integer.parseInt(request.getParameter("flightID"));
        int seatID=Integer.parseInt(request.getParameter("seatID"));
        int price=Integer.parseInt(request.getParameter("price"));
        UserDAO userDAO=new UserDaoImpl();
        try {
            userDAO.deleteTicket(user.getUserID(),flightID,seatID,ticketID,price);
            request.getSession().setAttribute("myOrderMsg","取消订票成功");
        }catch (MyException e){
            request.getSession().setAttribute("myOrderMsg","取消订票失败");
            e.printStackTrace();
        }finally {
            response.sendRedirect(request.getContextPath()+"/myOrder.jsp");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}