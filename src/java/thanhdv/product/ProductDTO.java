/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.product;

import java.io.Serializable;

/**
 *
 * @author Oliver Doan
 */
public class ProductDTO implements Serializable {

    private String skuProduct;
    private String nameProduct;
    private int quantityProduct;
    private int statusProduct;
    private int starsProduct;
    private int categoryID;
    private float priceProduct;
    private String descriptionProduct;
    private String imageProduct;

    public ProductDTO() {
    }

    public ProductDTO(String skuProduct, String nameProduct, int quantityProduct, int statusProduct, int starsProduct, int categoryID, float priceProduct, String descriptionProduct, String imageProduct) {
        this.skuProduct = skuProduct;
        this.nameProduct = nameProduct;
        this.quantityProduct = quantityProduct;
        this.statusProduct = statusProduct;
        this.starsProduct = starsProduct;
        this.categoryID = categoryID;
        this.priceProduct = priceProduct;
        this.descriptionProduct = descriptionProduct;
        this.imageProduct = imageProduct;
    }

    public String getSkuProduct() {
        return skuProduct;
    }

    public void setSkuProduct(String skuProduct) {
        this.skuProduct = skuProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public int getQuantityProduct() {
        return quantityProduct;
    }

    public void setQuantityProduct(int quantityProduct) {
        this.quantityProduct = quantityProduct;
    }

    public int getStatusProduct() {
        return statusProduct;
    }

    public void setStatusProduct(int statusProduct) {
        this.statusProduct = statusProduct;
    }

    public int getStarsProduct() {
        return starsProduct;
    }

    public void setStarsProduct(int starsProduct) {
        this.starsProduct = starsProduct;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public float getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(float priceProduct) {
        this.priceProduct = priceProduct;
    }

    public String getDescriptionProduct() {
        return descriptionProduct;
    }

    public void setDescriptionProduct(String descriptionProduct) {
        this.descriptionProduct = descriptionProduct;
    }

    public String getImageProduct() {
        return imageProduct;
    }

    public void setImageProduct(String imageProduct) {
        this.imageProduct = imageProduct;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "skuProduct=" + skuProduct + ", nameProduct=" + nameProduct + ", quantityProduct=" + quantityProduct + ", statusProduct=" + statusProduct + ", starsProduct=" + starsProduct + ", categoryID=" + categoryID + ", priceProduct=" + priceProduct + ", descriptionProduct=" + descriptionProduct + ", imageProduct=" + imageProduct + '}';
    }
    

}
