package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.Model.ordersdp;

public interface Order extends JpaRepository<ordersdp,Integer> {

	
	
	public Order findByCuname( String uuname);

	public List<ordersdp> findByCuid(int id);

	public List<ordersdp> findByCategory(String category);

	public List<ordersdp> findByPname(String pname);
	
	@Modifying 
    @Query(value = "select FROM ordersdp WHERE cuname=:uuname and cartid=:cid",nativeQuery = true)
	public ordersdp findByCunameAndCartId(@Param("uuname") String uuname,@Param("cid") int cid);

	public ordersdp findByOid(int id);

}
