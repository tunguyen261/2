<%-- 
    Document   : admin
    Created on : Feb 22, 2022, 8:34:57 PM
    Author     : Nguyễn Đoàn Tú
--%>

<%@page import="sample.shopping.ProductError"%>
<%@page import="sample.shopping.Product"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <h1>Welcome: <%= loginUser.getFullName()%></h1>
        <a href="MainController?action=Logout">LOG OUT</a>

        <form action="MainController">
            <a style="color: blue">Search Product</a> <input type="text" name="search" required="" value="<%=search%>"placeholder="Input name product"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <%
            List<Product> listProduct = (List<Product>) request.getAttribute("LIST_PRODUCT");
            if (listProduct != null) {
                if (listProduct.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category ID</th>
                    <th>Import Date</th>
                    <th>Using Date</th>

                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (Product product : listProduct) {
                %>
            <form action="MainController">
                <tr>
                    <td>
                        <%= count++%>
                    </td>
                    <td>
                        <input type="text" name="productID" value="<%= product.getProductID()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="productName" value="<%= product.getProductName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="image" value="<%= product.getImage()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="price" value="<%= product.getPrice()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="quantity" value="<%= product.getQuantity()%>" required=""/>
                    </td>
                    <td>

                        <input type="text" name="categoryID" value="<%= product.getCategoryID()%>" required=""/>
                    </td>
                    <td>

                        <input type="date" name="importDate" value="<%= product.getImportDate()%>" required=""/>
                    </td>
                    <td>

                        <input type="date" name="usingDate" value="<%= product.getUsingDate()%>" required=""/>
                    </td>

                    <td>
                        <a href="MainController?action=Delete&productID=<%= product.getProductID()%>&search=<%= search%>">Delete</a>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
                    </td>
                </tr>
            </form>

            <%
                }
            %>

        </tbody>
    </table>
    
    <%
            }
        }
    %>
    
    
    <%
        ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
        if (productError == null) {
            productError = new ProductError();
        }
    %>

    <a style="color: blue">Create Product</a></br>
    <a style="color: blue">Input following information:</a></br>
    <form action="MainController" method="POST">
        Product ID   :<input type="text" name="productID" required=""/>
            <%= productError.getProductIDError()%></br>
        Product Name :<input type="text" name="productName" required=""/>
            <%= productError.getProductNameError()%></br>
            Image link <input type="text" name="image" required=""/><br>
        Price <input min="0" type="text" name="price" required=""/>
            <%= productError.getPriceError()%></br>
        Quantity(min=0) <input min="0" type="text" name="quantity" required=""/>
            <%= productError.getQuantityError()%></br>
        Category ID <input type="text" name="categoryID" required=""/></br>
        Import Date <input type="date" name="importDate" required=""/></br>
        Using Date <input type="date" name="usingDate" required=""/></br>    
        <input type="submit" name="action" value="CreateProduct"/>
        <input type="reset" value="Reset"/>
    </form>
        <br>
        <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <%= error%>
</body>
</html>
