package com.entity;

import java.util.*;

public class Product {
	private int id;
	private String productname;
	private String filename;
	private double price;
	private int memberid;
	private int fid;
	private int cid;
	private int mid;
	private String content;
	private String delstatus;
	private String issj;
	private String savetime;
	private int looknum;
	private String shstatus;
	private double oldprice;
	private Category fcategory;
	private Category ccategory;
	private Category mcategory;
	private Inventory inventory;
	private int totalnum;
	private double likescore;
	private int vote;
	private Member seller;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	
	
	public Category getFcategory() {
		return fcategory;
	}
	public void setFcategory(Category fcategory) {
		this.fcategory = fcategory;
	}
	public Category getCcategory() {
		return ccategory;
	}
	public void setCcategory(Category ccategory) {
		this.ccategory = ccategory;
	}
	public Category getMcategory() {
		return mcategory;
	}
	public void setMcategory(Category mcategory) {
		this.mcategory = mcategory;
	}
	public Inventory getInventory() {
		return inventory;
	}
	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}
	
	
	public double getLikescore() {
		return likescore;
	}
	public void setLikescore(double likescore) {
		this.likescore = likescore;
	}
	public int getTotalnum() {
		return totalnum;
	}
	public void setTotalnum(int totalnum) {
		this.totalnum = totalnum;
	}
	
	
	public int getVote() {
		return vote;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public String getIssj() {
		return issj;
	}
	public void setIssj(String issj) {
		this.issj = issj;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public int getLooknum() {
		return looknum;
	}
	public void setLooknum(int looknum) {
		this.looknum = looknum;
	}
	public double getOldprice() {
		return oldprice;
	}
	public void setOldprice(double oldprice) {
		this.oldprice = oldprice;
	}
	public Member getSeller() {
		return seller;
	}
	public void setSeller(Member seller) {
		this.seller = seller;
	}
	public String getShstatus() {
		return shstatus;
	}
	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}
	
	
	
	
	
}
