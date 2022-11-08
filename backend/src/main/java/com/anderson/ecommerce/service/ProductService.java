package com.anderson.ecommerce.service;

import com.anderson.ecommerce.dto.product.ProductDto;
import com.anderson.ecommerce.model.Category;
import com.anderson.ecommerce.model.Product;
import com.anderson.ecommerce.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public void addProduct(ProductDto productDto, Category category) {
        Product product = getProductFromDto(productDto, category);
        productRepository.save(product);
    }

    public static Product getProductFromDto(ProductDto productDto, Category category) {
        Product product = new Product();
        product.setCategory(category);
        product.setDescription(productDto.getDescription());
        product.setImageURL(productDto.getImageURL());
        product.setPrice(productDto.getPrice());
        product.setName(productDto.getName());
        return product;
    }

    public List<ProductDto> listProducts() {
        List<Product> products = productRepository.findAll();
        List<ProductDto> productDtos = new ArrayList<ProductDto>();

        for (int i = 0; i < products.size(); i++) {
            productDtos.add(new ProductDto(products.get(i)));
        }
        return productDtos;
    }

    public void updateProduct(Integer productID, ProductDto productDto, Category category) {
        Product product = getProductFromDto(productDto, category);
        product.setId(productID);
        productRepository.save(product);
    }
}
