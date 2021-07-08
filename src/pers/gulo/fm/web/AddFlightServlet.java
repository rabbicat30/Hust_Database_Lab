package pers.gulo.fm.web;

import pers.gulo.fm.domain.Flight;
import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.service.AdminService;
import pers.gulo.fm.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddFlightServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        request.getSession().removeAttribute("flightManageMsg");
        AdminService adminService=new AdminServiceImpl();
        Flight flight=new Flight();
        request.setCharacterEncoding("UTF-8");
        flight.setFlightID(Integer.parseInt(request.getParameter("flightID")));
        flight.setName(new String (request.getParameter("flightName")));
        flight.setS_time(new String(request.getParameter("startTime")));
        flight.setE_time(new String(request.getParameter("endTime")));
        flight.setS_city(new String(request.getParameter("startCity")));
        flight.setE_city(new String(request.getParameter("endCity")));
        flight.setPrice(Integer.parseInt(request.getParameter("price")));
        flight.setCapacity(Integer.parseInt(request.getParameter("capacity")));
       
        try {
            adminService.insertFlight(flight);
        }catch (MyException e){
            request.getSession().setAttribute("flightManageMsg",e.getMessage());
            e.printStackTrace();
        }finally {
            response.sendRedirect(request.getContextPath()+"/flightManage.jsp");
        }
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException{
        doGet(request,response);
    }
}