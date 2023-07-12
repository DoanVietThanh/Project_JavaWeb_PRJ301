/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.utl;

/**
 *
 * @author Oliver Doan
 */
public class MyAppConstants {
    public class ViewPageFeature {
        public static final String LOGIN_PAGE = "login";
        public static final String SHOP_PAGE = "shopPage";
        public static final String INVALID_PAGE = "invalid";
        public static final String Detail_PRODUCT_PAGE = "detailProductPage";
        public static final String REGISTER_PAGE = "registerPage";
        public static final String SHOPPING_CART_PAGE = "shoppingCart";
    }
    
    public class LoginFeatures {
        public static final String INVALID_PAGE = "invalid";
        public static final String SEARCH_ACTION = "searchAction";
    }
    
    public class SearchAccountFeatures {
        public static final String SEARCH_PAGE = "searchPage";
    }
    
    public class ManageFeatures {
        public static final String MANAGE_USER_PAGE = "manageUserPage";
        public static final String MANAGE_PRODUCT_PAGE = "manageProductPage";
        public static final String ADMIN_CREATE_USER_PAGE = "adminCreateUserPage";
        public static final String ADMIN_CREATE_PRODUCT_PAGE = "adminCreateProductPage";
    }
    
    public class Servlet {
        public static final String Manager_User_SERVLET = "manageUserForm";
        public static final String Manager_Product_SERVLET = "manageProductForm";
        public static final String SHOP_SERVLET = "shop";
    }
}
