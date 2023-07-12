/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
import thanhdv.product.ProductDAO;
import thanhdv.product.ProductDTO;
import thanhdv.utl.MyAppConstants;

/**
 *
 * @author Oliver Doan
 */
@WebServlet(name = "AddminCreateProductServlet", urlPatterns = {"/adminCreateProduct"})
public class AddminCreateProductServlet extends HttpServlet {

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
        // Set siteMAp
        ServletContext context = this.getServletContext();
        Properties siteMap = (Properties) context.getAttribute("SITE_MAP");
        String url = siteMap.getProperty(MyAppConstants.ManageFeatures.MANAGE_PRODUCT_PAGE);
        // Get Parameter
        String sku = request.getParameter("sku");
        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int status = Integer.parseInt(request.getParameter("status"));
        int stars = Integer.parseInt(request.getParameter("stars"));
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        try {
            ProductDAO daoProduct = new ProductDAO();
            if (daoProduct.getProductBySku(sku) != null) {
                url = siteMap.getProperty(MyAppConstants.ManageFeatures.ADMIN_CREATE_PRODUCT_PAGE);
                request.setAttribute("existed_SKU", "Existed SKU Product");
            } else {
                ProductDTO dtoProduct = new ProductDTO(sku, name, quantity, status, stars, categoryID, price, description, image);
                daoProduct.createProduct(dtoProduct);
            }
            request.setAttribute("listProducts", daoProduct.getAllProduct());
        } catch (SQLException ex) {
            log("AddminCreateProductServlet_SQL: " + ex.getMessage());
        } catch (NamingException ex) {
            log("AddminCreateProductServlet_Naming: " + ex.getMessage());
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
