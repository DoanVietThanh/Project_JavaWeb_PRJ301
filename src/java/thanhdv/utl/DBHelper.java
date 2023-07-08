/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.utl;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author Oliver Doan
 */
public class DBHelper implements Serializable {

    public static Connection makeConnection() 
            throws NamingException, SQLException {
        //1.Find current Context
        Context context = new InitialContext();
        //2. Find Tomcat's Context
        Context tomcatContext = (Context) context.lookup("java:comp/env");
        javax.sql.DataSource ds = (javax.sql.DataSource) tomcatContext.lookup("DSAssignmentPRJ");
        Connection con = ds.getConnection();
        return con;
    }
}
