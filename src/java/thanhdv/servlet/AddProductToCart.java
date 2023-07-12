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
import thanhdv.comment.CommentDAO;
import thanhdv.comment.CommentDTO;
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
        String url = siteMap.getProperty(MyAppConstants.ViewPageFeature.Detail_PRODUCT_PAGE);
        try {
            // Set info of Product
            String quantity = request.getParameter("quantity");
            String skuProduct = request.getParameter("skuProduct");

            ProductDAO daoProduct = new ProductDAO();
            ProductDTO dtoProduct = daoProduct.getProductBySku(skuProduct);
            request.setAttribute("detailProduct", dtoProduct);
            // Pass attribute "skuProduct" for review.jsp -> comment
            request.setAttribute("skuProduct", skuProduct);
            // Set list of Comment
            CommentDAO daoComment = new CommentDAO();
            List<CommentDTO> listComment = daoComment.getAllCommentsBySku(skuProduct);
            request.setAttribute("listComment", listComment);

            // Add Item to session scope
            if (quantity != null) {
                // 1. Cus goes to cart's place
                HttpSession session = request.getSession(true);
                // 2. Cus takes his cart
                CartObj cart = (CartObj) session.getAttribute("CART_PRODUCT");
                if (cart == null) {
                    cart = new CartObj();
                }
                // 3. Cus drops items to his cart
                cart.addProductToCart(skuProduct, dtoProduct);
                cart.addItemToCart(skuProduct, Integer.parseInt(quantity));

                session.setAttribute("CART_PRODUCT", cart);
                // 4. Cus continously goes to shopping

                System.out.println("getItemCart" + cart.getItemCart());
                System.out.println("getProducts" + cart.getProducts());
            } else {
                url = siteMap.getProperty(MyAppConstants.ViewPageFeature.INVALID_PAGE);
            }
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
