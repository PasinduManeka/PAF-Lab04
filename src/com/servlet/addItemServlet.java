package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Items;
import com.service.addItemService;

/**
 * Servlet implementation class addItemServlet
 */
@WebServlet("/addItemServlet")
public class addItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("addItems.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String itemCode = request.getParameter("iCode");
		String itemName = request.getParameter("iName");
		float itemPrice = Float.parseFloat(request.getParameter("iPrice"));
		String itemDescription = request.getParameter("iDescription");
		
		 System.out.println(itemCode);
		Items it = new Items();
		it.setItemCode(itemCode);
		it.setItemName(itemName);
		it.setPrice(itemPrice);
		it.setDescription(itemDescription);
		
		addItemService add = new addItemService();
		add.addItem(it);
		
		
		RequestDispatcher dis = request.getRequestDispatcher("itemsView.jsp");
		dis.forward(request,response);
		
	}

}
