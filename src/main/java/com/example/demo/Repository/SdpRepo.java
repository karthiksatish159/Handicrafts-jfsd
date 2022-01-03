package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.Model.User;



public interface SdpRepo extends JpaRepository<User,Integer> 
{
	
	 User findByUsername(String username);
	 User findById(int id);
	User findByEmail(String uname);
}
