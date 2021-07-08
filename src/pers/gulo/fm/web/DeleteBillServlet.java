package pers.gulo.fm.web;

import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.service.AdminService;
import pers.gulo.fm.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteBillServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        int flightID=Integer.parseInt(request.getParameter("flightID"));
        int userID=Integer.parseInt(request.getParameter("userID"));
        int seatID=Integer.parseInt(request.getParameter("seatID"));
        int ticketID=Integer.parseInt(request.getParameter("ticketID"));
        int price=Integer.parseInt(request.getParameter("price"));

        AdminService adminService=new AdminServiceImpl();
        try {
            adminService.deleteBill(flightID,userID,seatID,ticketID,price);
        }catch (MyException e){
            request.getSession().setAttribute("OrderManageMsg",e.getMessage());
            e.printStackTrace();
        }finally {
            response.sendRedirect(request.getContextPath()+"/orderManage.jsp");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}