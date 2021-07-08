package pers.gulo.fm.web;

import pers.gulo.fm.domain.User;
import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.service.Impl.UserServiceImpl;
import pers.gulo.fm.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class AddUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        UserService userService=new UserServiceImpl();
        User user=new User();
        System.out.println("test");
        request.setCharacterEncoding("UTF-8");
        System.out.println(request.getParameter("username"));
        user.setName(new String(request.getParameter("username")));
        user.setPassword(new String(request.getParameter("password")));
        user.setRealName(new String(request.getParameter("realName")));
        user.setIdCard(new String(request.getParameter("idCard")));

        try {
            userService.initialUser(user);
            request.getSession().setAttribute("loginMsg","注册成功");
        }catch (MyException e){
            request.getSession().setAttribute("loginMsg",e.getMessage());
            e.printStackTrace();
        }finally {
            response.sendRedirect(request.getContextPath()+"/Login.jsp");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}