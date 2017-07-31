package com.vaccine.dao;

import com.vaccine.entity.ParentDetailsEntity;
import static com.vaccine.service.OfyService.ofy;
public class ForgotPasswordDao {

	public boolean check(String email, long phone) {
		
		ParentDetailsEntity pd=ofy().load().type(ParentDetailsEntity.class).id(email).now();
			if(pd!=null)
			{
				if(pd.mobno==phone)
					return true;
				else
					return false;
			}
		
			else
				return false;
	}

}
