/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.category;

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
public class CategoryDAO implements Serializable {

    private List<CategoryDTO> listCategory;

    public List<CategoryDTO> getListCategory() {
        return listCategory;
    }

    public List<CategoryDTO> getAllCategory()
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from Category";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idCate = rs.getInt("idCategory");
                    String nameCate = rs.getString("nameCategory");
                    CategoryDTO dto = new CategoryDTO(idCate, nameCate);
                    if (this.listCategory == null) {
                        this.listCategory = new ArrayList<CategoryDTO>();
                    }
                    listCategory.add(dto);
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
        return listCategory;
    }
}
