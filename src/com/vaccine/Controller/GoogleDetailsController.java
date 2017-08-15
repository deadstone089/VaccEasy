package com.vaccine.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GoogleDetailsController  extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String fname= req.getParameter("first_name");	
		String lname=req.getParameter("last_name");
		String email=req.getParameter("email");
		HttpSession s = req.getSession();
		
		s.setAttribute("email_id", email);
		s.setAttribute("first_Name", fname);
		s.setAttribute("last_Name", lname);
		resp.sendRedirect("MobileNumberDetails.jsp");
		
	}
}
