package com.anderson.ecommerce.service;

import com.anderson.ecommerce.dto.cart.CartDto;
import com.anderson.ecommerce.dto.cart.CartItemDto;
import com.anderson.ecommerce.dto.checkout.CheckoutItemDto;
import com.anderson.ecommerce.exceptions.OrderNotFoundException;
import com.anderson.ecommerce.model.Order;
import com.anderson.ecommerce.model.OrderItem;
import com.anderson.ecommerce.model.User;
import com.anderson.ecommerce.repository.OrderItemsRepository;
import com.anderson.ecommerce.repository.OrderRepository;
import com.stripe.model.checkout.Session;

import java.util.*;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;


@Service
@Transactional
public class OrderService {


    @Autowired
    private CartService cartService;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemsRepository orderItemsRepository;

    @Value("${BASE_URL}")
    private String baseURL;

    @Value("${STRIPE_SECRET_KEY}")
    private String apiKey;

    // create total price and send productname as input
    SessionCreateParams.LineItem.PriceData createPriceData(CheckoutItemDto checkoutItemDto) {
        return SessionCreateParams.LineItem.PriceData.builder()
            .setCurrency("usd")
            .setUnitAmount( ((long) checkoutItemDto.getPrice()) * 100)
            .setProductData(
                SessionCreateParams.LineItem.PriceData.ProductData.builder()
                    .setName(checkoutItemDto.getProductName())
                    .build())
            .build();
    }

    // build each product in the stripe checkout page
    SessionCreateParams.LineItem createSessionLineItem(CheckoutItemDto checkoutItemDto) {
        return SessionCreateParams.LineItem.builder()
            // set price for each product
            .setPriceData(createPriceData(checkoutItemDto))
            // set quantity for each product
            .setQuantity(Long.parseLong(String.valueOf(checkoutItemDto.getQuantity())))
            .build();
    }

    // create session from list of checkout items
    public Session createSession(List<CheckoutItemDto> checkoutItemDtoList) throws StripeException {

        // supply success and failure url for stripe
        String successURL = baseURL + "/payment/success";
        String failedURL = baseURL + "/payment/failed";

        // set the private key
        Stripe.apiKey = apiKey;

        List<SessionCreateParams.LineItem> sessionItemsList = new ArrayList<>();

        // for each product compute SessionCreateParams.LineItem
        for (CheckoutItemDto checkoutItemDto : checkoutItemDtoList) {
            sessionItemsList.add(createSessionLineItem(checkoutItemDto));
        }

        // build the session param
        SessionCreateParams params = SessionCreateParams.builder()
            .addPaymentMethodType(SessionCreateParams.PaymentMethodType.CARD)
            .setMode(SessionCreateParams.Mode.PAYMENT)
            .setCancelUrl(failedURL)
            .addAllLineItem(sessionItemsList)
            .setSuccessUrl(successURL)
            .build();
        return Session.create(params);
    }

    public void placeOrder(User user, String sessionId) {
        CartDto cartDto = cartService.listCartItems(user);
        List<CartItemDto> cartItemDtoList = cartDto.getCartItems();

        Order newOrder = new Order();
        newOrder.setCreatedDate(new Date());
        newOrder.setSessionId(sessionId);
        newOrder.setUser(user);
        newOrder.setTotalPrice(cartDto.getTotalCost());
        orderRepository.save(newOrder);

        for (CartItemDto cartItemDto : cartItemDtoList) {
            OrderItem orderItem = new OrderItem();
            orderItem.setCreatedDate(new Date());
            orderItem.setPrice(cartItemDto.getProduct().getPrice());
            orderItem.setProduct(cartItemDto.getProduct());
            orderItem.setQuantity(cartItemDto.getQuantity());
            orderItem.setOrder(newOrder);
            // add to order item list
            orderItemsRepository.save(orderItem);
        }

        cartService.deleteUserCartItems(user);
    }

    public List<Order> listOrders(User user) {
        return orderRepository.findAllByUserOrderByCreatedDateDesc(user);
    }

    public Order getOrder(Integer id, User user) throws OrderNotFoundException {
        Optional<Order> optionalOrder = orderRepository.findById(id);
        if (optionalOrder.isEmpty()) {
            throw new OrderNotFoundException("order id is not valid");
        }
        Order order = optionalOrder.get();
        if(order.getUser() != user) {
            throw  new OrderNotFoundException("order does not belong to user");
        }
        return order;
    }
}


