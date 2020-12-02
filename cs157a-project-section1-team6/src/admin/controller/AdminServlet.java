package admin.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.AdminModel;
import admin.function.AdminFunction;


@WebServlet("/")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminFunction AdminFunction;

    public void init() {
    	AdminFunction = new AdminFunction();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showAddCocktailPage(request, response);
                    break;
                case "/insert":
                    insertCocktail(request, response);
                    break;
                case "/delete":
                    deleteCocktail(request, response);
                    break;
                case "/edit":
                    showEditCocktailPage(request, response);
                    break;
                case "/update":
                    updateCocktail(request, response);
                    break;
                default:
                    listCocktails(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listCocktails(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List < AdminModel > listCocktail = AdminFunction.selectAllCocktails();
        request.setAttribute("listCocktail", listCocktail);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cocktail_list.jsp");
        dispatcher.forward(request, response);
    }

    private void showAddCocktailPage(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("addCocktails.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditCocktailPage(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int cocktail_id = Integer.parseInt(request.getParameter("cocktail_id"));
        AdminModel existingCocktail = AdminFunction.selectCocktail(cocktail_id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("addCocktails.jsp");
        request.setAttribute("cocktail", existingCocktail);
        dispatcher.forward(request, response);

    }

    private void insertCocktail(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String ctName = request.getParameter("ctName");
        int AlcoholContent = Integer.parseInt(request.getParameter("AlcoholContent"));
        int price = Integer.parseInt(request.getParameter("price"));
        AdminModel newCocktail = new AdminModel(ctName, AlcoholContent, price);
        AdminFunction.insertCocktail(newCocktail);
        response.sendRedirect("list");
    }

    private void updateCocktail(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int cocktail_id = Integer.parseInt(request.getParameter("cocktail_id"));
        String ctName = request.getParameter("ctName");
        int AlcoholContent = Integer.parseInt(request.getParameter("AlcoholContent"));
        int price = Integer.parseInt(request.getParameter("price"));
        AdminModel updateCocktail = new AdminModel(cocktail_id, ctName, AlcoholContent, price);
        AdminFunction.updateCocktail(updateCocktail);
        response.sendRedirect("list");
    }

    private void deleteCocktail(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int cocktail_id = Integer.parseInt(request.getParameter("cocktail_id"));
        AdminFunction.deleteCocktail(cocktail_id);
        response.sendRedirect("list");

    }
}