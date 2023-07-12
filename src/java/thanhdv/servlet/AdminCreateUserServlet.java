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
@WebServlet(name="AdminCreateUserServlet", urlPatterns={"/adminCreateUser"})
public class AdminCreateUserServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       // Get Parameter
        String username = request.getParameter("txtUsername");
        String fullname = request.getParameter("txtFullname");
        String password = request.getParameter("txtPassword");
        String confirmPassword = request.getParameter("txtConfirmPassword");

        // Init url through siteMaps
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITE_MAP");
        String url = siteMaps.getProperty(MyAppConstants.ManageFeatures.ADMIN_CREATE_USER_PAGE);

        boolean isError = false;
        AccountCreateError errors = new AccountCreateError();
        try {
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
            if (!confirmPassword.trim().equals(password.trim())) {
                isError = true;
                errors.setConfirmNotMatchError("Confirmed Password must match Password");
            }

            if (isError) {
                request.setAttribute("ERROR_SIGNUP", errors);
            } else {
                AccountDAO daoAccount = new AccountDAO();
                AccountDTO dtoAccount = new AccountDTO(username, password, fullname, false);
                if (daoAccount.createAccount(dtoAccount)) {
                    List<AccountDTO> listUser = daoAccount.getAllAccounts();
                    request.setAttribute("listAccounts", listUser);
                    url = siteMaps.getProperty(MyAppConstants.ManageFeatures.MANAGE_USER_PAGE);
                }
            }
        } catch (SQLException ex) {
            log("RegisterServlet_SQL: " + ex.getMessage());
            if (ex.getMessage().contains("duplicate")) {
                errors.setUsernameIsExisted(username + " is EXISTED");
                request.setAttribute("ERROR_SIGNUP", errors);
            }
        } catch (NamingException ex) {
            log("RegisterServlet_Naming: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
