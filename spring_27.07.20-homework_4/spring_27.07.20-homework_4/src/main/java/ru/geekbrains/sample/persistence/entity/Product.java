package ru.geekbrains.sample.persistence.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Table(name = "product")
public class Product extends AbstractEntity{



        public  String productName;

        private Integer productPrice;

        private boolean productExists;

        @ManyToOne(cascade = CascadeType.ALL)
        @JoinColumn(name = "student")
        private Student student;



    }

