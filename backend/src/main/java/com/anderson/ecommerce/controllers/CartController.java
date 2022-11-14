package com.anderson.ecommerce.controllers;

import com.anderson.ecommerce.common.ApiResponse;
import com.anderson.ecommerce.dto.cart.AddToCartDto;
import com.anderson.ecommerce.dto.cart.CartDto;
import com.anderson.ecommerce.exceptions.AuthenticationFailException;
import com.anderson.ecommerce.exceptions.CartItemNotExistException;
import com.anderson.ecommerce.exceptions.ProductNotExistException;
import com.anderson.ecommerce.model.Product;
import com.anderson.ecommerce.model.User;
import com.anderson.ecommerce.service.AuthenticationService;
import com.anderson.ecommerce.service.CartService;
import com.anderson.ecommerce.service.CategoryService;
import com.anderson.ecommerce.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cart")
public class CartController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductService productService;

    @Autowired
    AuthenticationService authenticationService;
    @Autowired
    CartService cartService;

    @PostMapping("/add")
    public ResponseEntity<ApiResponse> addToCart(@RequestBody AddToCartDto addToCartDto, @RequestParam("token") String token)
            throws AuthenticationFailException, ProductNotExistException, AuthenticationFailException {
        // first authenticate the token
        authenticationService.authenticate(token);

        // get the user
        User user = authenticationService.getUser(token);

        // find the product to add and add item by service
        Product product = productService.getProductById(addToCartDto.getProductId());
        cartService.addToCart(addToCartDto, product, user);

        // return response
        return new ResponseEntity<>(new ApiResponse(true, "Added to cart"), HttpStatus.CREATED);

    }

    @GetMapping("/")
    public ResponseEntity<CartDto> getCartItems(@RequestParam("token") String token) throws AuthenticationFailException {
        // first authenticate the token
        authenticationService.authenticate(token);

        // get the user
        User user = authenticationService.getUser(token);

        // get items in the cart for the user.
        CartDto cartDto = cartService.listCartItems(user);

        return new ResponseEntity<CartDto>(cartDto,HttpStatus.OK);
    }

    @DeleteMapping("/delete/{cartItemId}")
    public ResponseEntity<ApiResponse> deleteCartItem(@PathVariable("cartItemId") int cartItemId,
                                                      @RequestParam("token") String token)
            throws CartItemNotExistException, AuthenticationFailException {
        authenticationService.authenticate(token);
        User user = authenticationService.getUser(token);
        cartService.deleteCartItem(cartItemId, user);
        return new ResponseEntity<ApiResponse>(new ApiResponse(true, "Item has been removed"), HttpStatus.OK);
    }
}

