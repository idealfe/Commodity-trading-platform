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
import com.joyce.mail.test.MailTest;
import com.util.Info;
import com.util.MD5;

import java.util.*;

@Controller
public class MemberController extends BaseController {
	@Resource
	MemberDAO memberDAO;
	@Resource
	ProductDAO productDAO;
	@Resource
	NewsDAO newsDAO;
	@Resource
	AboutDAO aboutDAO;
	@Resource
	PictureDAO pictureDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	CartDAO cartDAO;
	
	
	//登录
	@RequestMapping("Login")
	public String Login(String uname,String upass, HttpServletRequest request){
		upass = MD5.getDigest(upass);
		List<Member> list = memberDAO.selectOne(uname,upass);
		if(list.size()==0){
			request.setAttribute("msg", "upasserr");
			return "login";
		}else{
			request.getSession().setAttribute("sessionmember", list.get(0));
			return "redirect:index.do";	
		}
	}
	
	//注册
	@RequestMapping("Register")
	public String Register(Member member, HttpServletRequest request){
		member.setUpass(MD5.getDigest(member.getUpass()));
		member.setYue(0.0);
		memberDAO.add(member);
		request.setAttribute("msg", "registersuc");
		return "login";
	}
	
	//检查用户名的唯一性
	@RequestMapping("checkUname")
	public void checkUname(String uname, HttpServletRequest request, HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			List<Member> list = memberDAO.checkUname(uname);
			if(list.size()==0){
				out.print(0);
			}else{
				out.print(1);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查找用户信息
	@RequestMapping("showMember")
	public String showMember(HttpServletRequest request){
		Member member  = (Member)request.getSession().getAttribute("sessionmember");
		String suc = request.getParameter("suc")==null?"":request.getParameter("suc");
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
		}
		
		Member m = memberDAO.findById(member.getId());
		request.setAttribute("member", m);
		
		
		List<Picture> pclist = pictureDAO.selectAll();
		List<News> newslist = newsDAO.selectAll();
		About about = aboutDAO.findById(1);
		//顶部三级分类
		List<Category> ctlist = categoryDAO.selectfatherAll();
		for(Category category:ctlist){
			List<Category> childlist = categoryDAO.selectchildAll(category.getId());
			category.setChildlist(childlist);
			for(Category childcategory:childlist){
				List<Category> minlist = categoryDAO.selectminAll(childcategory.getId());
				childcategory.setMinlist(minlist);
			}
		}
		if(suc.equals("suc")){
			request.setAttribute("suc", "编辑成功");
		}
		request.setAttribute("about", about);
		request.setAttribute("ctlist", ctlist);
		request.setAttribute("newslist", newslist);
		request.setAttribute("pclist", pclist);
			return "myinfo";
	}
	
	//修改个人信息
	@RequestMapping("memberinfoEidt")
	public String memberinfoEidt(Member member, HttpServletRequest request){
		member.setUpass(MD5.getDigest(member.getUpass()));
		List<Picture> pclist = pictureDAO.selectAll();
		List<News> newslist = newsDAO.selectAll();
		About about = aboutDAO.findById(1);
		//顶部三级分类
		List<Category> ctlist = categoryDAO.selectfatherAll();
		for(Category category:ctlist){
			List<Category> childlist = categoryDAO.selectchildAll(category.getId());
			category.setChildlist(childlist);
			for(Category childcategory:childlist){
				List<Category> minlist = categoryDAO.selectminAll(childcategory.getId());
				childcategory.setMinlist(minlist);
			}
		}
		memberDAO.update(member);
		request.setAttribute("about", about);
		request.setAttribute("ctlist", ctlist);
		request.setAttribute("newslist", newslist);
		request.setAttribute("pclist", pclist);
		return "redirect:showMember.do?suc=suc";
	}
	
	//退出
	@RequestMapping("Exit")
	public String Exit(HttpServletRequest request){
		request.getSession().removeAttribute("sessionmember");
		return "redirect:index.do";
	}
	
	
	//后台查询会员列表
	@RequestMapping("/admin/memberList")
	public String memberList(HttpServletRequest request) {
		String index = request.getParameter("index");
		String key = request.getParameter("key");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
   	    HashMap map = new HashMap();
		map.put("key", key);
		List<Member> list = memberDAO.selectAll(map);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/memberlist";
	}
	
	@RequestMapping("/admin/searchMember")
	public String searchMember(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Member> list = memberDAO.selectMember(key);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/membersearchlist";
	}
	
	//删除会员
	@RequestMapping("admin/memberDelAll")
	public String memberDelAll(HttpServletRequest request,HttpServletResponse response){
		String vals = request.getParameter("vals");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			memberDAO.delete(Integer.parseInt(val[i]));
		}
		return "redirect:memberList.do";
	}
	
	//查找会员等级
	@RequestMapping("/admin/showLev")
	public String showLev( int id, HttpServletRequest request){
		Member m = memberDAO.findById(id);
		request.setAttribute("member", m);
			return "admin/showlev";
	}
	
	//提升等级
	@RequestMapping("/admin/levUpate")
	public String levUpate(Member member, HttpServletRequest request){
		memberDAO.updateLev(member);
		return "redirect:memberList.do";
	}
	
	//查看余额
	@RequestMapping("yueMsg")
	public String yueMsg(HttpServletRequest request){
		
		//类别
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
		}
		//余额
		Member mmm = (Member)memberDAO.findById(member.getId());
		request.setAttribute("member", mmm);
		return "yuemsg";
	}
	
	
	//帐户充值
	@RequestMapping("chongzhi")
	public String yueMsg(Member member, HttpServletRequest request){
		Member mmm = (Member)memberDAO.findById(member.getId());
		double yue = member.getYue()+mmm.getYue();
		member.setYue(yue);
		memberDAO.update(member);
		return "redirect:yueMsg.do";
	}
	
	//找回密码
	@RequestMapping("findUpass")
	public String findUpass(Member member, HttpServletRequest request){
		HashMap map = new HashMap();
		map.put("uname", member.getUname());
		map.put("email", member.getEmail());
		List<Member> list = memberDAO.selectAll(map);
		if(list.size()==1){
			MailTest.sendmial("你的密码是:"+list.get(0).getUpass(),member.getEmail().toString());
			request.setAttribute("suc", "suc");
		}else{
			request.setAttribute("suc", "error");
		}
		return "findupass";
	}
	
	
}
