package com.aspire;
/*
 * Title:Online Shopping Portal 
 * Author:Karthick Prabakaran
 * Created At:1 Dec 2021
 * Reviewed BY:Akshaya Rajagopal
 * Modifies At:25:01:2022
 * */

//Information of the registered Users
public class RegisteredInformation {
	
	private final String name;
	private final String email;
	private final String type;
	private final String password;
	public RegisteredInformation(String name,String email,String type,String password) {
		
		 this.name= name;
		  this.email =email;
		  this.type =type;
		this.password =password ;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getType() {
		return type;
	}
	public String getPassword() {
		return password;
	}
	
	

}
