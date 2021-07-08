package pers.gulo.fm.web;

import pers.gulo.fm.domain.User;
import pers.gulo.fm.service.Impl.UserServiceImpl;
import pers.gulo.fm.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();/*获取http页面信息*/
        String username=request.getParameter("username");
        System.out.println(username);
        String password=request.getParameter("password");
        System.out.println(password);
        UserService userService=new UserServiceImpl();
        User user =userService.login(username,password);
        if(user!=null){
            session.setAttribute("user",user);
            session.removeAttribute("loginMsg");

            if(user.getUserType()==1)
                response.sendRedirect(request.getContextPath()+"/admin.jsp");
            else
                response.sendRedirect(request.getContextPath()+"/user.jsp");
        }else {
            request.getSession().setAttribute("loginMsg","用户名或密码错误");
            response.sendRedirect(request.getContextPath()+"/Login.jsp");
        }
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException{
        doGet(request,response);
    }
}