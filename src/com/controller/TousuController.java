package com.controller;

import javax.annotation.Resource;
import javax.mail.Session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.*;
import com.entity.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class TousuController extends BaseController {
	@Resource
	TousuDAO tousuDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	ProductDAO productDAO;
	
	
	
	//后台查询投诉列表
	@RequestMapping("admin/tousuList")
	public String tousuList(HttpServletRequest request) {
		String index = request.getParameter("index");
		String key = request.getParameter("key");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
   	    HashMap map = new HashMap();
   	    map.put("key", key);
		List<Tousu> list = tousuDAO.selectAll(map);
		for(Tousu tousu:list){
			Member saver = memberDAO.findById(tousu.getSaverid());
			Member member = memberDAO.findById(tousu.getMemberid());
			Product product = productDAO.findById(tousu.getProductid());
			tousu.setProduct(product);
			tousu.setSeller(saver);
			tousu.setMember(member);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/tousulist";
	}
	
	//前台查询投诉列表
	@RequestMapping("tousuLb")
	public String listtousu(HttpServletRequest request) {
		//商品类别
		List<Category> ctlist = categoryDAO.selectfatherAll();
		for(Category category:ctlist){
			List<Category> childlist = categoryDAO.selectchildAll(category.getId());
			category.setChildlist(childlist);
			for(Category childcategory:childlist){
				List<Category> minlist = categoryDAO.selectminAll(childcategory.getId());
				childcategory.setMinlist(minlist);
			}
		}
		request.setAttribute("ctlist", ctlist);
		
		Member  member = (Member)request.getSession().getAttribute("sessionmember");
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
   	    HashMap map = new HashMap();
	    map.put("memberid", member.getId());
		List<Tousu> list = tousuDAO.selectAll(map);
		for(Tousu tousu:list){
			Member saver = memberDAO.findById(tousu.getSaverid());
			Product product = productDAO.findById(tousu.getProductid());
			tousu.setProduct(product);
			tousu.setSeller(saver);
		}
		request.setAttribute("list", list);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "tousulb";
	}
	
	
	
	//添加投诉 
	@RequestMapping("tousuAdd")
	public String tousuAdd(Tousu tousu,HttpServletRequest request){
		Member  member = (Member)request.getSession().getAttribute("sessionmember");
		if(member!=null){
		Product product = productDAO.findById(tousu.getProductid());
		
		if(member.getId()!=product.getMemberid()){
		tousu.setSaverid(product.getMemberid());
		tousu.setMemberid(member.getId());
		tousu.setSavetime(Info.getDateStr());
		tousuDAO.add(tousu);
		return "redirect:tousuLb.do";
		}else{
		return "redirect:productDetails.do?id="+tousu.getProductid()+"&tousu=tousu";	
		}
		}else{
		return "login";	
		}
	}
	
	
	
	
	
	//删除投诉
	@RequestMapping("admin/tousuDelAll")
	public void tousuDelAll(HttpServletRequest request,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			String vals = request.getParameter("vals");
			String[] val = vals.split(",");
			for(int i=0;i<val.length;i++){
				tousuDAO.delete(Integer.parseInt(val[i]));
			}
			out.println("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//删除投诉
	@RequestMapping("tousuDel")
	public String tousuDel(int id,HttpServletRequest request){
			tousuDAO.delete(id);
		return "redirect:tousuLb.do";
	}
	
	//投诉回复
	@RequestMapping("admin/tousuHf")
	public String tousuHf(Tousu tousu,HttpServletRequest request){
		tousuDAO.update(tousu);
		return "redirect:tousuList.do";
	}
	
	

}
