package com.vaccine.dao;
import static com.vaccine.service.OfyService.ofy;
import com.vaccine.entity.LoginDetailsEntity;
public class ChangePasswordDao {

	public void changePassword(String email,String pass) {
	ofy().delete().type(LoginDetailsEntity.class).id(email);
	LoginDetailsEntity ld=new LoginDetailsEntity(email,pass);
		ofy().save().entities(ld);
		ofy().clear();
		
	}

}
