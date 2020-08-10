package ru.geekbrains.sample.dao;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;

import ru.geekbrains.sample.dto.BookDTO;
import ru.geekbrains.sample.dto.ProductDTO;
import ru.geekbrains.sample.persistence.entity.Book;
import ru.geekbrains.sample.persistence.entity.Product;

import java.util.Date;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ProductService {

//    private final ProductRepository productRepository;

//    public void save(ProductDTO productDTO) {
//        productRepository.save(
//                Product.builder()
//                        .productName(productDTO.getProductName())
//                        .productPrice(productDTO.getProductPrice())
//                        .productExists(productDTO.isProductExists())
//                        .build()
//        );
//    }

}
