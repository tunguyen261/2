/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.orders.OrderDTO;
import sample.orders.OrderDAO;
import sample.orders.OrderDetailDAO;
import sample.shopping.Cart;
import sample.shopping.Product;
import sample.shopping.ProductDAO;
import sample.user.UserDTO;

/**
 *
 * @author Nguyễn Đoàn Tú
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR_LOG = "login.jsp";
    private static final String ERROR_CART = "cart.jsp";
    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "checkout.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = loginUser.getUserID();
            Cart cart = (Cart) session.getAttribute("CART");
            OrderDAO dao = new OrderDAO();
            ProductDAO daoPro = new ProductDAO();
            OrderDetailDAO daoDetail = new OrderDetailDAO();
            List<OrderDTO> listOrder = new ArrayList<>();
            Random rd = new Random();
            double total = 0;
            String orderID = "";
            boolean check = true;
            if (loginUser == null) {
                url = ERROR_LOG;
                request.setAttribute("ERROR", "Login before check out!!!");
                check = false;
            } else {
                if (cart == null || cart.getCart().size() < 1) {
                    url = ERROR_CART;
                    request.setAttribute("ERROR", "Add product to cart before check out");
                    check = false;
                } else {
                    for (Product product : cart.getCart().values()) {
                        total += product.getPrice() * product.getQuantity();

                        boolean checkDuplicate = true;
                        do {
                            orderID = String.valueOf(rd.nextInt(10000));
                            checkDuplicate = dao.checkDuplicate(orderID);
                        } while (checkDuplicate = false);
                        String productID = product.getProductID();
                        Double price = product.getPrice() * product.getQuantity();
                        int quantity = product.getQuantity();
                        int quantityDB = dao.getQuantity(productID);
                        if (quantity > quantityDB) {
                            url = ERROR_CART;
                            request.setAttribute("ERROR", "Not enough quantity to sell");
                            check = false;
                        } else {
                            OrderDTO order = new OrderDTO(orderID, "", total, userID);
                            listOrder.add(new OrderDTO(orderID, "", total, userID));
                            total += price;
                            request.setAttribute("LIST_CHECK", listOrder);
                        }
                    }
                }
            }
            if (check) {
                boolean checkCreate = dao.createOrder(orderID, total, userID);
                if (checkCreate) {
                    boolean checkOrder = true;
                    for (OrderDTO order : listOrder) {
                        String detailID = "";
                        boolean checkID = true;
                        do {
                            detailID = String.valueOf(rd.nextInt(10000));
                            checkID = daoDetail.checkDetailID(detailID);
                        } while (checkID = false);
                        for (Product product : cart.getCart().values()) {
                            checkCreate = daoDetail.createOrderDetail(detailID, orderID, product);
                            String productID = product.getProductID();
                            int quantity = product.getQuantity();
                            int quantityDB = daoPro.getQuantity(productID);
                            int newQuan = quantityDB - quantity;
                            boolean checkUpdate = daoPro.updateQuantity(newQuan, productID);
                            if (checkUpdate == false) {
                                checkOrder = false;
                            }
                        }
                    }
                    if (checkOrder) {
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at CheckoutController: " + e.toString());
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
