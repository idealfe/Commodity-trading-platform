package com.controller;

import javax.annotation.Resource;
import javax.mail.Session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
public class BackproductController extends BaseController {
	@Resource
	NewsDAO newsDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	CartDAO cartDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	ProductDAO productDAO;
	@Resource
	BackproductDAO backproductDAO;
	@Resource
	OrdermsgdetailsDAO ordermsgdetailsDAO;
	@Resource
	InventoryDAO inventoryDAO;
	
	
	
	
	//后台查询退货列表
	@RequestMapping("/member/backproductList")
	public String backproductList(HttpServletRequest request) {
		Member saver = (Member)request.getSession().getAttribute("sessionmember");
		String index = request.getParameter("index");
		String key = request.getParameter("key");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
   	    HashMap map = new HashMap();
   	    map.put("key", key);
   	    map.put("saverid", saver.getId());
		List<Backproduct> list = backproductDAO.selectAll(map);
		for(Backproduct backproduct:list){
			Ordermsgdetails ordermsgdetails = ordermsgdetailsDAO.findById(backproduct.getOrderid());
			Product product = productDAO.findById(backproduct.getProductid());
			Member member = memberDAO.findById(backproduct.getMemberid());
			backproduct.setOrdermsgdetails(ordermsgdetails);
			backproduct.setProduct(product);
			backproduct.setMember(member);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "member/backproductlist";
	}
	
	//前台查询退货列表
	@RequestMapping("listbackproduct")
	public String listbackproduct(HttpServletRequest request) {
		//宠物类别
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	
	  //购物车
	   	Member member = (Member)request.getSession().getAttribute("sessionmember");
	   	if(member!=null){
			List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
			String totalstr = "";
			double total = 0.0;
			for(int i=0;i<cartlist.size();i++){
				Member m = memberDAO.findById(cartlist.get(i).getMemberid());
				Product product = productDAO.findById(cartlist.get(i).getProductid());
				cartlist.get(i).setMember(m);
				cartlist.get(i).setProduct(product);
				total+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPrice();
			}
			totalstr = String.format("%.2f", total);
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("totalstr", totalstr);
			
			Page<Object> page = PageHelper.startPage(pageindex,6);
	   	    HashMap map = new HashMap();
		    map.put("memberid", member.getId());
			List<Backproduct> list = backproductDAO.selectAll(map);
			request.setAttribute("list", list);
			request.setAttribute("index", page.getPageNum());
			request.setAttribute("pages", page.getPages());
			request.setAttribute("total", page.getTotal());
			return "backproductlist";
		}else{
			return "login";
		}
	   	
	}
	
	
	
	
	//添加退货 
	@RequestMapping("backproductAdd")
	public String backproductAdd(HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		if(member!=null){
		String orderid = request.getParameter("orderid");
		String content = request.getParameter("content");
		Ordermsgdetails ordermsgdetails = ordermsgdetailsDAO.findById(Integer.parseInt(orderid));
		Product product = productDAO.findById(ordermsgdetails.getProductid());
		Ordermsgdetails od = ordermsgdetailsDAO.findById(Integer.parseInt(orderid));
		Backproduct backproduct = new Backproduct();
		backproduct.setMemberid(member.getId());
		backproduct.setSaverid(product.getMemberid());
		backproduct.setProductid(od.getProductid());
		backproduct.setSavetime(Info.getDateStr());
		backproduct.setContent(content);
		backproduct.setOrderid(Integer.parseInt(orderid));
		backproduct.setShstatus("待审核");
		backproductDAO.add(backproduct);
		
		od.setThstatus("已提交退货申请");
		ordermsgdetailsDAO.update(od);
		request.setAttribute("suc", "suc");
		
		return "backproductadd";
		}else{
			return "login";
		}
	}
	
	//退货
	@RequestMapping("member/updatebacksh")
	public String updatebacksh(Backproduct backproduct, HttpServletRequest request){
		String type = request.getParameter("type")==null?"":request.getParameter("type");
		Backproduct bg = backproductDAO.findById(backproduct.getId());
		Product product = productDAO.findById(bg.getProductid());
		Ordermsgdetails ordermsgdetails = ordermsgdetailsDAO.findById(bg.getOrderid());
		Member member = memberDAO.findById(bg.getMemberid());
		if(type.equals("ty")){
			Inventory inventory = new Inventory();
			inventory.setNum(ordermsgdetails.getNum());
			inventory.setProductid(String.valueOf(bg.getProductid()));
			inventory.setType("in");
			inventoryDAO.add(inventory);
			
			//计算退还款
			double plusprice = product.getPrice()*ordermsgdetails.getNum();
			BigDecimal doubleplusprice = new BigDecimal(plusprice);
			plusprice = doubleplusprice.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
			
			member.setYue(member.getYue()+plusprice);
			memberDAO.update(member);
			
			bg.setShstatus("已退货");
			backproductDAO.update(bg);
			ordermsgdetails.setThstatus("已退货");
			ordermsgdetailsDAO.update(ordermsgdetails);
		}else{
			ordermsgdetails.setThstatus("拒绝退货");
			backproductDAO.update(backproduct);
		}
		return "redirect:backproductList.do";
	}
	
	//删除退货
	@RequestMapping("member/backproductDel")
	public String backproductDel(int id, HttpServletRequest request,HttpServletResponse response){
			String vals = request.getParameter("vals");
			String[] val = vals.split(",");
			for(int i=0;i<val.length;i++){
				backproductDAO.delete(id);
			}
		return "redirect:backproductList.do";
	}
	
	
	
	

}
