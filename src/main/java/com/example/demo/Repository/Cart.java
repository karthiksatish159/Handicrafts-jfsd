package com.example.demo.Repository;

import java.util.List;
import java.util.Properties;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.Model.cart;

@Transactional
public interface Cart extends JpaRepository<cart,Integer>{

	public List<cart> findByCuname(String uname);
	public cart findByPname(String pname);
	public cart findByCid(int id);
	@Modifying 
    @Query(value = "DELETE FROM cart WHERE cuid = :id",nativeQuery = true)
	public void deleteByCuid(@Param("id")int id);
	public List<cart> findByCuid(int id);
	


}
