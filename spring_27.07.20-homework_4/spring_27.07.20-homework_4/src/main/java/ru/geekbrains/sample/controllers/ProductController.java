package ru.geekbrains.sample.controllers;

import lombok.RequiredArgsConstructor;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ru.geekbrains.sample.dao.ProductRepository;
import ru.geekbrains.sample.dto.ProductDTO;


@RestController
@RequiredArgsConstructor
@RequestMapping("/products")
public class ProductController {

    private final ProductRepository productRepository;

    @GetMapping
    public String getProductsPage(Model model) {
        model.addAttribute("products", productRepository.findAllProducts());
        return "product";
    }
    @GetMapping
    public String getMin(Model model) {
        model.addAttribute("products", productRepository.findMin());
        return "product";
    }
    @GetMapping
    public String getMax(Model model) {
        model.addAttribute("products", productRepository.findMax());
        return "product";
    }

    @PostMapping
    public void sendFormProducts(@RequestBody ProductDTO productDTO) {
        productRepository.save(productDTO);
    }

}
