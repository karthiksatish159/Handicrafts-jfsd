package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.customer;

public interface Customer extends JpaRepository<customer,Integer> {

	customer findByCuname(String name);

}
