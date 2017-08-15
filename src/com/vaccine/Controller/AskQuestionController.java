package com.vaccine.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vaccine.service.AskQuestionService;

//import osahub.msit.SendMail;


public class AskQuestionController extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {
resp.setContentType("text/plain");
resp.getWriter().println("Hello, world");
}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {
		
		String email2 = req.getParameter("email2");
		//String userNumber = req.getParameter("Number1");
		String UserName = req.getParameter("UserName");
		//String userLastName = req.getParameter("LastName");
		String AskQuestion1 = req.getParameter("AskQuestion1");
		//String yesOrNo = req.getParameter("TextFeedback");
		String toaddress = "teekakaran@gmail.com";
	
		AskQuestionService mail = new AskQuestionService();
		//mail.send(toaddress , "From " + userEmail , "name - " + userFirstName + "" + userLastName + "\n User number = "+ userNumber + "\n" + TextFeedback +"do you like our website " + yesOrNo);
		mail.send(toaddress , "From " + email2 , "name - " + UserName + "\n user Message = " + AskQuestion1);
		//System.out.println("abcd");
		resp.sendRedirect("/index.jsp");
		
//resp.getWriter().println("mail sent successfully to "+toaddress);
}

}