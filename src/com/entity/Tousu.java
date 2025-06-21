package com.entity;

import java.util.*;

public class Tousu {
	private int id;
	private int memberid;
	private int saverid;
	private int productid;
	private String content;
	private String hfcontent;
	private String savetime;
	
	private Product product;
	private Member member;
	private Member seller;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public int getSaverid() {
		return saverid;
	}
	public void setSaverid(int saverid) {
		this.saverid = saverid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHfcontent() {
		return hfcontent;
	}
	public void setHfcontent(String hfcontent) {
		this.hfcontent = hfcontent;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Member getSeller() {
		return seller;
	}
	public void setSeller(Member seller) {
		this.seller = seller;
	}
	
	
	
	
}
