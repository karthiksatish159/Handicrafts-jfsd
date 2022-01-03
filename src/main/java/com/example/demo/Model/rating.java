package com.example.demo.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class rating 
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int rrid;
	private int pid;
	private int count;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public rating() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getRrid() {
		return rrid;
	}
	public void setRrid(int rrid) {
		this.rrid = rrid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating123) {
		this.rating = rating123;
	}
	private String pname;
	private int rating;
	
}
