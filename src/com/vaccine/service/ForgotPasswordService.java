package com.vaccine.service;

import com.vaccine.dao.ForgotPasswordDao;

public class ForgotPasswordService {

	public boolean validate(String email, long phone) {
		ForgotPasswordDao forgotPasswordDao=new ForgotPasswordDao();
		
		return forgotPasswordDao.check(email,phone);
		
	}

}
