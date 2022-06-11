/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.shopping.Product;
import sample.shopping.ProductDAO;
import sample.shopping.ProductError;

/**
 *
 * @author Nguyễn Đoàn Tú
 */
@WebServlet(name = "CreateProductController", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

    private static final String ERROR="admin.jsp";
    private static final String SUCCESS="admin.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        ProductError productError=new ProductError();
        try{
            String productID=request.getParameter("productID");
            String productName=request.getParameter("productName");
            String image=request.getParameter("image");
            Double price=Double.parseDouble(request.getParameter("price"));
            int quantity=Integer.parseInt(request.getParameter("quantity"));
            String categoryID=request.getParameter("categoryID");
            String importDate=request.getParameter("importDate");
            String usingDate=request.getParameter("usingDate");
            
            boolean checkValidation=true;
            ProductDAO dao=new ProductDAO();
            boolean checkDuplicate=dao.checkDuplicate(productID);
            if(checkDuplicate){
                productError.setProductIDError("Duplicate!!!");
                checkValidation=false;
            }
            if(productID.length()<0 || productID.length()>10){
                productError.setProductIDError("Product ID must be in [0,10]");
                checkValidation=false;
            }
            if(productName.length()<3 || productName.length()>20){
                productError.setProductNameError("Product Name must be in [3,20]");
            }
            if(price<0 ){
                productError.setPriceError("Price can not negative!");
            }
            if(quantity<0 ){
                productError.setQuantityError("Quantity can not negative!");
            }
            if(!categoryID.equals("01") || !categoryID.equals("02")){
                productError.setCategoryIDError("Only accepted: 01-Fruit / 02-Vegatable !!!");
            }
            if(importDate.compareToIgnoreCase(usingDate)>0){
                productError.setUsingDateError("Using date must be rather than import date!");
                checkValidation =false;
            }
            
            if(checkValidation){
                Product product=new Product(productID, productName, image, price, quantity, categoryID, importDate, usingDate);
                boolean checkCreate=dao.create(product);
                if(checkCreate){
                    request.setAttribute("ERROR","Create successful !!!");
                    url=SUCCESS;
                }
            }else{
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        }catch(Exception e){
            log("ERROR at CreateProductController"+e.toString());
        }finally{
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
