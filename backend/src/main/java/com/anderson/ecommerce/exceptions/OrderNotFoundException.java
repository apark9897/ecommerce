package com.anderson.ecommerce.exceptions;

public class OrderNotFoundException extends Exception {
    public OrderNotFoundException(String msg) {
        super(msg);
    }
}
