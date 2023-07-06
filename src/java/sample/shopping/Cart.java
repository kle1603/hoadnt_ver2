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
 * @author kle
 */
public class Cart {
    private Map<String, Laptop> cart;
    
    public Cart() {
        
    }

    public Cart(Map<String, Laptop> cart) {
        this.cart = cart;
    }

    public Map<String, Laptop> getCart() {
        return cart;
    }

    public void setCart(Map<String, Laptop> cart) {
        this.cart = cart;
    }

    public boolean add(Laptop lt) {
        boolean check = false;
        try {
            if (this.cart == null) {
            this.cart = new HashMap<>();
        }
            if (this.cart.containsKey(lt.getId())) {
                int quantity = this.cart.get(lt.getId()).getQuantity();
                lt.setQuantity(quantity + lt.getQuantity());
            }
            this.cart.put(lt.getId(), lt);
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

    public boolean update(String id, Laptop lt) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.replace(id, lt);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
    
    
}
