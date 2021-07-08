package pers.gulo.fm.web;

import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.service.AdminService;
import pers.gulo.fm.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteFlightServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
    	request.setCharacterEncoding("UTF-8");
        int flightID=Integer.parseInt(request.getParameter("flightID"));
        AdminService adminService=new AdminServiceImpl();
        try {
            adminService.deleteFlight(flightID);
        }catch (MyException e){
            request.getSession().setAttribute("flightManageMsg",e.getMessage());
            e.printStackTrace();
        }finally {
            response.sendRedirect(request.getContextPath()+"/flightManage.jsp");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}