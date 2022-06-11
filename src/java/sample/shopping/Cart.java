/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Nguyễn Đoàn Tú
 */
public class Cart {

    private Map<String, Product> cart;

    public Cart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public Cart() {
    }

    public Map<String, Product> getCart() {
        return cart;
    }

    public void setCart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public boolean add(Product product) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(product.getProductID())) {
                int currentQuantity = this.cart.get(product.getProductID()).getQuantity();
                product.setQuantity(currentQuantity + product.getQuantity());
            }
            this.cart.put(product.getProductID(), product);
            check = true;
        } catch (Exception e) {

        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {

        }
        return check;
    }

    public boolean update(String id, Product product) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.replace(id, product);
                }
            }
        } catch (Exception e) {

        }
        return check;
    }
}
