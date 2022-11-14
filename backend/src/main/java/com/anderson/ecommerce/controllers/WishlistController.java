package com.anderson.ecommerce.controllers;

import com.anderson.ecommerce.common.ApiResponse;
import com.anderson.ecommerce.dto.product.ProductDto;
import com.anderson.ecommerce.exceptions.AuthenticationFailException;
import com.anderson.ecommerce.model.Product;
import com.anderson.ecommerce.model.User;
import com.anderson.ecommerce.model.Wishlist;
import com.anderson.ecommerce.repository.ProductRepository;
import com.anderson.ecommerce.repository.WishlistRepository;
import com.anderson.ecommerce.service.AuthenticationService;
import com.anderson.ecommerce.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/wishlist")
public class WishlistController {
    @Autowired
    WishlistService wishlistService;

    @Autowired
    AuthenticationService authenticationService;

    @Autowired
    private ProductRepository productRepository;

    @PostMapping("/add")
    public ResponseEntity<ApiResponse> addWishlist(@RequestBody ProductDto productDto, @RequestParam("token") String token) throws AuthenticationFailException {
        authenticationService.authenticate(token);
        User user = authenticationService.getUser(token);

        Product product = productRepository.getReferenceById(productDto.getId());
        Wishlist wishlist = new Wishlist(user, product);
        wishlistService.createWishlist(wishlist);

        return new ResponseEntity<ApiResponse>(new ApiResponse(true, "Added to wishlist"), HttpStatus.CREATED);
    }

    @GetMapping("/{token}")
    public ResponseEntity<List<ProductDto>> getWishlist(@PathVariable("token") String token) throws AuthenticationFailException {
        authenticationService.authenticate(token);
        User user = authenticationService.getUser(token);
        List<Wishlist> wishlists = wishlistService.readWishlist(user);
        List<ProductDto> products = new ArrayList<>();
        for (Wishlist w : wishlists) {
            products.add(new ProductDto(w.getProduct()));
        }
        return new ResponseEntity<>(products, HttpStatus.OK);
    }
}
