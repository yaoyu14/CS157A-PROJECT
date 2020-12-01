package login.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.model.LoginModel;
import user.login.LoginUser;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginUser loginUser;

    public void init() {
        loginUser = new LoginUser();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginModel LoginModel = new LoginModel();
        LoginModel.setUsername(username);
        LoginModel.setPassword(password);

        try {
            if (loginUser.validate(LoginModel) == 1) {
                //HttpSession session = request.getSession();
                // session.setAttribute("username",username);
                response.sendRedirect("signUpSuccess.jsp");
            }else if(loginUser.validate(LoginModel) == 2) {
            	response.sendRedirect("list");
            }else {
                HttpSession session = request.getSession();
                //session.setAttribute("user", username);
                response.sendRedirect("userLogin.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}