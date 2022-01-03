package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.returned;

public interface Returned extends JpaRepository<returned,Integer> {



	List<returned> findByCuname(String uuname);

	returned findByPid(int id);

	returned findByPidAndCuid(int id, int id2);

}
