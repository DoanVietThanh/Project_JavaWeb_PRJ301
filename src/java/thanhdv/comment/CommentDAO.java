/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.comment;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import thanhdv.category.CategoryDTO;
import thanhdv.utl.DBHelper;

/**
 *
 * @author Oliver Doan
 */
public class CommentDAO implements Serializable {

    private List<CommentDTO> listComments;

    public List<CommentDTO> getListComments() {
        return listComments;
    }

    public List<CommentDTO> getAllComments()
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM Comment "
                        + "ORDER BY date DESC";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String date = rs.getString("date");
                    String textComment = rs.getString("textComment");
                    String skuProdct = rs.getString("skuProdct");
                    CommentDTO dtoComment = new CommentDTO(username, date, textComment, skuProdct);
                    if (this.listComments == null) {
                        this.listComments = new ArrayList<CommentDTO>();
                    }
                    listComments.add(dtoComment);
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
        return listComments;
    }

    public List<CommentDTO> getAllCommentsBySku(String skuProduct)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from comment "
                        + "where skuProduct = ? "
                        + "order by date asc";
                stm = con.prepareStatement(sql);
                stm.setString(1, skuProduct);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String date = rs.getString("date");
                    String textComment = rs.getString("textComment");
                    CommentDTO dtoComment = new CommentDTO(username, date, textComment, skuProduct);
                    if (this.listComments == null) {
                        this.listComments = new ArrayList<CommentDTO>();
                    }
                    listComments.add(dtoComment);
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
        return listComments;
    }

    public boolean createComment(String username, String date, String textComment, String skuProduct)
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
                String sql = "Insert into Comment("
                        + "username, date, textComment, skuProduct"
                        + ") values("
                        + "?, ?, ?, ?"
                        + ")";
                // 3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, date);
                stm.setString(3, textComment);
                stm.setString(4, skuProduct);
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
}
