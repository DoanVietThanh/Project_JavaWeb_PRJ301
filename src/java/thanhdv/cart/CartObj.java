/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import thanhdv.product.ProductDTO;

/**
 *
 * @author Oliver Doan
 */
public class CartObj implements Serializable {

    private Map<String, ProductDTO> products;

    public Map<String, ProductDTO> getProducts() {
        return products;
    }

    private Map<String, Integer> itemCart;

    public Map<String, Integer> getItemCart() {
        return itemCart;
    }

    public void addItemToCart(String skuProduct, int quantity) {
        int updatedQuantity = quantity;
        // 1. Check validation
        if (skuProduct == null) {
            return;
        }
        if (quantity <= 0) {
            return;
        }
        if (skuProduct.trim().isEmpty()) {
            return;
        }
        // 2. Check existed item
        if (this.itemCart == null) {
            this.itemCart = new HashMap<>();
        }
        // 3. Drop item to cart
        if (this.itemCart.containsKey(skuProduct)) {
            updatedQuantity += this.itemCart.get(skuProduct);
        }
        this.itemCart.put(skuProduct, updatedQuantity);
    }

    public void addProductToCart(String skuProduct, ProductDTO productDTO) {
        // 1. Check validation
        if (skuProduct == null) {
            return;
        }
        if (skuProduct.trim().isEmpty()) {
            return;
        }
        // 2. Check existed item
        if (this.products == null) {
            this.products = new HashMap<>();
        }
        // 3. Drop item to cart
        if (this.products.containsKey(skuProduct)) {
            return;
        } else {
            this.products.put(skuProduct, productDTO);
        }
    }

    public int getNumberItem() {
        if (this.itemCart.isEmpty() || this.products.isEmpty()) {
            return 0;
        }
        return this.products.size();
    }

    public double getTotalPriceCheckout() {
        double totalPrice = 0;
        if (this.products != null && this.itemCart != null) {
            for (Map.Entry<String, ProductDTO> entry : products.entrySet()) {
                String skuProduct = entry.getKey();
                ProductDTO dtoProduct = entry.getValue();
                if (this.itemCart.containsKey(skuProduct)) {
                    float result = this.itemCart.get(skuProduct) * dtoProduct.getPriceProduct();
                    totalPrice += result;
                }
            }
        }
        return totalPrice;
    }

    public boolean deleteItemCart(String skuProduct) {
        if (this.itemCart == null || this.products == null) {
            return false;
        }
        if (this.itemCart.containsKey(skuProduct) || this.products.containsKey(skuProduct)) {
            this.itemCart.remove(skuProduct);
            this.products.remove(skuProduct);
            return true;
        }
        return false;
    }

    public void updateQuantityProduct(String skuProduct, int quantity) {
        if (skuProduct == null) {
            return;
        }
        if (skuProduct.trim().isEmpty()) {
            return;
        }
        if (quantity <= 0) {
            return;
        }
        if (this.itemCart.containsKey(skuProduct)) {
            this.itemCart.put(skuProduct, quantity);
        }
    }
}
