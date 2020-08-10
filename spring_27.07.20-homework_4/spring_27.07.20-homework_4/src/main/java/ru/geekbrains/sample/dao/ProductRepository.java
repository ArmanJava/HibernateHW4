package ru.geekbrains.sample.dao;

import org.springframework.stereotype.Repository;


import org.springframework.transaction.annotation.Transactional;
import ru.geekbrains.sample.dto.ProductDTO;
import ru.geekbrains.sample.persistence.entity.Product;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.*;

@Repository
public class ProductRepository  {
    @PersistenceContext
    private EntityManager entityManager;
    ProductRepository productRepository;

    @Transactional
    public List<Product> findAllProducts() {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
        Root<Product> root = criteriaQuery.from(Product.class);
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(criteriaBuilder.equal(root.get("graduated"), false));
        criteriaQuery.select(root);
        criteriaQuery.where(criteriaBuilder.and(predicates.toArray(new Predicate[]{})));
        return entityManager.createQuery(criteriaQuery).getResultList();
    }
    @Transactional
    public Object  findMax() {
        System.out.println("-- Employee MAX Price --");
//        EntityManager entityManager = entityManagerFactory.createEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Long> query = criteriaBuilder.createQuery(Long.class);
        Root<Product> employee = query.from(Product.class);
        query.orderBy(
                criteriaBuilder.asc(employee.get("productName")),
                criteriaBuilder.desc(employee.get("productPrice")));
        query.orderBy(
                criteriaBuilder.asc(employee.get("productName")),
                criteriaBuilder.desc(employee.get("productPrice")))
                .select(criteriaBuilder.max(employee.get("productPrice")));
        TypedQuery<Long> typedQuery = entityManager.createQuery(query);
        Long max = typedQuery.getSingleResult();
        System.out.println(max);
        entityManager.close();
        return max;
    }
    @Transactional
    public Object findMin() {
        System.out.println("-- Employee MIN Price --");
//        EntityManager entityManager = entityManagerFactory.createEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Long> query = criteriaBuilder.createQuery(Long.class);
        Root<Product> employee = query.from(Product.class);
        query.orderBy(
                criteriaBuilder.asc(employee.get("productName")),
                criteriaBuilder.desc(employee.get("productPrice")));

        query.orderBy(
                criteriaBuilder.asc(employee.get("productName")),
                criteriaBuilder.desc(employee.get("productPrice")))
                .select(criteriaBuilder.min(employee.get("productPrice")));
        TypedQuery<Long> typedQuery = entityManager.createQuery(query);
        Long min = typedQuery.getSingleResult();
        System.out.println(min);
        entityManager.close();
        return min;
    }

    @Transactional
    public void save(ProductDTO productDTO) {
        Product product = Product.builder().productName(productDTO.getProductName()).build();
        entityManager.persist(product);
        Product product1 = Product.builder()
                .productName(productDTO.getProductName())
                .productPrice(productDTO.getProductPrice())
                .productExists(productDTO.isProductExists())
                .build();
        entityManager.persist(product1);
    }

    @Transactional
    public void save(Product product) {
        productRepository.save(product);
    }


    //SELECT * FROM student WHERE graduated IS false;

}

