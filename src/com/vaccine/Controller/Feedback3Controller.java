package com.vaccine.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vaccine.service.Feedback3Service;

//import osahub.msit.SendMail;


public class Feedback3Controller extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {
resp.setContentType("text/plain");
resp.getWriter().println("Hello, world");
}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {
		
		String userEmail = req.getParameter("Email1");
		String userNumber = req.getParameter("Number1");
		String userFirstName = req.getParameter("FirstName");
		String userLastName = req.getParameter("LastName");
		String TextFeedback = req.getParameter("TextFeedback");
		String yesOrNo = req.getParameter("TextFeedback");
		String toaddress = "teekakaran@gmail.com";
	
		Feedback3Service mail = new Feedback3Service();
		mail.send(toaddress , "From " + userEmail , "name - " + userFirstName + "" + userLastName + "\n User number = "+ userNumber + "\n" + TextFeedback +"do you like our website " + yesOrNo);
		resp.sendRedirect("index.jsp");
//resp.getWriter().println("mail sent successfully to "+toaddress);
}

}