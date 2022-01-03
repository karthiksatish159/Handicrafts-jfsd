package com.example.demo.Backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.Model.User;
import com.example.demo.Model.cart;
import com.example.demo.Model.category;
import com.example.demo.Model.product;
import com.example.demo.Repository.Cart;
import com.example.demo.Repository.Category;
import com.example.demo.Repository.Product;
import com.example.demo.Repository.SdpRepo;

@Service
public class Backend123
{
	@Autowired
	SdpRepo repo;
	@Autowired
	Product prepo;
	@Autowired
	Category catrepo;
	@Autowired
	Cart cart;
	public void saveData(User std)
	{
		repo.save(std);
	}
	public List<product> getAllActiveProducts() {
		return prepo.findAll();
	}
	public void saveProduct(product product) 
	{
		prepo.save(product);
		
	}
	public void deleteBy(int sid)
	{
		 prepo.deleteById(sid);
	}
	public void saveCat(category cat)
	{
		catrepo.save(cat);
	}
	public List<category> getAllActiveCategory() 
	{
		return catrepo.findAll();
	}
	public void deleteByCat(int id)
	{
		catrepo.deleteById(id);
		
	}
	public List<User> getAllActiveUser() 
	{
		
		return repo.findAll();
	}
	public product findByproId(int id) 
	{
		
		return prepo.findById(id);
	}
	public void deleteByCart(int id) 
	{
		
		cart.deleteById(id);
		
	}
	



}
