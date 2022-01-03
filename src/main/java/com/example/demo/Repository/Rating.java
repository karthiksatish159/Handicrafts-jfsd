package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.rating;

public interface Rating extends JpaRepository<rating,Integer> {

	rating findByPid(int id);

}
