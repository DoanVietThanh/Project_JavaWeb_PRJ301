/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.account;

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
public class AccountDAO implements Serializable {

    private List<AccountDTO> listAccounts;

    public List<AccountDTO> getListAccounts() {
        return listAccounts;
    }

    public List<AccountDTO> getAllAccounts()
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // 1. Make Connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // 2. Create SQL statement String
                String sql = "Select username, password, fullname, isAdmin "
                        + "From Account ";
                // 3. Create Statement Object
                stm = con.prepareStatement(sql);
                // 4. Execute Query
                rs = stm.executeQuery();
                // 5. Process
                while (rs.next()) {
                    // 5.1 map data
                    // 5.1.1 get data from Result Set
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    // 5.1.2 set data to properties of DTO
                    AccountDTO dto = new AccountDTO(username, password, fullname, isAdmin);

                    // 5.2 add data to list
                    if (this.listAccounts == null) {
                        this.listAccounts = new ArrayList<AccountDTO>();
                    } // end account List had not existed
                    listAccounts.add(dto);
                } // end process each record in result set
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
        return listAccounts;
    }

    public AccountDTO checkLogin(String username, String password)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO dto = new AccountDTO();
        try {
            // 1. Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // 2. Create SQL statement String
                String sql = "Select * from Account "
                        + "where username = ? "
                        + "and password = ?";
                // 3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                // 4. Execute Query
                rs = stm.executeQuery();
                // 5. Process
                if (rs.next()) {
                    String fullname = rs.getString("fullname");
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    dto = new AccountDTO(username, password, fullname, isAdmin);
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
        return dto;
    }

    public void searchName(String searchValue)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // 1. Make Connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // 2. Create SQL statement String
                String sql = "Select username, password, fullname, isAdmin "
                        + "From Account "
                        + "Where fullname LIKE ?";
                // 3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                // 4. Execute Query
                rs = stm.executeQuery();
                // 5. Process
                while (rs.next()) {
                    // 5.1 map data
                    // 5.1.1 get data from Result Set
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    // 5.1.2 set data to properties of DTO
                    AccountDTO dto = new AccountDTO(username, password, fullname, isAdmin);

                    // 5.2 add data to list
                    if (this.listAccounts == null) {
                        this.listAccounts = new ArrayList<AccountDTO>();
                    } // end account List had not existed
                    listAccounts.add(dto);
                } // end process each record in result set
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
    }

    public boolean deleteAccount(String pk)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            // 1. Make Connection
            con = DBHelper.makeConnection();
            if (con != null) {
                // 2. Create SQL statement String
                String sql = "Delete From Account "
                        + "Where username = ?";
                // 3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, pk);
                // 4. Execute Query
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

    public boolean updateAccount(String username, String password, boolean role)
            throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        // Delete, Update ko can ResultSet vi ko can return
        System.out.println("username la: " + username);
        System.out.println("password la: " + password);
        System.out.println("role la: " + role);

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Account "
                        + "Set password = ?, "
                        + "isAdmin = ? "
                        + "WHERE username = ?";
                // 3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setBoolean(2, role);
                stm.setString(3, username);

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

    public boolean createAccount(AccountDTO account)
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
                String sql = "Insert into Account("
                        + "username, password, fullname, isAdmin"
                        + ") values("
                        + "?, ?, ?, ?"
                        + ")";
                // 3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, account.getUsername());
                stm.setString(2, account.getPassword());
                stm.setString(3, account.getFullname());
                stm.setBoolean(4, account.isIsAdmin());
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
