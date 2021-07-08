package pers.gulo.fm.web;

import pers.gulo.fm.dao.Impl.UserDaoImpl;
import pers.gulo.fm.dao.UserDAO;
import pers.gulo.fm.domain.User;
import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.service.AdminService;
import pers.gulo.fm.service.Impl.AdminServiceImpl;
import pers.gulo.fm.service.Impl.UserServiceImpl;
import pers.gulo.fm.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class UpdateUserByUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user=(User) request.getSession().getAttribute("user");

        String username=new String(request.getParameter("username").getBytes(StandardCharsets.ISO_8859_1),StandardCharsets.UTF_8);
        String realName=new String(request.getParameter("realName").getBytes(StandardCharsets.ISO_8859_1),StandardCharsets.UTF_8);
        String idCard=new String(request.getParameter("idCard").getBytes(StandardCharsets.ISO_8859_1),StandardCharsets.UTF_8);
        String password=new String(request.getParameter("password").getBytes(StandardCharsets.ISO_8859_1),StandardCharsets.UTF_8);

        User new_user=new User();
        new_user.setUserID(user.getUserID());
        new_user.setName(username);
        new_user.setPassword(password);
        new_user.setRealName(realName);
        new_user.setIdCard(idCard);

        UserService userService=new UserServiceImpl();
        try {
            userService.changeUserInfo(new_user);
        }catch (MyException e){
            request.getSession().setAttribute("userMsg",e.getMessage());
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/user.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}