package com.anderson.ecommerce.controllers;

import com.anderson.ecommerce.dto.user.SigninDto;
import com.anderson.ecommerce.dto.user.SigninResponseDto;
import com.anderson.ecommerce.dto.user.SignupDto;
import com.anderson.ecommerce.dto.user.SignupResponseDto;
import com.anderson.ecommerce.exceptions.AuthenticationFailException;
import com.anderson.ecommerce.exceptions.CustomException;
import com.anderson.ecommerce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("user")
@RestController
public class UserController {

    @Autowired
    UserService userService;
    // signup
    @PostMapping("/signup")
    public SignupResponseDto Signup(@RequestBody SignupDto signupDto) throws CustomException {
        return userService.signup(signupDto);
    }

    // signin
    @PostMapping("/signin")
    public SigninResponseDto Signin(@RequestBody SigninDto signinDto) throws CustomException, AuthenticationFailException {
        return userService.signin(signinDto);
    }
}
