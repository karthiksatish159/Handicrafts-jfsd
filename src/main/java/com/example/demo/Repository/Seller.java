package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.seller;

public interface Seller extends JpaRepository<seller,Integer> {

	seller findByUsername(String username);

}
