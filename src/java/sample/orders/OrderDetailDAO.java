package sample.orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.shopping.Product;
import sample.utils.DBUtils;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Nguyễn Đoàn Tú
 */
public class OrderDetailDAO {

    private static final String CHECK_DETAILID = "SELECT productID FROM tblOrderDetail WHERE detailID=?";
    private static final String CREATE_ORDER_DETAIL = "INSERT INTO tblOrderDetail(detailID, price, quantity, orderID ,productID) VALUES(?,?,?,?,?)";

    public boolean checkDetailID(String detailID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DETAILID);
                ptm.setString(1, detailID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
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

    public boolean createOrderDetail(String detailID, String orderID, Product product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORDER_DETAIL);
                ptm.setString(1, detailID);
                ptm.setDouble(2, product.getPrice());
                ptm.setInt(3, product.getQuantity());
                ptm.setString(4, orderID);
                ptm.setString(5, product.getProductID());
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
}
