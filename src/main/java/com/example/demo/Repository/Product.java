package com.example.demo.Repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.Model.cart;
import com.example.demo.Model.product;


@Repository
@Transactional
public interface Product extends JpaRepository<product,Integer> 
{
	product findById(int id);

	List<product> findByPnameStartsWith(String q);
	long count();

  product findByPname(String pname);

List<product> findByCategory(String cname);

List<product> findBySname(String unamesell);

}
