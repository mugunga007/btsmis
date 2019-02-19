package model;

import java.util.ArrayList;
import java.util.List;

import hibernateUtility.HibernateUtil;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import service.RemainingFuel;
import service.User;

public class RemainingFuelModel {

	
public boolean registerRemainingFuel(RemainingFuel p){
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			session.saveOrUpdate(p);
			tx.commit();
		}catch(Exception e){
			if(tx!=null)
				tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return true;
	}

public List<RemainingFuel> getRemainingFuelList(String genSetId, String userId){
	List<RemainingFuel> list = new ArrayList<>();
	Session session = HibernateUtil.openSession();
	Transaction tx = null;
	Criteria cr;
//	Property pro = new Property();
	try{
		
		tx = session.getTransaction();
		tx.begin();
	//	String released = "released";
cr = session.createCriteria(RemainingFuel.class);
		
		cr.add(Restrictions.eq("genSetId", genSetId));
		cr.add(Restrictions.eq("userId", userId));
		//cr.addOrder(Order.desc("id"));
		//cr.setMaxResults(8);
list = cr.list();
	tx.commit();
	}catch(Exception e){
		if(tx!=null)
			tx.rollback();
		e.printStackTrace();
	}finally{
		session.close();
	}
	return list;
}
	
}
