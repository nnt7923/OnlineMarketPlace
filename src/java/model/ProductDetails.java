/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Arrays;

/**
 *
 * @author Admin
 */
public class ProductDetails {
    private int id;
    private Product product;
    private String name;
    private float priceDiscount;
    private String color;
    private String[] image;
    private String criteria;
    private int quantity;
    private String describe;
    private String specification;

    public ProductDetails() {
    }

    public ProductDetails(int id, Product product, String name, float priceDiscount, String color, String[] image, String criteria, int quantity, String describe, String specification) {
        this.id = id;
        this.product = product;
        this.name = name;
        this.priceDiscount = priceDiscount;
        this.color = color;
        this.image = image;
        this.criteria = criteria;
        this.quantity = quantity;
        this.describe = describe;
        this.specification = specification;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPriceDiscount() {
        return priceDiscount;
    }

    public void setPriceDiscount(float priceDiscount) {
        this.priceDiscount = priceDiscount;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String[] getImage() {
        return image;
    }

    public void setImage(String[] image) {
        this.image = image;
    }

    public String getCriteria() {
        return criteria;
    }

    public void setCriteria(String criteria) {
        this.criteria = criteria;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    @Override
    public String toString() {
        return "ProductDetails{" + "id=" + id + ", product=" + product + ", name=" + name + ", priceDiscount=" + priceDiscount + ", color=" + color + ", image=" + Arrays.toString(image) + ", criteria=" + criteria + ", quantity=" + quantity + ", describe=" + describe + ", specification=" + specification + '}';
    }

    

        
    
}
