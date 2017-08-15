package com.vaccine.Controller;

import java.io.IOException;


import javax.servlet.http.*;
import com.vaccine.service.*;

@SuppressWarnings("serial")
public class GoogleSignInController extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse resp) throws IOException {
		try{
			 HttpSession sess=request.getSession();
			LoginDetailService loginDetailService = new LoginDetailService();
			ParentDetailService parentDetailService=new ParentDetailService();
			long number=Long.parseLong(request.getParameter("phone"));
			
			String pass = request.getParameter("pass");
			String fName = (String) sess.getAttribute("first_Name");
			String lName = (String) sess.getAttribute("last_Name");
			String email = (String) sess.getAttribute("email_id");
			

			 
			if(loginDetailService.alreadyExist(email))
			{
				
				resp.getWriter().println("exist.jsp");
			}
			
			else
			{
				 
				sess.setAttribute("email",email);
				sess.setAttribute("fName", fName);
				sess.setAttribute("lName", lName);
				sess.setAttribute("number", number);
				sess.setAttribute("pass", pass);
				loginDetailService.signup(email,pass,email);
				parentDetailService.signup(email,fName,lName,number);
					
			}
			resp.sendRedirect("loginChild.jsp");
		} catch (Exception e) {
			resp.sendRedirect("404.jsp");
		}
		
	}
}
