package com.anderson.ecommerce.service;

import com.anderson.ecommerce.model.User;
import com.anderson.ecommerce.model.Wishlist;
import com.anderson.ecommerce.repository.WishlistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishlistService {
    @Autowired
    private WishlistRepository wishlistRepository;

    public void createWishlist(Wishlist wishlist) {
        wishlistRepository.save(wishlist);
    }

    public List<Wishlist> readWishlist(User user) {
        return wishlistRepository.findAllByUserOrderByCreatedDateDesc(user);
    }
}
