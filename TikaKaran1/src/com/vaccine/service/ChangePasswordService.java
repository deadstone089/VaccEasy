package com.vaccine.service;

import com.vaccine.dao.ChangePasswordDao;

public class ChangePasswordService {

	public void change(String email,String pass) {
		ChangePasswordDao changePasswordDao=new ChangePasswordDao();
		changePasswordDao.changePassword(email,pass);
		
	}

}
