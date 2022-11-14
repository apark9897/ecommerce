package com.anderson.ecommerce.repository;

import com.anderson.ecommerce.model.User;
import com.anderson.ecommerce.model.Wishlist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WishlistRepository extends JpaRepository<Wishlist, Integer> {
    List<Wishlist> findAllByUserOrderByCreatedDateDesc(User user);
}
