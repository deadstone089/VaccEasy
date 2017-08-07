package com.vaccine.Controller;

import static com.vaccine.service.OfyService.ofy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vaccine.entity.ChildDetailsEntity;
import com.vaccine.entity.ParentDetailsEntity;
import com.vaccine.service.LoginService;

@SuppressWarnings("serial")
public class LoginController extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		try {
			LoginService loginService = new LoginService();

			String email = req.getParameter("email");
			String password = req.getParameter("pass");
			String check = req.getParameter("check");
			if(check=="checked")
			{
			    Cookie id = new Cookie("email", email);
			    Cookie pass = new Cookie("pass",password);
			    id.setMaxAge(24*60*60*365);
			    resp.addCookie(id); 
			    resp.addCookie(pass);
			}

			if (loginService.check(email, password)) {
				HttpSession sess = req.getSession();
				ChildDetailsEntity cd = ofy().load().type(ChildDetailsEntity.class).id(email).now();
				ParentDetailsEntity pd = ofy().load().type(ParentDetailsEntity.class).id(email).now();
				sess.setAttribute("email", pd.email);
				sess.setAttribute("fName", pd.fName);
				sess.setAttribute("lName", pd.lName);
				sess.setAttribute("number", pd.mobno);
				sess.setAttribute("Cname", cd.name);
				sess.setAttribute("gender", cd.gender);
				sess.setAttribute("weight", cd.weight);
				sess.setAttribute("height", cd.height);
				sess.setAttribute("age", cd.age);
				resp.sendRedirect("index.jsp");
			} else
				resp.sendRedirect("invalid.jsp");

		} catch (Exception e) {
			resp.sendRedirect("404.jsp");
		}
	}
}
