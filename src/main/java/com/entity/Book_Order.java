package com.entity;

public class Book_Order {
	
	private int id;
	private String orderId;
	private String userName;
	private String name;
	private String email;
	private String phno;
	private String fulladd;
	private String bookName;
	private String author;
	private String price;
	private String paymeentType;
	
	
	public Book_Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public String getBookName() {
		return bookName;
	}



	public void setBookName(String bookName) {
		this.bookName = bookName;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}
	
	


	public String getOrderId() {
		return orderId;
	}



	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	

	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhno() {
		return phno;
	}


	public void setPhno(String phno) {
		this.phno = phno;
	}


	public String getFulladd() {
		return fulladd;
	}


	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}


	public String getPaymeentType() {
		return paymeentType;
	}


	public void setPaymeentType(String paymeentType) {
		this.paymeentType = paymeentType;
	}


	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", name=" + name + ", email=" + email + ", phno=" + phno + ", fulladd="
				+ fulladd + ", paymeentType=" + paymeentType + "]";
	}
	
	
	
	
	
	

}
