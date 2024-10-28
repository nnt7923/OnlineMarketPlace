/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class CartDetail{
    private int id;
    private int quantity;
    private ProductDetails pd;

    public CartDetail() {
    }

    public CartDetail(int id, int quantity, ProductDetails pd) {
        this.id = id;
        this.quantity = quantity;
        this.pd = pd;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ProductDetails getPd() {
        return pd;
    }

    public void setPd(ProductDetails pd) {
        this.pd = pd;
    }

    @Override
    public String toString() {
        return "CartDetail{" + "id=" + id + ", quantity=" + quantity + ", pd=" + pd + '}';
    }

    

    
}
