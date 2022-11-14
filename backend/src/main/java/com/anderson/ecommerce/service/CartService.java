package com.anderson.ecommerce.service;

import com.anderson.ecommerce.dto.cart.AddToCartDto;
import com.anderson.ecommerce.dto.cart.CartDto;
import com.anderson.ecommerce.dto.cart.CartItemDto;
import com.anderson.ecommerce.exceptions.CartItemNotExistException;
import com.anderson.ecommerce.model.Cart;
import com.anderson.ecommerce.model.Product;
import com.anderson.ecommerce.model.User;
import com.anderson.ecommerce.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class CartService {
    @Autowired
    CartRepository cartRepository;

    public void addToCart(AddToCartDto addToCartDto, Product product, User user) {
        Cart cart = new Cart(product, addToCartDto.getQuantity(), user);
        cartRepository.save(cart);
    }

    public CartDto listCartItems(User user) {
        List<Cart> cart = cartRepository.findAllByUserOrderByCreatedDateDesc(user);
        double totalCost = 0;
        List<CartItemDto> cartItemDtos = new ArrayList<>();
        for (Cart c : cart) {
            totalCost += c.getProduct().getPrice() * c.getQuantity();
            cartItemDtos.add(new CartItemDto(c));
        }
        return new CartDto(cartItemDtos, totalCost);
    }

    public void deleteCartItem(int cartItemId, User user) throws CartItemNotExistException {
        Optional<Cart> cart = cartRepository.findById(cartItemId);
        if (!cart.isPresent()) {
            throw new CartItemNotExistException("Cart item does not exist!");
        }
        Cart cartItem = cart.get();
        if (cartItem.getUser().getId() != user.getId()) {
            throw new CartItemNotExistException("User does not own cart item!");
        }
        cartRepository.delete(cartItem);
    }
}
