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
import java.util.HashMap;
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
                    int stars = rs.getInt("stars");
                    int categoryID = rs.getInt("categoryID");
                    float price = rs.getFloat("price");
                    String desc = rs.getString("description");
                    String image = rs.getString("image");

                    ProductDTO dto = new ProductDTO(sku, name, quantity, status, stars, categoryID, price, desc, image);
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

    public boolean createProduct(ProductDTO product)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            // 1. Make Connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // 2. Create SQL statement String
                String sql = "Insert into Product("
                        + "sku, name, quantity, status, stars, categoryID, price, description, image"
                        + ") values ("
                        + "?,?,?,?,?,?,?,?,?"
                        + ")";
                // 3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, product.getSkuProduct());
                stm.setString(2, product.getNameProduct());
                stm.setInt(3, product.getQuantityProduct());
                stm.setInt(4, product.getStatusProduct());
                stm.setInt(5, product.getStarsProduct());
                stm.setInt(6, product.getQuantityProduct());
                stm.setFloat(7, product.getPriceProduct());
                stm.setString(8, product.getDescriptionProduct());
                stm.setString(9, product.getImageProduct());
                // 4. Execute Query
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            } // end connection has opened
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
        return result;
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

    public boolean updateProduct(String skuProduct, int quantity, int status, int stars, int cateID, float price, String desc)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        System.out.println("@@ status: " + status);
        System.out.println("@@ stars: " + stars);
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update Product "
                        + "set quantity = ?, "
                        + "status = ?, "
                        + "stars = ?, "
                        + "categoryID = ?, "
                        + "price = ?, "
                        + "description = ? "
                        + "where sku = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, quantity);
                stm.setInt(2, status);
                stm.setInt(3, stars);
                stm.setInt(4, cateID);
                stm.setFloat(5, price);
                stm.setString(6, desc);
                stm.setString(7, skuProduct);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean deleteProduct(String skuProduct)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            // 1. Make Connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // 2. Create SQL statement String
                String sql = "Delete From Product "
                        + "Where sku = ? ";
                // 3. Create State Object
                stm = con.prepareStatement(sql);
                stm.setString(1, skuProduct);
                // 4.  Excute Query
                int effectRows = stm.executeUpdate();
                // 5. Process
                if (effectRows > 0) {
                    return true;
                }
            } // end connection has opened
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
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

    public List<ProductDTO> sortProductByCate(String nameCate)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select * from Product p,Category c "
                        + "where p.categoryID = c.idCategory "
                        + "and c.nameCategory = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, nameCate);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String sku = rs.getString("sku");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    int status = rs.getInt("status");
                    int stars = rs.getInt("stars");
                    int cateId = rs.getInt("categoryID");
                    float price = rs.getFloat("price");
                    String desc = rs.getString("description");
                    String img = rs.getString("image");

                    ProductDTO dtoProduct = new ProductDTO(sku, name, quantity, status, stars, cateId, price, desc, img);
                    if (this.listProducts == null) {
                        this.listProducts = new ArrayList<>();
                    }
                    listProducts.add(dtoProduct);
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

    public List<ProductDTO> sortProductByPrice(String typePrice)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "";
                if (typePrice.trim().equals("increasePrice")) {
                    sql = "select * from Product "
                            + "order by price DESC";
                }
                if (typePrice.trim().equals("decreasePrice")) {
                    sql = "select * from Product "
                            + "order by price ASC";
                }
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String sku = rs.getString("sku");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    int status = rs.getInt("status");
                    int stars = rs.getInt("stars");
                    int cateId = rs.getInt("categoryID");
                    float price = rs.getFloat("price");
                    String desc = rs.getString("description");
                    String img = rs.getString("image");

                    ProductDTO dtoProduct = new ProductDTO(sku, name, quantity, status, stars, cateId, price, desc, img);
                    if (this.listProducts == null) {
                        this.listProducts = new ArrayList<>();
                    }
                    listProducts.add(dtoProduct);
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

}
