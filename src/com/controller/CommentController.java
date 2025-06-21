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

import java.util.*;

@Controller
public class CommentController extends BaseController {
	@Resource
	CommentDAO commentDAO;
	@Resource
	MemberDAO memberDAO;
	
	//后台查询评论列表
	@RequestMapping("member/commentList")
	public String commentList(int productid, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Comment> list = commentDAO.selectProduct(productid);
		for(int i=0;i<list.size();i++){
			Member member = memberDAO.findById(list.get(i).getMemberid());
			list.get(i).setMember(member);
		}
		request.setAttribute("list", list);
		request.setAttribute("productid", productid);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "member/commentlist";
	}
	
	//后台删除评论
	@RequestMapping("member/commentDelAll")
	public void commentDelAll(HttpServletRequest request,HttpServletResponse response) {
		String vals = request.getParameter("vals");
		String productid = request.getParameter("productid");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			commentDAO.delete(Integer.parseInt(val[i]));
		}
		request.setAttribute("productid", productid);
	}
	
	//回复评论
	@RequestMapping("member/commentReply")
	public String commentReply(int id, HttpServletRequest request) {
		String replycontent = request.getParameter("replycontent");
		Comment ct = (Comment)commentDAO.findById(id);
		ct.setReplycontent(replycontent);
		commentDAO.update(ct);
		return "redirect:commentList.do?productid="+ct.getProductid();
	}

}
