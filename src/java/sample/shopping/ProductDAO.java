/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;
//AND CURRENT_TIMESTAMP > usingDate

/**
 *
 * @author Nguyễn Đoàn Tú
 */
public class ProductDAO {

    private static final String LOAD = "SELECT productID, productName, image, price, quantity, categoryID, importDate, usingDate FROM tblProduct WHERE quantity>0 AND usingDate>CURRENT_TIMESTAMP";
    private static final String DELETE = "DELETE tblProduct WHERE productID=?";
    private static final String SEARCH_US = "SELECT productID, productName, image, price, quantity, categoryID, importDate, usingDate FROM tblProduct WHERE productName like ?  AND quantity>0 AND usingDate>CURRENT_TIMESTAMP";
    private static final String SEARCH_AD = "SELECT productID, productName, image, price, quantity, categoryID, importDate, usingDate FROM tblProduct WHERE productName like ?  ";
    private static final String UPDATE = "UPDATE tblProduct SET productName=?, image=?, price=?, quantity=?, categoryID=?, importDate=?, usingDate=? WHERE productID=? ";
    private static final String CREATE = "INSERT INTO tblProduct(productID, productName, image, price, quantity, categoryID, importDate, usingDate) VALUES(?,?,?,?,?,?,?,?)";
    private static final String CHECK_DUPLICATE = "SELECT productName FROM tblProduct WHERE productID=?";
    private static final String GET_QUANTITY = "SELECT quantity FROM tblProduct WHERE productID=?";
    private static final String UPDATE_QUANTITY = "UPDATE tblProduct SET quantity=? WHERE productID=?";

    public boolean updateQuantity(int newQuan, String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                ptm.setInt(1, newQuan);
                ptm.setString(2, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;

    }
    
    public boolean checkDuplicate(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, productID);

                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public boolean create(Product product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getProductName());
                ptm.setString(3, product.getImage());
                ptm.setDouble(4, product.getPrice());
                ptm.setInt(5, product.getQuantity());
                ptm.setString(6, product.getCategoryID());
                ptm.setString(7, product.getImportDate());
                ptm.setString(8, product.getUsingDate());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<Product> getListProductUser(String search) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_US);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    list.add(new Product(productID, productName, image, price, quantity, categoryID, importDate, usingDate));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Product> getListProductAdmin(String search) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_AD);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    list.add(new Product(productID, productName, image, price, quantity, categoryID, importDate, usingDate));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean delete(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }

            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }

    public boolean update(Product product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getProductName());
                ptm.setString(2, product.getImage());
                ptm.setDouble(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());
                ptm.setString(5, product.getCategoryID());
                ptm.setString(6, product.getImportDate());
                ptm.setString(7, product.getUsingDate());
                ptm.setString(8, product.getProductID());

                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }

            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }

    public List<Product> getFullProduct() throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOAD);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    list.add(new Product(productID, productName, image, price, quantity, categoryID, importDate, usingDate));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getQuantity(String productID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_QUANTITY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    quantity = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;
    }

    
}
