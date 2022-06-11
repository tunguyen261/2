/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.shopping.Product;
import sample.shopping.ProductDAO;

/**
 *
 * @author Nguyễn Đoàn Tú
 */
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String US_SUCCESS = "shop.jsp";
    private static final String US_ERROR = "shop.jsp";
    private static final String AD_SUCCESS = "admin.jsp";
    private static final String AD_ERROR = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            String searchByUser = request.getParameter("searchByUser");
            ProductDAO dao = new ProductDAO();
            if (search != null) {
                List<Product> listProduct = dao.getListProductAdmin(search);
                if (listProduct.size() > 0) {
                    request.setAttribute("LIST_PRODUCT", listProduct);
                    url = AD_SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Can not find product");
                    url = AD_ERROR;
                }
            }
            if (searchByUser != null) {
                List<Product> listProduct = dao.getListProductUser(searchByUser);
                if (listProduct.size() > 0) {
                    request.setAttribute("LIST_PRODUCT", listProduct);
                    url = US_SUCCESS;
                } else {
                    request.setAttribute("ERROR", "The product not exist !!!");
                    url = US_ERROR;
                }
            }
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
