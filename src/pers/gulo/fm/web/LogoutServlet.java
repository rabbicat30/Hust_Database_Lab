package pers.gulo.fm.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        HttpSession session=request.getSession();
        session.removeAttribute("user");
        session.removeAttribute("loginMsg");
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException{
        doGet(request,response);
    }
}