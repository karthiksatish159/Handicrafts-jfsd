package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.category;

public interface Category extends JpaRepository<category,Integer> {

	category findByCid(int id);

	

	category findByCname(String category);

}
