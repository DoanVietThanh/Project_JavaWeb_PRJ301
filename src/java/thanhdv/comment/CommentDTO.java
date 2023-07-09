/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanhdv.comment;

import java.io.Serializable;

/**
 *
 * @author Oliver Doan
 */
public class CommentDTO implements Serializable {

    private String username;
    private String date;
    private String textComment;
    private String skuProdct;

    public CommentDTO() {
    }

    public CommentDTO(String username, String date, String textComment, String skuProdct) {
        this.username = username;
        this.date = date;
        this.textComment = textComment;
        this.skuProdct = skuProdct;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTextComment() {
        return textComment;
    }

    public void setTextComment(String textComment) {
        this.textComment = textComment;
    }

    public String getSkuProdct() {
        return skuProdct;
    }

    public void setSkuProdct(String skuProdct) {
        this.skuProdct = skuProdct;
    }

    @Override
    public String toString() {
        return "CommentDTO{" + "username=" + username + ", date=" + date + ", textComment=" + textComment + ", skuProdct=" + skuProdct + '}';
    }

}
