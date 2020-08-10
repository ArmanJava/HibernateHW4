package ru.geekbrains.sample.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;



@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {

    private String productName;
    private Integer productPrice;

    private boolean productExists;

    public boolean isProductExists() {
        return productExists;
    }

    public void setProductExists(boolean productExists) {
        this.productExists = productExists;
    }
}
