package pers.gulo.fm.web;

import pers.gulo.fm.domain.User;
import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.service.AdminService;
import pers.gulo.fm.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class UpdateUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("userManageMsg");
        request.setCharacterEncoding("UTF-8");
        
        System.out.println(request.getParameter("realName"));
        String realName=new String(request.getParameter("realName"));
        
        System.out.println(request.getParameter("idCard"));
        String idCard=new String(request.getParameter("idCard"));
        
        System.out.println(request.getParameter("id"));
        int userID=Integer.parseInt(request.getParameter("id"));/*获取原本的用户id*/
        
        System.out.println(request.getParameter("uType"));
        int userType=Integer.parseInt(request.getParameter("uType"));
        
        User user=new User();
        user.setUserID(userID);
        user.setRealName(realName);
        user.setIdCard(idCard);
        user.setUserType(userType);

        AdminService adminService=new AdminServiceImpl();
        try {
            adminService.updateUser(user);
        }catch (MyException e){
            request.getSession().setAttribute("userManage.jsp",e.getMessage());
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/userManage.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}