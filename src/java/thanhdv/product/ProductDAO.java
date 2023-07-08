/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.product;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import thanhdv.utl.DBHelper;

/**
 *
 * @author Oliver Doan
 */
public class ProductDAO implements Serializable {

    private List<ProductDTO> listProducts;

    public List<ProductDTO> getListProduct() {
        return listProducts;
    }

    public List<ProductDTO> getAllProduct()
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // 1. Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from Product";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String sku = rs.getString("sku");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    int status = rs.getInt("status");
                    int categoryID = rs.getInt("categoryID");
                    float price = rs.getFloat("price");
                    String desc = rs.getString("description");
                    String image = rs.getString("image");

                    ProductDTO dto = new ProductDTO(sku, name, quantity, status, status, categoryID, price, desc, image);
                    if (this.listProducts == null) {
                        this.listProducts = new ArrayList<ProductDTO>();
                    }
                    listProducts.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listProducts;
    }

    public void searchProduct(String valueSearch)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // 1. Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from Product "
                        + "where name LIKE ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + valueSearch + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String sku = rs.getString("sku");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    int status = rs.getInt("status");
                    int categoryID = rs.getInt("categoryID");
                    float price = rs.getFloat("price");
                    String desc = rs.getString("description");
                    String image = rs.getString("image");

                    ProductDTO dto = new ProductDTO(sku, name, quantity, status, status, categoryID, price, desc, image);
                    if (this.listProducts == null) {
                        this.listProducts = new ArrayList<ProductDTO>();
                    }
                    listProducts.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public ProductDTO getProductBySku(String valueSearch)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // 1. Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from Product "
                        + "where sku = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, valueSearch);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String sku = rs.getString("sku");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    int status = rs.getInt("status");
                    int categoryID = rs.getInt("categoryID");
                    float price = rs.getFloat("price");
                    String desc = rs.getString("description");
                    String image = rs.getString("image");

                    ProductDTO dto = new ProductDTO(sku, name, quantity, status, status, categoryID, price, desc, image);
                    return dto;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
}
