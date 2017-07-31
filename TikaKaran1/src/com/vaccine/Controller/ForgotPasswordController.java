package com.vaccine.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vaccine.service.ChangePasswordService;
import com.vaccine.service.ForgotPasswordService;

@SuppressWarnings("serial")
public class ForgotPasswordController extends HttpServlet {
	long phone;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		res.setContentType("text/html");
		ForgotPasswordService forgotPasswordService=new ForgotPasswordService();
		String email=req.getParameter("email");
		try
		{
		phone=Long.parseLong(req.getParameter("num"));
		}
		catch(NumberFormatException n)
		{
		System.out.println(phone);
		}
		String pass=req.getParameter("pass");
		String pass1=req.getParameter("pass1");
		
		if(forgotPasswordService.validate(email,phone))
		{

			if(pass.equals(pass1))
			{
				ChangePasswordService changePasswordService=new ChangePasswordService();
						changePasswordService.change(email,pass);
						
						res.getWriter().println("password changed succesfully");			}
			else
				res.getWriter().println("Passwords Do not match");
				
		}
		else
			res.getWriter().println("Email and Phone Number Don't Match");
		
	}

}
