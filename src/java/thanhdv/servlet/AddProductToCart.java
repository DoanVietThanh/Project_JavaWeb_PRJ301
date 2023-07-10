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
import javax.servlet.http.HttpSession;
import thanhdv.cart.CartObj;
import thanhdv.category.CategoryDAO;
import thanhdv.category.CategoryDTO;
import thanhdv.product.ProductDAO;
import thanhdv.product.ProductDTO;
import thanhdv.utl.MyAppConstants;

/**
 *
 * @author Oliver Doan
 */
@WebServlet(name = "AddProductToCart", urlPatterns = {"/addProductToCart"})
public class AddProductToCart extends HttpServlet {

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
        // Init siteMap
        ServletContext context = this.getServletContext();
        Properties siteMap = (Properties) context.getAttribute("SITE_MAP");
        String url = siteMap.getProperty(MyAppConstants.ViewPageFeature.SHOP_PAGE);

        try {
            ProductDAO daoProduct = new ProductDAO();
            List<ProductDTO> listProduct = daoProduct.getAllProduct();
            CategoryDAO daoCategory = new CategoryDAO();
            List<CategoryDTO> listCategory = daoCategory.getAllCategory();
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listProduct", listProduct);

            HttpSession session = request.getSession(true);
            String skuProduct = request.getParameter("skuProduct");
            CartObj cart = new CartObj();

            List<String> listShoppingCart = cart.getListSku();

            int count = 0;
//            int flag = 0;
//            for (int i = 0; i < listShoppingCart.size(); i++) {
//                if (listShoppingCart.get(i).equals(skuProduct)) {
//                    ++flag;
//                }
//            }
            session.setAttribute("COUNT_CART", count);
        } catch (SQLException ex) {
            log("AddProductToCart_SQL: " + ex.getMessage());
        } catch (NamingException ex) {
            log("AddProductToCart_Naming: " + ex.getMessage());
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
