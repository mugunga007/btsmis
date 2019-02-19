 package model;

import hibernateUtility.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import service.AddFuel;
 

public class AddFuelModel{
	
	
public boolean registerFuel(AddFuel a){
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			session.saveOrUpdate(a);
			tx.commit();
		}catch(Exception e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return true;
	}}