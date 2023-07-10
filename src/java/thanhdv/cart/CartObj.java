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

/**
 *
 * @author Oliver Doan
 */
public class CartObj implements Serializable {

    private Map<String, Integer> items;

    private List<String> listSku;

    public List<String> getListSku() {
        return listSku;
    }

    public Map<String, Integer> getItems() {
        return items;
    }

    public void addItemToCart(String skuProduct, int quantity) {
        if (skuProduct == null) {
            return;
        }
        if (skuProduct.trim().isEmpty()) {
            return;
        }
        // 1. Check existed item
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        // 2. Check existed item
        if (this.items.containsKey(skuProduct)) {
            quantity = this.items.get(skuProduct) + quantity;
        }
        // 3. Update items
        this.items.put(skuProduct, quantity);
    }

    public void removeItemFromCart(String sku, int removeQuantity) {
        // 1. Check existed items - ngăn chứa đồ
        if (this.items == null) {
            return;
        }
        // 2. Check existed item
        if (this.items.containsKey(sku)) {
            this.items.put(sku, items.get(sku) - removeQuantity);
        }
    }

    public void addCountItems(String skuProduct) {
//        int count = this.listSku.size();
//        if (!this.listSku.contains(skuProduct)) {
//            count = this.listSku.size() + 1;
//        }
//        return count;
    }

//     public double getTotalPrice() {
//        double totalPrice = 0;
//        if (this.items != null) {
//            for (Map.Entry<String, Integer> entry : this.items.entrySet()) {
//                String id = entry.getKey();
//                int quantity = entry.getValue();
//                if (this.products != null && this.products.containsKey(id)) {
//                    ProductDTO product = this.products.get(id);
//                    totalPrice += quantity * product.getPrice();
//                }
//            }
//        }
//        return totalPrice;
//    }
}
