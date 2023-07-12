/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thanhdv.account.AccountCreateError;
import thanhdv.account.AccountDAO;
import thanhdv.account.AccountDTO;
import thanhdv.utl.MyAppConstants;

/**
 *
 * @author Oliver Doan
 */
@WebServlet(name = "UpdateUserServlet", urlPatterns = {"/updateUser"})
public class UpdateUserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Get parameter from manageUser.jsp
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String fullname = request.getParameter("txtFullname");
        String searchUser = request.getParameter("searchValue");
        boolean isAdmin = false;
        if (request.getParameter("isAdmin").equals("1")) {
            isAdmin = true;
        }
        // Set up siteMap
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITE_MAP");
        String url = siteMaps.getProperty(MyAppConstants.ViewPageFeature.INVALID_PAGE);

        AccountCreateError errors = new AccountCreateError();
        boolean isError = false;
        try {
            AccountDAO daoAccount = new AccountDAO();
            // 1. Check isValid Parameter
            if (username.trim().length() < 6 || username.trim().length() > 20) {
                isError = true;
                errors.setUsernameLengthError("Username is required 6-20 chars");
            }
            if (fullname.trim().length() < 5 || fullname.trim().length() > 30) {
                isError = true;
                errors.setFullnameLengthError("Fullname is required 5-30 chars");
            }
            if (password.trim().length() < 8 || password.trim().length() > 30) {
                isError = true;
                errors.setPasswordLengthError("Password is required 8-30 chars");
            }
            if (isError) {
                request.setAttribute("ERROR_SIGNUP", errors);
                request.setAttribute("username_Bug", username);
            } else {
                // Update Account in Database
                daoAccount.updateAccount(username, password, fullname, isAdmin);
            }
            daoAccount.searchName(searchUser);
            List<AccountDTO> listAccount = daoAccount.getListAccounts();
            
            
            request.setAttribute("listAccounts", listAccount);
            request.setAttribute("searchUser", searchUser);
            url = siteMaps.getProperty(MyAppConstants.ManageFeatures.MANAGE_USER_PAGE);
        } catch (SQLException ex) {
            log("UpdateAccount SQLException: " + ex.getMessage());
            if (ex.getMessage().contains("duplicate")) {
                errors.setUsernameIsExisted(username + " is EXISTED");
                request.setAttribute("ERROR_SIGNUP", errors);
            }
        } catch (ClassNotFoundException ex) {
            log("UpdateAccount ClassNotFoundException: " + ex.getMessage());
        } catch (NamingException ex) {
            log("UpdateAccount NamingException: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
