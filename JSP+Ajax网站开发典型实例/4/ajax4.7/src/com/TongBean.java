package com;

public class TongBean
{
	private int id;
	private String name;
	private String age;
	private String sex;
	private String  address;
	private String  phone;
	private String  qq;
	private String  email;
	
	public TongBean(){}
	
	public TongBean(int id,String name,String age,String sex,String address,String phone,String qq,String email)
	{
		this.id=id;
		this.name=name;
		this.age=age;
		this.sex=sex;
		this.address=address;
		this.phone=phone;
		this.qq=qq;
		this.email=email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		qq = qq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}