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
import thanhdv.account.AccountDTO;
import thanhdv.comment.CommentDAO;
import thanhdv.comment.CommentDTO;
import thanhdv.product.ProductDAO;
import thanhdv.product.ProductDTO;
import thanhdv.utl.DateFormat;
import thanhdv.utl.MyAppConstants;

/**
 *
 * @author Oliver Doan
 */
@WebServlet(name = "CommentProduct", urlPatterns = {"/commentDetailProduct"})
public class CommentProduct extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        ServletContext context = this.getServletContext();
        Properties siteMap = (Properties) context.getAttribute("SITE_MAP");
        String url = siteMap.getProperty(MyAppConstants.ViewPageFeature.Detail_PRODUCT_PAGE);
        // Init DAO and DTO
        CommentDAO daoComment = new CommentDAO();
        AccountDTO dtoAccount = (AccountDTO) session.getAttribute("USER");
        ProductDAO daoProduct = new ProductDAO();
        // Get Parameter
        String textComment = request.getParameter("textComment");
        String skuProduct = request.getParameter("skuProduct");
        String resetPage = request.getParameter("resetPage");
        try {
            if (dtoAccount != null ) {
                DateFormat day = new DateFormat();
                String date = day.nowDate();
                String username = dtoAccount.getUsername();
                daoComment.createComment(username, date, textComment, skuProduct);
            }
            // Set attribute of listComment + detailProduct + skuProduct (hidden input) again for detailProduct.jsp and review.jsp
            List<CommentDTO> listComment = daoComment.getAllCommentsBySku(skuProduct);
            request.setAttribute("listComment", listComment);
            ProductDTO dtoProduct = daoProduct.getProductBySku(skuProduct);
            request.setAttribute("detailProduct", dtoProduct);
            request.setAttribute("skuProduct", skuProduct);
        } catch (SQLException ex) {
            log("CommentProduct_SQLException: " + ex.getMessage());
        } catch (NamingException ex) {
            log("CommentProduct_NamingException: " + ex.getMessage());
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
